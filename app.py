from flask import Flask, render_template, redirect, url_for, request, session, flash
from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField,SubmitField, RadioField
from wtforms.validators import DataRequired, Email, ValidationError
from flask_mysqldb import MySQL



app = Flask(__name__)
# Configure MySQL connection
app.config['MYSQL_HOST'] =  'localhost'
app.config['MYSQL_USER'] = 'admin'
app.config['MYSQL_PASSWORD'] = 'Admin.51214'
app.config['MYSQL_DB'] = 'portfoliodb'
app.config['MYSQL_PORT'] = 3307

# app.secret_key = 'your_secret_key_here'

mysql = MySQL(app)


class registerForm(FlaskForm):
    userName = StringField("UserName", validators=[DataRequired()])
    firstName = StringField("FirstName", validators=[DataRequired()])
    lastName = StringField("LastName", validators=[DataRequired()])
    email = StringField("Email", validators=[DataRequired(), Email()])
    contact_No = StringField("Contact Number", validators=[DataRequired()])
    gender = RadioField("Gender", choices=[('Male', 'Male'), ('Female', 'Female'), ('Other', 'Other')], validators=[DataRequired()])
    submit = SubmitField("Submit")


class loginForm(FlaskForm):
    userName = StringField("UserName", validators=[DataRequired()])
    password = PasswordField("password", validators=[DataRequired()])
    submit = SubmitField("Submit")


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['POST','GET'])
def register():
    form = registerForm()
    if form.validate_on_submit():
        userName = form.userName.data
        firstName = form.firstName.data
        lastName = form.lastName.data
        contact_No = form.contact_No.data
        gender = form.gender.data
        email = form.email.data
        

        # store data into database
        cursor = mysql.connection.cursor()
        cursor.execute('''INSERT INTO registration (userName, firstName, lastName, email, contact_No, gender) VALUES (%s, %s, %s, %s, %s, %s)''', (userName, firstName, lastName, email, contact_No, gender))

        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('login'))

        
    return render_template('register.html', form=form)

@app.route('/login', methods=['POST','GET'])
def login():
    form = loginForm()
    if form.validate_on_submit():
        userName = form.userName.data
        password = form.password.data

        # Check if the username exists in the registration table
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM registration WHERE userName = %s", (userName,))
        existing_user_registration = cursor.fetchone()
        cursor.close()

        # Check if the username exists in the user_info table
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM user_info WHERE userName = %s", (userName,))
        existing_user_info = cursor.fetchone()
        cursor.close()

        if existing_user_registration and not existing_user_info:
            # If the username exists in registration but not in user_info, proceed with insertion
            cursor = mysql.connection.cursor()
            cursor.execute('''INSERT INTO user_info (userName, password) VALUES (%s, %s)''', (userName, password))
            mysql.connection.commit()
            cursor.close()

            # Fetch the newly inserted user from user_info
            cursor = mysql.connection.cursor()
            cursor.execute("SELECT * FROM user_info WHERE userName = %s", (userName,))
            user = cursor.fetchone()
            cursor.close()

            session['user_id'] = user[0]
            flash(f'Welcome, {userName}!')
            return redirect(url_for('login'))
        elif existing_user_info:
             if password == existing_user_info[2]:
            # If the username already exists in user_info, proceed with login
                session['user_id'] = existing_user_info[0]
                flash(f'Welcome, {userName}!')
                return redirect(url_for('login'))
             else:
                flash('Wrong username and password.')
        else:
            flash('Username does not exist. Please register first.')

    return render_template('login.html', form=form)
     

if __name__ == '__main__':
    app.run(debug=True)
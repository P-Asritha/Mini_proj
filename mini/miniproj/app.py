from flask import Flask,render_template,request,redirect
from flask_login import login_required, current_user, login_user, logout_user
from models import UserModel,db,login
from flask import *
from random import *
from flask_mail import *
import re
import sqlalchemy as dbsql
from datetime import datetime, date
 
app = Flask(__name__)
app.secret_key = 'xyz'
 
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///userbase.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

#import the db and change to your mysql username and password
#mysql -u root -p <dbname> < <path> (import)
engine = dbsql.create_engine("mysql+pymysql://root:password123@localhost/lib")
connection = engine.connect()
metadata = dbsql.MetaData()
subjects = dbsql.Table('subjects', metadata, autoload=True, autoload_with=engine)
books = dbsql.Table('books', metadata, autoload=True, autoload_with=engine)
profile = dbsql.Table('profile', metadata, autoload=True, autoload_with=engine)


mail = Mail(app)
app.config["MAIL_SERVER"]='smtp.gmail.com'
app.config["MAIL_PORT"]=465
app.config["MAIL_USERNAME"]='librarymjcett@gmail.com'
app.config['MAIL_PASSWORD']='Password@123'
app.config['MAIL_USE_TLS']=False
app.config['MAIL_USE_SSL']=True
mail = Mail(app)
 
otp=randint(000000,999999)
 
db.init_app(app)
login.init_app(app)
login.login_view = 'login'
 
@app.before_first_request
def create_all():
    db.create_all()
     
@app.route('/')
def home():
    if current_user.is_authenticated:
        return redirect('/sem1')
    return render_template('Home.html')
 
 
@app.route('/login', methods = ['POST', 'GET'])
def login():
    if current_user.is_authenticated:
        return redirect('/sem1')
     
    if request.method == 'POST':
        email = request.form['lemail']
        user = UserModel.query.filter_by(email = email).first()
        if user is not None and user.check_pass_hash(request.form['lpwd']):
            login_user(user)
            return redirect('/sem1')
     
    return render_template('login.html')
 
@app.route('/signup', methods=['POST', 'GET'])
def signup():
    if current_user.is_authenticated:
        return redirect('/sem1')
     
    if request.method == 'POST':
        email = request.form['semail']
        username = request.form['sname']
        password = request.form['spwd']
        confirm = request.form['cspwd']

        mail_match = re.search("[0-9]+@mjcollege.ac.in", email)

        if password == confirm:
            if mail_match:
                if UserModel.query.filter_by(email=email).first():
                    return render_template('signup.html',message='Email already Present')
                
                if email != "" and username !="" and password != "":
                    msg=Message('OTP',sender='librarymjcet@gmail.com',recipients=[email])
                    msg.body=str(otp)
                    mail.send(msg)
                    return render_template('validate.html', cred=[username, email, password])
                return render_template("signup.html", message='Enter all credentials')
            return render_template("signup.html",message="You can only use the College Mail to register!")
        return render_template("signup.html",message="The Passwords don't match!")
    return render_template('signup.html')
 
@app.route('/validate', methods=['POST', 'GET'])
def validate():
    if current_user.is_authenticated:
        return redirect('/sem1')

    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        lotp = request.form['otp']

        if int(lotp) == otp:
            user = UserModel(email=email, username=username)
            user.set_pass_hash(password)
            db.session.add(user)
            db.session.commit()
            login_user(user)
            return redirect('/sem1')
        return render_template("validate.html",message="Incorrect OTP")
    return render_template("validate.html")


@app.route('/logout')
def logout():
    logout_user()
    return redirect('/')

@app.route('/sem1')
@login_required
def sem():
    return render_template('sem1.html')

@app.route('/sem<number>', methods=['POST', 'GET'])
@login_required
def semesters(number):
    ResultSet = get_subjects(number)
    id_arr = [str(x[0]) for x in ResultSet]
    print(id_arr)

    if request.method == "POST":

        for i in id_arr:
            sub = request.form.get(i)
            if sub is not None:
                break
        ResultSet1 = get_books(sub)
        return render_template("sem.html", rs=ResultSet, rs1=ResultSet1, sem=number)


    return render_template("sem.html", rs=ResultSet, sem=number)


@app.route('/profile')
@login_required
def profile():
    mail = current_user.email
    username = current_user.username
    rollno = mail[:12]
    rs = get_profile(rollno)
    dd = date.today()
    fine = days_between(rs.due_date, dd)
    return render_template("profile.html", info=[mail, username, rollno, fine], rs=rs)


@app.route('/misc')
@login_required
def misc():
    return render_template("misc.html")


@app.route('/sem<number>/search', methods=['POST', 'GET'])
def search(number):
    number = int(number)
    if request.method == 'POST':
        query = request.form['q'].lower()

        rs = get_subjects(number)
        search_results = get_searches(query, number)
        
        return render_template('sem.html', sem=number, rs1=search_results, rs=rs)
    return redirect(f'/sem{number}')

#-------------------------------------------------------------------

def get_subjects(number):
    query = dbsql.select([subjects.columns.id, subjects.columns.subject])
    query = query.where(subjects.columns.semester == number)
    ResultProxy = connection.execute(query)
    ResultSet = ResultProxy.fetchall()
    return ResultSet

def get_profile(rollno):
    query = dbsql.select([profile.columns.book_name, profile.columns.book_author, profile.columns.issue_date, profile.columns.due_date])
    query = query.where(profile.columns.rollno == rollno)
    ResultProxy = connection.execute(query)
    ResultSet = ResultProxy.fetchall()
    return ResultSet 

def get_books(sub):
    query = dbsql.select([books.columns.book_name, books.columns.book_author, books.columns.stock])
    if type(sub) == str:
        query = query.where(books.columns.sub_id == int(sub))
    else:
        query = query.where(subjects.columns.id == books.columns.sub_id and subjects.columns.semester == sub)
        
    ResultProxy = connection.execute(query)
    ResultSet = ResultProxy.fetchall()
    return ResultSet

def get_searches(query, number):
    query = query.split(' ')
    query = f".*{'.*'.join(query)}.*"
    search_results = []
    rs1 = get_books(number)
    for i in rs1:
        print(i)
        s = "".join(i).lower()
        match = re.findall(query, s)
        if match:
            search_results.append(i)
    return search_results

def days_between(d1, d2):
    d1 = datetime.strptime(d1, "%Y-%m-%d")
    d2 = datetime.strptime(d2, "%Y-%m-%d")
    return abs((d2 - d1).days)
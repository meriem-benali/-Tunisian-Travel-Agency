from django.shortcuts import render
from django.shortcuts import redirect
from .models import *
from django.contrib.auth.models import  auth,User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
import datetime
from django.contrib.auth.hashers import make_password #cryp
from django.contrib.auth.decorators import user_passes_test
from django.contrib import messages
from main.utils import send_email

# Login page (for users and admins)
def Login(request):
    if request.method=='POST':
        # Get the username and password
        username_user=request.POST['username']
        password_user=request.POST['password']
        user=auth.authenticate(request,username=username_user,password=password_user)
        # If username and password is correct
        if user is not None:
            auth.login(request,user)
            if request.user.is_staff:
                # If is admin redirect to admin dashboard
                return redirect('/support/dashboard')
            else:
                # If is not aadmin redirect to home page
                return redirect('/home')
        else:
            # If username or password is incorrect
            invalid_login= "Nom d'utilisateur ou mot de passe incorrect"
            return render(request, "loginpage1.html", {"invalid_login": invalid_login})
    return render(request,'loginpage1.html')

# Dashboard (Only Admins)
@user_passes_test(lambda u: u.is_staff)
@login_required(login_url='/login/')
def Dashboard(request):
    Hotels = Hotel.objects.all()
    Monements = Monement.objects.all()
    Caferesto = RestoCafe.objects.all()
    Users = User.objects.all()
    Reservations = Reservation.objects.all()
    return render(request, "admin/index.html", {
                                                     "Hotels":Hotels,
                                                     "Caferesto": Caferesto,
                                                     "Monements":Monements,
                                                     "Users":Users,
                                                     "Reservations":Reservations
                                                     })
    


# Logout
def Logout(request):
    logout(request)
    return redirect('/login/')



def AllReservations(request):
    AllReservations = Reservation.objects.all()
    Hotels = Hotel.objects.all()
    User = AuthUser.objects.all()
    Caferesto = RestoCafe.objects.all()
    return render(request, "admin/reservation.html", {"AllReservations":AllReservations,
                                                     "Hotels":Hotels,
                                                     "Caferesto": Caferesto,
                                                     "users":User
                                                     })
    
    
def AllUsers(request):
    AllUser = AuthUser.objects.all()

    return render(request, "admin/user.html", {
                                                     "AllUsers":AllUser
                                                     })
    
    
    


# Create new account for tunisian users
def CreateUser(request):
    if request.method=='POST':
        # Get informations from the form
        name=request.POST['name']
        surname=request.POST['surname']
        email=request.POST['email']
        password=request.POST['password']
        phone=request.POST['phone']
        city=request.POST['city']
        # creation informations in database
        created_account = AuthUser.objects.create(
            # Create username
            username= (name+"_"+surname).lower(),
            is_staff=0,
            is_active=1,
            date_joined=datetime.datetime.now(),
            is_superuser= 0,
            first_name= name,
            last_name= surname,
            email= email,
            # Make hashed password for sécurity
            password= make_password(password),

            phone=phone,
            city=city,
        )
        # If account is created succesfuly , redirect to login page
        if created_account:
            return redirect("/login/")
    return render(request,"signupTun.html")

# Create new account for foreign users
def CreateUserf(request):
    if request.method=='POST':
        # Get informations from the form
        name=request.POST['name']
        surname=request.POST['surname']
        email=request.POST['email']
        password=request.POST['password']
        country=request.POST['country']
        passport=request.POST['passport']
        # Insert informations in database
        created_account = AuthUser.objects.create(
            # Create username
            username= (name+"_"+surname).lower(),
            is_staff=0,
            is_active=1,
            date_joined=datetime.datetime.now(),
            is_superuser= 0,
            first_name= name,
            last_name= surname,
            email= email,
            # Make hashed password for sécurity
            password= make_password(password),

            country=country,
            passport=passport,
        )
        # If account is created succesfuly , redirect to login page
        if created_account:
            return redirect("/login/")
    return render(request,"signupfor.html")

# Show all regions data
def Regions(request):
    # Get the region name from the path (using [:-1] for remove the last path slash)
    region_path = (request.GET.get('name'))[:-1]
    region = Region.objects.all().filter(path=region_path).first()
    carrousel = Image.objects.all().filter(region=region_path)
    CafeResto = RestoCafe.objects.all().filter(region=region_path)
    hotels = Hotel.objects.all().filter(region=region_path)
    monements = Monement.objects.all().filter(region=region_path)
    return render(request, "TUNIS.html",{"region": region, "carrousel": carrousel,
                   "hotels":hotels, "caferesto":CafeResto, "monements": monements,})

# Create new reservation
def Reservations(request):
    # Get the type and id (hotel, coffe, etc..)
    restype = request.GET.get('type')
    typeid = request.GET.get('id')
    if request.method == "POST":
        # Get all user informations
        client_id=request.user.id
        name=request.POST['name']
        surname=request.POST['surname']
        email=request.POST['email']
        phone=request.POST['phone']
        reservation_date=request.POST['reservation_date']
        number_of_adult=request.POST['number_of_adult']
        number_of_children=request.POST['number_of_children']
        # Insert informations on database
        reserved = Reservation.objects.create(
            client_id= client_id,
            name= name,
            surname= surname,
            email= email,
            phone= phone,
            date= reservation_date,
            adult= number_of_adult,
            children= number_of_children,
            type = restype,
            type_id=typeid,
            created_at = datetime.datetime.now()
        )
        if reserved:
            send_email(context={'email':email,'date':reservation_date})
            # If reservations created successfuly , redirect to my profile page
            return redirect("/profile/")
    return render(request, "reservation.html")


# Page my reservations for users
@login_required(login_url="/login/")
def UserProfile(request):
    # Update user profile
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        password = request.POST['password']
        # problem when password is none ! 
        user = User.objects.filter(id = request.user.id).update(
            first_name = first_name,
            last_name = last_name,
            email = email,
            password = make_password(password),
        )
        message = messages.success(request, 'Votre profil a été mis a jour!')

    # Annuler la reservation
    if request.GET.get('delete') is not None:
        reservation_id = request.GET.get('delete')
        Reservation.objects.filter(id=reservation_id).delete()
        message = messages.success(request, 'Votre réservation à été annuler avec success !')
        return redirect('/profile/')

        
    AllReservations = Reservation.objects.all().filter(client_id=request.user.id)
    Hotels = Hotel.objects.all()
    Caferesto = RestoCafe.objects.all()
    return render(request, "profile.html", {"AllReservations":AllReservations,
                                                     "Hotels":Hotels,
                                                     "Caferesto": Caferesto
                                                     })

            
    
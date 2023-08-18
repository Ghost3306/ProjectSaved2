from django.shortcuts import render
from django.http import *
from django.contrib import auth
from django.contrib.auth.models import User
from polls import CrMLData 
from .CrMLData import *
from django.utils import timezone
from .db import *
from .file import *
from .send_mail import *
from .timeD import *
from django.contrib.messages import constants as messages
from django.contrib import messages
import datetime
# Create your views here.
name = "not found"
def chat(request):
    d = read_status()
    if d =="false":
        return HttpResponseRedirect("login")
    user = read_file()
    print("user",user)
    nameF = ""
    for i in user:
        if i == " ":
            break
        nameF+=i
    data = {
        'username':user,
        'name':nameF
    }
    if request.method == 'POST':
        message = request.POST.get('message')

        print("Entered Message is : ",message)
        word = "subject : complaint"
        if word in message:
            if send_mail(message):
                res =['Your complaint send successful', 'ret']
                return JsonResponse({'message': message, 'response': res})
        if "schoolarship name" in message:
            scname=message.replace("schoolarship name : "," ")
            rs = sch_ins(scname)
            if rs:
                res =['Your application submitted successful', 'ret']
                return JsonResponse({'message': message, 'response': res})
        
        

        if len(message)==4:
            print("otp detected")
            otp = read_otp()
            if message==otp:
                res =['Enter your new password below', 'getpass']
                return JsonResponse({'message': message, 'response': res})
        if "password : " in message:
            passw= message.replace("password : ","")  
            print("new password is",passw)
            update_pass(passw)
            res =['Your password update successfully', 'passup']
            return JsonResponse({'message': message, 'response': res})
        if "Suggestion" in message:
            if send_mail(message):
                res =['I will implement your suggestion', 'ret']
                return JsonResponse({'message': message, 'response': res})

        if "Issue" in message:
            if send_mail(message):
                res =["I've try to fix your issues", 'ret']
                return JsonResponse({'message': message, 'response': res})
        res = response(message)
        tag = res[1]
        print("tag :",tag)
        if tag =="holiday":
             data = get_holidays()
             print("data received",data)
             return JsonResponse({'message': message, 'response': res,'holidays':data})
        if tag=="resultall":
            data = get_res()
            return JsonResponse({'message': message, 'response': res,'result':data})
        if tag =="resultme":
            data = get_my_res()
            print("my result",data)
            return JsonResponse({'message': message, 'response': res,'result':data})
        if tag=="schoolarshipadd":
            ret = "Here a list <br>"+list_sch()
            res = [ret,tag]
            #res =[ret, tag]
            
            return JsonResponse({'message': message, 'response': res,'result':data})
        if tag=="mySchoolarshipRes":
            res = [check_sch_res(),tag]
            return JsonResponse({'message': message, 'response': res})
    
        if tag=="allSchoolarshipRes":
            res = [all_sch_res(),tag]
            return JsonResponse({'message': message, 'response': res})
        
        if tag=="resetpass":
            id = get_email()[0][1]
            data = send_otp()
            email_send(id,data)
            print(id,data)
        if tag=="admission":
            new_admission()
            res = ["You enrolledment is successful\nYou will be inform for further information",tag]
            return JsonResponse({'message': message, 'response': res})
        
        if tag=="canadmission":
            canaddmission()
            res = ["Your admission cancel successfully",tag]
            return JsonResponse({'message': message, 'response': res})
        if tag=="feestructure":
            ret = "Heres a result<br>"+get_fee()
            res = [ret,tag]
            return JsonResponse({'message': message, 'response': res,'fee':data})
        if tag=="fascility":
            res=["Heres what we offers","Cafeteria","Library","Laboratory","Big ground","Sports",
                 "Computer Lab","Internet over campus","Campus Interview","fascility"]
            return JsonResponse({'message': message, 'response': res})
        
        if tag == "morning":
            res = [check_gm(),tag]
            return JsonResponse({'message': message, 'response': res})
        if tag == "afternoon":
            res = [check_ga(),tag]
            return JsonResponse({'message': message, 'response': res})
        if tag == "evening":
            res = [check_ge(),tag]
            return JsonResponse({'message': message, 'response': res})
        if tag == "night":
            res = [check_gn(),tag]
            return JsonResponse({'message': message, 'response': res})
        
        #detecting extra basic features 
        if tag == "time":
            res=[time_now(),tag]
            return JsonResponse({'message': message, 'response': res})
        if tag == "date":
            res=[date_now(),tag]
            return JsonResponse({'message': message, 'response': res})
        if tag == "datetime":
            res=[datetime_now(),tag]
            return JsonResponse({'message': message, 'response': res})




        return JsonResponse({'message': message, 'response': res})
    
        
    return render(request, 'index.html',data)

def reg(request):
    return render(request,"register.html")


def login(request):
    write_status("false")
    if request.method=="POST":
        
        res = request.POST

        user  = res.get("user")
        password = res.get("pass")
        print(user,password)
        result = verify(user,password)
        if result:
            nm = get_name(user)[0]
            print('nm',nm)
            write_file(nm)
            print("user name write successful")
            write_status("true")
            print(result)
            
          
            print("name:",name[0])
            return HttpResponseRedirect("chat")
        else:
            messages.success(request, 'Invalid Username or password') 
            return HttpResponseRedirect("login")
            
        
    return render(request,'loginindex.html')       
    
def register(request):
    if request.method=="POST":
        res=request.POST
        print("res",res)
        name = res.get("firstname")+" "+res.get("middlename")+" "+res.get("lastname")
        email = res.get("email")
        phone = res.get("phone")
        dob = res.get("dob")
        address = res.get("address")
        create_pass = res.get("crpass")
        confirm_pass = res.get("cnpass")
        gender= res.get("gender")

        print(name,email,phone,dob,address,create_pass,gender)
        if create_pass==confirm_pass:
            result = reg_user(name,email,phone,dob,address,create_pass,gender)
            return HttpResponseRedirect("login")
    return render(request,"regindex.html")

def res(request):
    res = get_res()
    return render(request,'result.html')

def new(request):
    return render(request,"index.html")

def launch(request):
    return HttpResponseRedirect("login")
def gallery(request):
    return render(request,"imagegallery.html")




def forgotPass(request):
    if request.method=="POST":
        email = request.POST.get("emailtxt")
        print(email)
        res = verify_email(email)
        print("res : ",res)
        if res==True:
            write_file(email)
            email_send(email,send_otp())
            return HttpResponseRedirect("otpverify")
        else:        
            return HttpResponseRedirect("forgot")
    return render(request,"forgot.html")

def otpv(request):
    
        
    return render(request,"otpverify.html")

def createP(request):
    if request.method=="POST":
        crpass = request.POST.get("crpass")
        cnpass = request.POST.get("cnpass")
        
        if crpass == cnpass:
            messages.success(request, 'Your password was updated successfully!') 
            
            return HttpResponseRedirect("login")
        
        else:
            messages.success(request, 'Your failed password was updated successfully!') 
            
    return render(request,"createPass.html")

def reset(request):
    context={
        'title':'Email Verification',
        'gateway':"emailverification",
        }
    if request.method=='POST':
        email = request.POST.get('emailtxt')
        print(email)
        res = verify_email(email)
        if res==True:
            write_file(email)
            email_send(email,send_otp())
            print('otp send successfully')
            context={
                'title':'OTP Verification',
                'gateway':"otpverify",
            }
            return render(request,'passwordreset.html',context)
        get_otp = request.POST.get('otp')
        local_otp = read_otp()
        print('get_otp : ',get_otp,' local_otp : ',local_otp)
        if get_otp == local_otp:
            print('otp match successful')
            context={
                'title':'Create Password',
                'gateway':"createpass",
            }
            return render(request,'passwordreset.html',context)
        create_pass = request.POST.get('crpass')
        confirm_pass = request.POST.get('cnpass')
        if create_pass == confirm_pass:
            print('password update successfully')
            res = change_pass(create_pass)
            print(res)
            if res ==True:
                print('password update successful')
                messages.success(request, 'Your password was updated successfully!')            
                return HttpResponseRedirect("login")
            else:
                return render(request,'passwordreset.html')

    return render(request,'passwordreset.html',context)


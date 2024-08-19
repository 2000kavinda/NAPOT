# napot

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# NAPOT.
"NSBM All Portal"<br>
<img width="190" alt="Screenshot 2023-08-08 at 15 35 25" src="https://github.com/2000kavinda/NAPOT./assets/98000159/48b240af-bd20-4c0e-a90b-2f2a521f83b4">

<a href="https://drive.google.com/file/d/1cC6guzPNV7Puz0fy87diFaXsz6a8I_bL/view?usp=sharing">Short video "How NAPOT Application works"</a>
<br><br>

<h1>Summary from full report</h1>
<h2>Introduction</h2>
<p>main concept
"One app for the all parties of NSBM"
NAPOT is our designed mobile application for managing all parties and their tasks at one place. The extended name of NAPOT is NSBM All Portal. Name also implies the "all can access one place for fulfill their requirements in NSBM Green University". when we designing this application we mainly considered what are the problems faced by students and what are the new features available in international and local university applications. We do a research about those stuffs and we add those functionalities to our application design. This application can be considered as the extended mobile version of NSPOT and we used university color theme (blue, green & white) when designing.
In this application, we considered security concerns and we give access to the functions accordingly to the correct parties. Following accounts are the pre defined default account :-
Admin
Canteen person Librarian
Guest
Other parties can use system after creating account in the system with some restriction levels because of security concerns.
We hope to use following technologies in our development process of this application.</p>
<div>
  
![image](https://github.com/2000kavinda/NAPOT./assets/98000159/805062a4-dd17-439f-8c35-6af8ebaa5784)

</div>
<br><br>
<h3>Problem Identification</h3>
<p>
1. Students have to search here and there to find their exam results (because they are send via outlook mail) and the other thing is if we want to get the hard copy of result sheets , then we have to follow a very lengthy process (do appointments, waiting for the dates, standing in the queues).<br>
2. Students have to maintain another profile such as LinkedIn for going to the interviews. If we can add those functionalities to the existing NSBM student profile, it is easy for students.<br>
3. When we want to change our personal details of the student profile, we have to go to the front office or it department to do the process.<br>
4. There is no way to order foods or check the availability of the items in the canteen.<br>
5. No way to book the library study place and students have to go there to full fill that requirement.<br>
6. Lengthy process for doing complains.<br>
7. No way to track the shuttle service or bus service of NSBM.<br>
</p>
<br><br>

<h3>Proposed Solution</h3>
<p>
1. Students have to search here and there to find their exam results (because they are send via outlook mail) and the other thing is if we want to get the hard copy of result sheets , then we have to follow a very lengthy process (do appointments, waiting for the dates, standing in the queues).<br>
2. Students have to maintain another profile such as LinkedIn for going to the interviews. If we can add those functionalities to the existing NSBM student profile, it is easy for students.<br>
3. When we want to change our personal details of the student profile, we have to go to the front office or it department to do the process.<br>
4. There is no way to order foods or check the availability of the items in the canteen.<br>
5. No way to book the library study place and students have to go there to full fill that requirement.<br>
6. Lengthy process for doing complains.<br>
7. No way to track the shuttle service or bus service of NSBM.<br>
</p>
<br><br>

<h3>Features</h3>
<div>
  
  <p>
    Newly added features to the app by the research of foreign and some local university applications. We added following new feature to our application.<br><br>
Virtual tour<br>
QR Scanner<br>
My timetable<br>
Online food order from canteen Library Room Booking<br>
NSBM Shuttle Booking Complains page<br>
Post graduate Life page Chat option<br>
Question and answer discussion page Student Profile Like LinkedIn profile Event Calendar<br>
Add student Searching feature to the lecturers<br><br>
And we added same as the current existing function that are available in the web version of NSPOT (student dashboard(Nlearn), studet profile, courses and etc)
background.
  </p>
</div>

<h3>Requirement</h3>
<h4>Non-Functional Requirement</h4>
<p>
  This app is mostly same as the mobile version of NSPOT and we extend it for all parties of the NSBM in our application. When we design the interfaces of our app we mainly focused NSBM University color themes (green, blue and white color theme). And also consider the simplicity of the interfaces because we have to do the process in small mobile screen. Another thing is we add already existing application used logos, icons and functions in our app for increasing the user experience. This application can easily access with any mobile device because application is compatible with both android and IOS platforms.<br><br>
Newly added features to the app by the research of foreign and some local university applications<br><br>
Virtual tour<br> My timetable<br> Eat & Drink<br> Library<br><br>
Same as we added current existing function that are available in the web version of NSPOT (student dashboard (Nlearn), student profile, courses and etc.) for feeling familiarity to users with the existing app.
Functional requirements are described by following use case diagram, DFD and interfaces descriptions.
</p>
<br><br><br>
<h3>Use Case Diagram
</h3>
<br>

![use_case drawio-1](https://github.com/2000kavinda/NAPOT./assets/98000159/858e185a-1d62-430e-8df9-08f691fb1103)
![use_case drawio-2](https://github.com/2000kavinda/NAPOT./assets/98000159/e3299bc3-340a-42b8-9309-ea1304ca0959)
![use_case drawio-3](https://github.com/2000kavinda/NAPOT./assets/98000159/0586b325-bd68-42e9-a477-50c0011eef88)
![use_case drawio-4](https://github.com/2000kavinda/NAPOT./assets/98000159/bba724c3-3700-4bfb-8d2f-f35019bf1a5b)

<br>
<a href="https://drive.google.com/file/d/1d10Gk66QthiG14PUd-yLrex8VxUo7coo/view">View full use case diagram</a>
<br><br>
<P>
  This use case enables users to log into the system and access the appropriate functionalities according to their role. The various user roles are lecturer, Admin, student, canteen, librarian and guest. To login to the system, lecturer, student, Admin, canteen and librarian must enter their unique username and password. Cleaning staff and security staff can enter the system using guest mode.
There are six main actors,<br><br>
Lecturer<br>
Student<br>
Admin<br>
Canteen<br>
Librarian<br>
Guest (Cleaning staff, security staff and other)<br><br>
Lecturers can access the Today schedule, Timetable, manage lecture materials,3rd party service, enter mark, Submission manage, Complain, Notification, Search students.<br>
Students can access Explore Nsbm, Virtual tour (uni map), Profile (like LinkedIn profile), Course plan, my courses, Eat & drink, library, Calendar & even, Student Shuttle and 3rd party services. They can use the help desk to ask questions and solve their problems. And also, they can complain to academic staff or dean.<br>
Canteen login to the system and the they can access manage available and student or lecturer order list.<br>
Librarian login to the system and they can manage resources and place request.<br>
Cleaning staff, security staff and other can access the system use the guest mode and they can complain repairs, student fault...etc.<br>
New students also come to the system as guest and they can explore the functionalities such as facilities, beauty of NSBM, courses, virtual tour and if there is any thing to complain they can do it via complain function without any logins.
</P>
<br><br>
<h3>DFD Diagram</h3>
<br><br><br>

![maddfd drawio-1](https://github.com/2000kavinda/NAPOT./assets/98000159/605fbe0d-4a61-4060-8764-c96caa3a40f9)
![maddfd drawio-2](https://github.com/2000kavinda/NAPOT./assets/98000159/e88e27ea-fc97-4da5-82a5-09cf4da18205)
![maddfd drawio-3](https://github.com/2000kavinda/NAPOT./assets/98000159/86364055-f8a1-4a2e-82bd-8cdefdb3d1fd)
![maddfd drawio-4](https://github.com/2000kavinda/NAPOT./assets/98000159/9a36543a-2831-4ef7-b9c9-9272b88014ca)


<br>
<a href="https://drive.google.com/file/d/1Dv8vxNGOr3WjXRGVpkJr57AyZV9-ziB3/view">View full DFD diagram</a>
<br><br>

<p>After filling in the student registration form, the details related to the registration form will go to the admin through the signup process. After the admin checks it and accepts the student's registration, the login credentials will go to the student through the approve registration process. Also, the registry data and student credentials data are stored in the student data database.<br><br>
When student try log in to the system, the login process allows the student to enter the system by checking the data in the student data database.<br><br>
The view profile process is used to view the student data and the update profile is used to update the student's data and store the updated data in the student profile data database. The interviewer can also view student data through the view profile process.<br><br>
Through the view plan process, the student can know the schedule data and course guidelines.<br><br>
The view place order process allows students to order food and view available food. Through the study area booking process, the student can choose a study room, view the remaining study room and book the study room.<br><br>
The doing complain process stores the complaints of students, lecturers and guests in the complaint database.<br><br>
The admin can view the complaint through the view all complains process.<br><br>
Through the management event process, the admin can manage the event and store the event details in the event database.<br><br>
The lecturer can view their timetable through the view timetable process.<br><br>
Through the search student process, the lecturer can enter the student's index number and view the student's profile data.<br><br>
Student registration data, credentials data store the student data database. student data and student edited profile data store the student profile data database. course details store the course details database. Timetable data store the timetable database. Available canteen food details store the canteen stock database. student ordered order details store the order database. Booking data store the library space database. lecturer, student, guest complain store the complains database.<br></p>
<br><br><br>
<h3>Students</h3>
<p>1.Student Registration:
The student initiates the registration process.The system prompts the student to sign up and create an account.The student fills in the registration form with personal details.The system validates the form and requests the student to pay the registration fee.The student makes the payment.Upon successful payment, the system confirms the registration and grants access to the platform.
<br><br>2.Explore Features:
After registration, the student can explore various features and facilities provided by NSBM.This includes accessing information about hostel facilities, success stories, beauty of NSBM, course details, postgraduate studies, etc.
<br><br>3.Virtual University Map:
The student has the option to access the virtual university map.This feature provides a visual representation of the campus layout and facilities.The student can navigate through the map to locate buildings, classrooms, libraries, hostels, and other important locations within the university.
<br><br>4.Student Profile:
Each student has a profile similar to a LinkedIn profile.The profile displays results, badges, certificates, disciplinary actions, personal details, and a progress graph.The student can edit their profile details as needed.Dining and Scheduling:(eat &drinks).The student has a special option to access the dining and scheduling services.
<br><br>5. Course management plan:
The student can access the course plan and schedule.
The system provides a timetable for classes.
The student can view notifications related to courses and access the course dashboard.
<br><br>6. Dining and Scheduling :
The student has a special option to access the dining and scheduling services.
They can select meals and beverages.
The system allows the student to schedule their activities accordingly.
<br><br>7. Library and resources:
The student can place book requests in the library. They can access resources provided by NSBM.
<br><br>8.Calendder and events:
The student can view the academic calendar and upcoming events.
<br><br>9.Help desk and Q&A
The student can access the help desk for assistance. They can engage in direct chat for questions and answers.
<br><br>10.Student Shuttle Service:
The student has the unique feature of accessing the student shuttle service.
They can track shuttle locations, view details, and book seats.
<br><br>11.Third-party Services:
The student can utilize third-party services integrated into the platform.
<br><br>12.The student can raise complaints regarding various issues such as repairs, academic problems and others
<br><br>This use case diagram provides an overview of the main functionalities and interactions between the student and the NSBM learning platform. It encompasses activities from registration to accessing various resources and services provided by the platform.
</p>
<br><br><br><br>

<img width="521" alt="259074328-051814e9-1c83-4bc6-9921-ec12613d1254" src="https://github.com/2000kavinda/NAPOT./assets/98000159/9149bdc8-1ec1-4d6d-b730-bee0acdb8b71">


<P>By using this login page, students who are already at the university can log into the application with the email address and password provided by the university. Also, they can change the password using the forgotten password.
By using this login page, students who are already not at the university can log into the application.for that they should submit their certifications required by the university such as o/l,a/l result sheet.as well as they can submit their DOCUMENT by using choose file option.
after completing thire paymentTheir request will be received by the administrator who will consider them and make selections for graduation. After the registration is completed, the admin will send an email and password to the concerned person which he can use to log into the application from the login page.</P>
<br><br>

<img width="506" alt="259074505-ea9bfaa5-d2b9-4655-8806-9962b23e6884" src="https://github.com/2000kavinda/NAPOT./assets/98000159/190364ac-3a73-4230-bb58-a803b46922d5">
<img width="519" alt="259074622-97dd87a4-d0b2-483b-9176-d4079e61d41c" src="https://github.com/2000kavinda/NAPOT./assets/98000159/3569435e-3eab-42b5-a439-6e644fd8a2e8">



<p>In the home page students can get knowledge about our university. What are degree programs offered by NSBM and how is the value of these degree programs. Also we can get information about the university faculties and course details. Such as course duration, course fee, undergraduate, post graduate and PHD etc. And also students can get details about the next intake. Such as how many students are get the intake, when is the intake date, what is the batch, enrolment qualifications etc. If users want to see the university in virtually they can click the virtual Tour button and see the university.
We can get to know about the what are the foreign universities engaged with NSBM. We can get more information about the Plymouth university UK and their degree programs, Victoria university Australia and their degree programs.</p>
<br><br><br>

<img width="515" alt="259074836-6d18b17c-dbaa-4cc9-8204-f1263df8ca74" src="https://github.com/2000kavinda/NAPOT./assets/98000159/669f1466-be2c-4414-bcbf-c2209531fc41">

<p>In this facility page all the users can see the what facilities have in NSBM green university.
Also users can get knowledge about the all university facilities and current university facilities. The facility page is categorized as lecture hall facility, library facility, co- curricular activity, library facility, student accommodation facility and recreational facility etc.
Also in the lab facility users can how many labs are in the university and what kind if labs are they. Such as how many IT labs, how many bio medical as well.</p>
<br><br><br>

<img width="505" alt="259075055-b9f723f4-4d66-487a-9ebe-9750ffd8f31b" src="https://github.com/2000kavinda/NAPOT./assets/98000159/a26419b6-2a21-4ee6-bff3-5eb3dace04f6">

<p>In the student profile all the university students can see their batch, degree, GPA and the credits. Also they can see their personal details such as full name, NIC number, contact number, student ID, guardian name and the contact number etc. As well as students can add their skills to this page and can update it. If students joined some clubs and societies they can add them too. Addition to that students can add academic certificates they got. Students can chat with their lecturers through this platform and can clarify their problems.
There is a notification panel in this page. Then the students receive a notifications for their future activities. Also if student have a question to solve they can type that question in question forum and get help from others to solve that.</p>
<br><br><br>

<img width="515" alt="259075236-268b911e-14f3-4da3-af4f-1508c77cff2d" src="https://github.com/2000kavinda/NAPOT./assets/98000159/014a03b0-cb20-448f-be80-c0ff0a207aed">
<img width="506" alt="259075253-a56acec9-e5c8-4684-8de7-090549bd59ee" src="https://github.com/2000kavinda/NAPOT./assets/98000159/d4988781-59ec-4386-8be8-adaf16d14fb7">


<br><br><br>

<img width="510" alt="259075392-a407c1db-94fe-4540-8b49-1bd99608c47d" src="https://github.com/2000kavinda/NAPOT./assets/98000159/868df4e0-405a-4595-b823-beb500d4396d">

<p>IIn this lecture page students can easily get to know about the lecture schedule and day to day time table. Also students can go through the lecture notes and download the lecture materials , submit assignments, do online quizzes as well. And also students can give feedback through this page as well.
If students want to check their attendance, profile and marks they can simply type their ID number and can search it.
Lecturers can upload the lecture materials to this and also they can download the assignments done by the students. To upload the lecture materials lecturers have to add lecture number and the topic. As well as they can add an assignments, quizzes also to this platform.</p><br><br><br>

<img width="496" alt="259082005-ca95bf30-3e35-412d-9df4-74aceef961f6" src="https://github.com/2000kavinda/NAPOT./assets/98000159/2624fbd2-c588-423e-bf85-8145b127e0e6">
<img width="517" alt="259082033-bf8d354a-7eb3-4686-aacc-b94649ee7427" src="https://github.com/2000kavinda/NAPOT./assets/98000159/ae496174-051c-47aa-9e4b-e06ab789abd3">
<img width="504" alt="259082044-0865b95f-9826-40ce-8533-85712aaf1585" src="https://github.com/2000kavinda/NAPOT./assets/98000159/e08c539c-a8bf-444a-aa7e-d5ee6431a3ff">
<img width="509" alt="259082196-1908387b-62cc-4111-9430-ff5d2833345d" src="https://github.com/2000kavinda/NAPOT./assets/98000159/c33632ba-7b5f-498c-9911-f969a044e19d">
<img width="509" alt="259082206-9bbcb07b-0081-40c8-8aec-8a17a56cf885" src="https://github.com/2000kavinda/NAPOT./assets/98000159/c29aa5f2-052b-4089-bb11-82dfc39e389c">



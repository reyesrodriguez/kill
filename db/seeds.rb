# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Tasking.delete_all
Message.delete_all
Messaging.delete_all

msgcontent = "<p>Thanks for taking to time to sign up with us!</p>"+
	"<p>Here at TaskIt we strive to help our users organize their personal calendars and their lives!</p>"+
	"<p>Congrats on becoming a member of the TaskIt community!</p>"+
	"<h4>Cheers!</h4>"+
	"<p>The TaskIt Team</p>"

a = User.create({name:"Reyes",email:"reyes@test.com",password:"reyes"})
# b = User.create({name:"Xi",email:"xi@test.com",password:"xi"})
# c = User.create({name:"Jackie",email:"jackie@test.com",password:"jackie"})
# d = User.create({name:"Viki",email:"viki@test.com",password:"viki"})


e = Task.create({title:"task1",content:"it's a task",duedate:"today",city:"manhattan",state:"NY",address:"1 hart st" })
# f = Task.create({title:"task2",content:"it's another task",duedate:"tomorrow",location:"brooklyn"})
# taskone = Task.create({title:"Go Food Shopping",content:"Have to get ingredients for dinner this week! Im making waffles.",duedate:"tomorrow",location:"Astoria, NY"})
# tasktwo = Task.create({title:"Walk the dog",content:"Have to take Cassie out for a walk, she needs her exercise",duedate:"tomorrow",location:"New York City, NY"})
# taskthree = Task.create({title:"Do Laundry",content:"Have to take do the laundry sometime this week",duedate:"9/4/2015",location:"Atlanta, GA"})
# taskfour = Task.create({title:"Work out",content:"Going to the gym after work today, I MUST.",duedate:"today",location:"Brooklyn, NY"})
# taskfive = Task.create({title:"Send flowers to mom",content:"Send flowers to mom for her birthday!",duedate:"9/10/2015",location:"Montauk, NY"})
# tasksix = Task.create({title:"Water the Plants",content:"Need to water the plants when I get home tomorrow.",duedate:"tomorrow",location:"Sayville, NY"})
# taskseven = Task.create({title:"Get Packages",content:"Need to pick up packages at the post office before they send them back!",duedate:"9/2/2015",location:"Brooklyn, NY"})
# taskeight = Task.create({title:"Meet Sammy",content:"Meeting Sammy for dinner tonight at 9PM",duedate:"today",location:"New York City, NY"})


Tasking.create(user:a,task:e)
# Tasking.create(user:a,task:f)
# Tasking.create(user:b,task:f)
# Tasking.create(user:b,task:taskone)
# Tasking.create(user:b,task:tasktwo)
# Tasking.create(user:a,task:taskthree)
# Tasking.create(user:b,task:taskfour)
# Tasking.create(user:a,task:taskfive)
# Tasking.create(user:b,task:tasksix)
# Tasking.create(user:b,task:taskseven)
# Tasking.create(user:a,task:taskeight)



g = Message.create({title:"Welcome to task manager",content: msgcontent})
# h = Message.create({title:"Hello,",content:"how are you",attachment:"no attach",sender_id: c.id})
# m1 = Message.create({title:"Hi",content:"I hope you are well. I just shared the below task with you, If you have any further question, please let me know.",attachment:"no attach",sender_id: d.id})
# m2 = Message.create({title:"Good Morning",content:"How are you? Can we talk later on to discuss how we are going to organize this. Many thanks.",attachment:"no attach",sender_id: d.id})
# m3 = Message.create({title:"Ahoj",content:"Can you make sure this task is completed on time?",attachment:"no attach",sender_id: a.id})
# m4 = Message.create({title:"Welcome,",content:"I hope you are well. Here are the list of outstanding tasks we have to complete. Let me know if you have any question.",attachment:"no attach",sender_id: b.id})
# m5 = Message.create({title:"Hi,",content:"Do You have any suggestion how should we approach this?",attachment:"no attach",sender_id: c.id})


Messaging.create(user:a,message:g);
# Messaging.create(user:a,message:h);
# Messaging.create(user:b,message:h);
# Messaging.create(user:c,message:h);
# Messaging.create(user:d,message:h);
# Messaging.create(user:a,message:m1);
# Messaging.create(user:b,message:m2);
# Messaging.create(user:c,message:m3);
# Messaging.create(user:d,message:m4);
# Messaging.create(user:b,message:m5);
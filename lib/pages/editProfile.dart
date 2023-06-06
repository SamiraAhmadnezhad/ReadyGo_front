import 'package:flutter/material.dart';
import 'package:readygo/User.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key,required this.user});
  final User user;
  @override
  State<editProfile> createState() => _editProfileState(user: user);
}

class _editProfileState extends State<editProfile> {
  _editProfileState({required this.user});
  User user;
  String name='';
  String age='';
  String field='';
  String studentNumber='';
  String email='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "Edit Information",
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'enter name',
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (String name){
                setState(() {
                  this.name=name;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Age',
                hintText: 'enter age',
                prefixIcon: Icon(Icons.people_outline_outlined),
              ),
              onChanged: (String age){
                setState(() {
                  this.age=age;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Field',
                hintText: 'enter field',
                prefixIcon: Icon(Icons.file_copy),
              ),
              onChanged: (String field){
                setState(() {
                  this.field=field;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Student Number',
                hintText: 'enter student number',
                prefixIcon: Icon(Icons.numbers),
              ),
              onChanged: (String number){
                setState(() {
                  this.studentNumber=number;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'enter email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onChanged: (String email){
                setState(() {
                  this.email=email;
                });
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                child: Text(
                  'submit'
                ),
                color: Colors.grey.shade600,
                onPressed: (){
                  setState(() {
                    user.email=email;
                    user.studentNumber=studentNumber;
                    user.field=field;
                    user.age=age;
                    user.name=name;
                  });
                  Navigator.of(context).pop();
                }
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:readygo/HomePage.dart';
import 'package:readygo/SingUp.dart';
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  )
  );
}
class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  //final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Login",
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'email',
                  hintText: 'enter email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (String? email){
                  if (email==null) {
                    return "please enter email!";
                  }
                  else if (email.contains("@")==false){
                    return 'do not use the @ char.';
                  }
                },
                onChanged: (String email){
                  setState(() {
                    this.email=email;
                    //print(this.email);
                  });
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'password',
                  hintText: 'enter password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String? pass){
                  if (pass==null) {
                    "please enter password!";
                  }
                  else if (pass!.length<8){
                    'password should be 8 charecter';
                  }
                },
                onChanged: (String pass){
                  setState(() {
                    this.password=pass;
                    //print(this.password);
                  });
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: (){
                    //check pass and email
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(password: this.password,email: this.email,),
                      ),
                    );
                  },
                  color: Colors.deepPurple,
                  child: const Text(
                    'login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'do not have a account?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: (){
                  //go to sing up
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SingUp(),
                    ),
                  );
                },
                child: const Text(
                  'sing up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      );
  }
}

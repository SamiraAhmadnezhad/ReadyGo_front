
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.purple,
          title: Text(
            'Ready Go'
          ),
          //iconTheme: IconThemeData(color: Colors.green),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Login',
              style: TextStyle(
                fontSize: 35,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'enter email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String email){
                          //print(email);
                          // String email is here
                        },
                        validator: (value){
                          return value!.isEmpty ? 'please enter email' :null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                    () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          alignLabelWithHint: false,
                          filled: true,
                          // validator: (pass){
                          //   return pass!.isEmpty ? 'please enter password' :null;
                          // },
                        ),
                        onChanged: (String pass){
                          //print(pass); // String password is here
                          },
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: MaterialButton(
                          minWidth: double.infinity,
                            onPressed:(){} ,//what we whant to do whit email or pass
                            child: Text("Login"),
                            color: Colors.purpleAccent,
                            textColor: Colors.white,
                        ),
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

}
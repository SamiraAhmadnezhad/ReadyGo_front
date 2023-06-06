import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/PurchasePage.dart';
import 'package:readygo/pages/appTheme.dart';
import 'package:readygo/pages/editProfile.dart';

class Account extends StatefulWidget {
  final User user;

  const Account({super.key,required this.user});
  @override
  State<Account> createState() => _AccountState(user: user);
}

class _AccountState extends State<Account> {
  _AccountState({required this.user});
  PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
  User user;
  String dropdownvalue = 'Light';
  var items = [
    'Light',
    'Dark'
  ];
  void theme(String dropdownvalue){
    if (dropdownvalue=='Light')
      appTheme.myTheme=ThemeData.light();
    else
      appTheme.myTheme=ThemeData.dark();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              imageProfile(),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.username,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  if (user.isSpecial)
                    Icon(Icons.diamond_outlined,color: Colors.blue,)
                ],
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text("Theme : ",
                      style: TextStyle(
                        fontSize: 17,
                      ),),
                    SizedBox(width: 10,),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.format_list_numbered_rtl ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          theme(dropdownvalue);
                        });
                      },

                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.person_outline_rounded),
                title: Text(
                    "Name : "
                ),
                trailing: Text (
                  user.name
                ),
              ),
              ListTile(
                tileColor: Colors.pink.shade100,
                leading: Icon(Icons.people_outline_outlined),
                title: Text(
                    "Age : "
                ),
                trailing: Text (
                    user.age
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.file_copy),
                title: Text(
                    "Field : "
                ),
                trailing: Text (
                    user.field
                ),
              ),
              ListTile(
                tileColor: Colors.pink.shade100,
                leading: Icon(Icons.numbers),
                title: Text(
                    "Student Number : "
                ),
                trailing: Text (
                    user.studentNumber
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.alternate_email),
                title: Text(
                    "Email : "
                ),
                trailing: Text (
                    user.email
                ),
              ),
              ListTile(
                tileColor: Colors.pink.shade100,
                leading: Icon(Icons.money),
                title: Text(
                    "Money : "
                ),
                trailing: Text (
                    user.money.toString()
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: MaterialButton(
                  onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => editProfile(user: user)),
                      );
                    },
                    color: Colors.grey.shade300,
                    height: 35,
                    child: Row(
                      children: const [
                        Icon(Icons.drive_file_rename_outline_outlined),
                        SizedBox(width: 10,),
                        Text(
                          "editing information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => specialAccount()),
                        );
                      },
                      color: Colors.pink.shade400,
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.diamond_outlined),
                          SizedBox(width: 10,),
                          Text(
                            "Buy a special subscription",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: MaterialButton(
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => by()),
                        );
                      },
                      color: Colors.pink.shade400,
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.monetization_on_outlined),
                          SizedBox(width: 10,),
                          Text(
                            "Increase credit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width*3/12,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.red.shade500,
                    height: 35,
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app,
                        color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          "Exit",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  Widget imageProfile (){
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundImage: FileImage(File(user.profilePhoto)),
    ),
          Positioned(
            bottom: 7.0,
            right: 5.0,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.pink,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    ); //stack
  }
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "chose profile photo",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: (){
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
              ),
              Text("Camera",
              style: TextStyle(
                fontSize: 15,
              ),),
              SizedBox(width: 20,),
              IconButton(
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
              ),
              Text("Gallery",
                style: TextStyle(
                  fontSize: 15,
                ),),
            ],
          )
        ],
      ),
    );
  }
  void takePhoto (ImageSource  source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile= pickedFile;
      if (_imageFile!=null)
        user.profilePhoto=_imageFile!.path;
    });
  }
  String money='';
  Widget by(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Enter the amount in Tomans",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*2/3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Amount',
                    prefixIcon: Icon(Icons.monetization_on),
                  ),
                  onChanged: (String Amount){
                    setState(() {
                      this.money=Amount;
                    });
                  },
                ),
              ),
              SizedBox(width: 20,),
              IconButton(
                onPressed: (){
                  setState(() {
                    user.money+=int.parse(money);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PurchasePage(user: user)),
                  );
                },
                icon: Icon(Icons.done_outline),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget specialAccount(){
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose one of the following",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox(height: 20,),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: (){
                    setState(() {
                      user.isSpecial=true;
                    });
                    Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => PurchasePage(user: user)),
                    );
                  },
                  color: Colors.pink.shade400,
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.looks_one),
                      SizedBox(width: 10,),
                      Text(
                        "1 month | 60 toman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      user.isSpecial=true;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PurchasePage(user: user)),
                    );
                  },
                  color: Colors.pink.shade400,
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.looks_3),
                      SizedBox(width: 10,),
                      Text(
                        "3 month | 150 toman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      user.isSpecial=true;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PurchasePage(user: user)),
                    );
                  },
                  color: Colors.pink.shade400,
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.looks_6),
                      SizedBox(width: 10,),
                      Text(
                        "6 month | 280 toman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
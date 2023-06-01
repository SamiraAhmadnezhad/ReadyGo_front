import 'package:flutter/material.dart';

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20,),
        child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                      "recent",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/images/hary1.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary2.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary3.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary4.jpg'),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  const Text(
                    "favorite",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/images/hary1.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary2.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary3.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary4.jpg'),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  const Text(
                    "new release",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/images/hary1.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary2.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary3.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary4.jpg'),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  const Text(
                    "top selling",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/images/hary1.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary2.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary3.jpg'),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/hary4.jpg'),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),

                ],
              ),
            ),
        ),
    );
  }
}
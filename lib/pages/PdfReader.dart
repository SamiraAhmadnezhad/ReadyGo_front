import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfReader extends StatelessWidget {
  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/pdf/sample.pdf'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PdfViewPinch(
        controller: pdfPinchController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.pinkAccent,
        child: Text("Back")
      ),
    );
  }
}
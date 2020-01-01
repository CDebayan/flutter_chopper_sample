import 'package:flutter/material.dart';
import 'package:flutter_chopper_sample/screen/get_call_screen.dart';
import 'package:flutter_chopper_sample/screen/post_call_body.dart';
import 'package:flutter_chopper_sample/screen/post_call_form_data.dart';
import 'package:flutter_chopper_sample/screen/single_image_upload_screen.dart';
import 'package:flutter_chopper_sample/widget/button_widget.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonWidget('Get Call', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetCallScreen()));
            }),
            ButtonWidget('Post Call Body', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostCallBodyScreen()));
            }),
            ButtonWidget('Post Call Form Data', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostCallFormDataScreen()));
            }),
            ButtonWidget('Multipart Single Image', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleImageUploadScreen()));
            }),
          ],
        ),
      ),
    );
  }
}

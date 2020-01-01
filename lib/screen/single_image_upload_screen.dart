import 'package:flutter/material.dart';
import 'package:flutter_chopper_sample/widget/button_widget.dart';
import 'package:image_picker/image_picker.dart';


class SingleImageUploadScreen extends StatefulWidget {
  @override
  _SingleImageUploadScreenState createState() =>
      _SingleImageUploadScreenState();
}

class _SingleImageUploadScreenState extends State<SingleImageUploadScreen> {
  var _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            ButtonWidget("Select Image", () async {
              var image = await ImagePicker.pickImage(
                  source: ImageSource.gallery);
              setState(() {
                _selectedImage = image;
              });
            }),

            Expanded(
                child: Center(
                  child: _selectedImage == null ? Text('No image selected.') : Image.file(_selectedImage),
                ),
            ),


            ButtonWidget("Upload Image", () {

            }),


          ],
        ),
      ),
    );
  }
}

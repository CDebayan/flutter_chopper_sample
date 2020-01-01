import 'package:flutter/material.dart';
import 'package:flutter_chopper_sample/data/api_service.dart';
import 'package:flutter_chopper_sample/model/note_list_model.dart';
import 'package:flutter_chopper_sample/widget/button_widget.dart';
import 'package:flutter_chopper_sample/widget/text_form_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostCallBodyScreen extends StatelessWidget {
  final TextEditingController noteController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController priorityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextFormFieldWidget("ENter Note", noteController),
              TextFormFieldWidget("Enter Date", dateController),
              TextFormFieldWidget("Enter Priority", priorityController),

              ButtonWidget("Submit",(){
                  var notesModel = NotesModel(note: noteController.text,date: dateController.text,priority: priorityController.text);
                  ApiService.create().addNoteBody(notesModel.toJson()).then((snapshot){
                    if(snapshot.body != null){
                      var noteResponse = NoteResponse.fromJson(snapshot.body);
                      if(noteResponse.success == 1){
                        if(noteResponse.message !=  null){
                          Fluttertoast.showToast(
                              msg: noteResponse.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                          );
                        }
                      }
                    }
                  });
              })
            ],
          ),
        ),
      ),
    );
  }
}

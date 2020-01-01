import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chopper_sample/data/api_service.dart';
import 'package:flutter_chopper_sample/model/note_list_model.dart';

class GetCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: ApiService.create().getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildNoteList(snapshot);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

Widget _buildNoteList(AsyncSnapshot snapshot) {
  if (snapshot != null) {
    var noteListResponse = NoteListResponse.fromJson(snapshot.data.body);
    if (noteListResponse.success == 1) {
      if (noteListResponse.notesList != null) {
        var notesList = noteListResponse.notesList;
        return ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return _buildNoteItem(notesList[index]);
          },
        );
      }
    } else if (noteListResponse.success == 0) {
      return Center(
        child: Text("Your Own Message"),
      );
    }
  }

  return Center(
    child: Text("Something Went Wrong"),
  );
}

Widget _buildNoteItem(NotesModel noteItem) {
  return Card(
    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(noteItem.note),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(noteItem.date),
              Text(noteItem.priority),
            ],
          ),
        ],
      ),
    ),
  );
}

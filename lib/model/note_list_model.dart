class NoteListResponse {
  List<NotesModel> notesList;
  int success;

  NoteListResponse({this.notesList, this.success});

  NoteListResponse.fromJson(Map<String, dynamic> json) {
    if (json['notesList'] != null) {
      notesList = new List<NotesModel>();
      json['notesList'].forEach((v) {
        notesList.add(new NotesModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notesList != null) {
      data['notesList'] = this.notesList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class NotesModel {
  String id;
  String note;
  String date;
  String priority;

  NotesModel({this.note, this.date, this.priority});

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    date = json['date'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['date'] = this.date;
    data['priority'] = this.priority;
    return data;
  }
}


class NoteResponse {
  int success;
  String message;

  NoteResponse({this.success, this.message});

  NoteResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}


class PostModel {
  int? _userId;
  int? _id;
  String? _title;
  String? _body;

  PostModel({required int userId, required int id, required String title, required String body}) {
    this._userId = userId;
    this._id = id;
    this._title = title;
    this._body = body;
  }

  int get userId => _userId!;
  set userId(int userId) => _userId = userId;
  int get id => _id!;
  set id(int id) => _id = id;
  String get title => _title!;
  set title(String title) => _title = title;
  String get body => _body!;
  set body(String body) => _body = body;

  PostModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['body'] = this._body;
    return data;
  }
}

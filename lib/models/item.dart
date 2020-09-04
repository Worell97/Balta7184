class Item {
  String title, key;
  bool done;

  Item({this.title, this.done, this.key});
  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    data['key'] = this.key;
    return data;
  }
}

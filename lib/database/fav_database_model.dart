class SQLModel {
  late String title;
  late String image;
  late String id;

  SQLModel({
    required this.title,
    required this.image,
    required this.id,
  });

  SQLModel.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    image = map['image'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['title'] = title;
    map['image'] = image;
    map['id'] = id;

    return map;
  }
}

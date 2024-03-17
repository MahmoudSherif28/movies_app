class registeration {
  late int id;
  late String username;
  late String Password;

  registeration({
    required this.id,
    required this.username,
    required this.Password,
  });

  registeration.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    Password = map['Password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['username'] = username;
    map['Password'] = Password;

    return map;
  }
}

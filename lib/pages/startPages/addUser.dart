class UserData{

  final String email;
  final String uid;
  final String name;

  const UserData({
    required this.email,
    required this.uid,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "uid": uid,
    "email": email,
  };
}
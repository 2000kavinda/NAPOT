class UserData{

  final String email;
  final String uid;
  final String name;
  final String degree;
  final String index;
  final String batch;
  final String nic;

  const UserData({
    required this.email,
    required this.uid,
    required this.name,
    required this.degree,
    required this.index,
    required this.batch,
    required this.nic,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "uid": uid,
    "email": email,
    "degree": degree,
    "index": index,
    "batch": batch,
    "nic": nic,
  };
}
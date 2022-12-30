class AppUser {
  AppUser({
    required this.email,
    required this.username,
    required this.uid,
    required likedIDs,
  });
  String? email;
  String? username;
  String? uid;
  List<String>? likedIDs;
}

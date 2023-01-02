class AppUser {
  AppUser({
    this.email,
    this.username,
    this.uid,
    likedIDs,
  });
  String? email;
  String? username;
  String? uid;
  List<String>? likedIDs;
}

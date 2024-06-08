
class User{
  String? displayImage;
  String name;
  Map<String, int>? youOwe;
  Map<String, int>? owed;
  Map<String, int>? yourGroups;


  User({
    this.displayImage, 
    required this.name, 
    this.youOwe, 
    this.owed, 
    this.yourGroups});
}
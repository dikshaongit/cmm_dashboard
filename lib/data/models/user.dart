class User {
  String username;
  String firstName;
  String depot;
  String division;
  String zone;
  String level;
  String department;
  String location;

  User.fromJson(Map<String, dynamic> userMap) {
   
    username = userMap['user_name'];
    firstName = userMap['firstName'];
    depot = userMap['depot'];
    division = userMap['division'];
    zone = userMap['zone'];
    level = userMap['level'];
    department = userMap['department'];
    location = userMap['location'];
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti1l2@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email,
  });

  UserEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }

}
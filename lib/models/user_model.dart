class Usermodel{
  String username;
  String password;
  String email;
  String confirm;
  String? id;
  Usermodel({
    required this.email,
    required this.password,
    required this.username,
    required this.confirm,
    required this.id,
});
  Map<String,dynamic> toMap(){
    return{
      "username":this.username,
      "password":this.password,
      "email":this.email,
      "confirm":this.confirm,
      "id":this.id,
    };
  }
  factory Usermodel.fromMap(Map<String,dynamic>map){
    return Usermodel(
    email: map["name"]?? "",
    password: map["name"]?? "",
    username: map["name"]?? "",
      confirm: map["confirm"]?? "",
      id: map["id"]?? "",
    );
  }
  Usermodel copyWith({
    String? email,
    String? password,
    String? username,
    String? confirm,
    String? id,
}){
    return Usermodel(
      email: email??this.email,
      password: password??this.password,
      username: username??this.username,
      confirm: confirm??this.confirm,
      id: id??this.id,
    );
  }

}
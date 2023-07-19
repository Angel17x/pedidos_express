class UserModel {
  String? name;
  String? address;
  String? email;
  String? password;
  String? type;

  UserModel({
    this.name,
    this.address,
    this.email,
    this.password,
    this.type
  });

  UserModel.fromJson({required Map<String, dynamic> data}){
    name = data["name"];
    address = data["address"];
    email = data["email"];
    password = data["password"];
    type = data["type"];
  }
  toJson(){
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["address"] = address;
    data["email"] = email;
    data["password"] = password;
    data["type"] = type;

    return data;
  }
}
class EcommerceModel {
  String? name;
  String? address;
  String? rif;
  String? type_ecommerce;
  List<UserModel?>? user_id;

  EcommerceModel({
    name,
    address,
    rif,
    type_ecommerce,
    user_id
  });

  EcommerceModel.fromJson(Map<String, dynamic> json){
    name = json["name"];
    address = json["address"];
    rif = json["rif"];
    type_ecommerce = json["type_ecommerce"];
    if(json.containsKey("user_id")){
      if(json["user_id"].length != 0){
        user_id = json["user_id"].map((user) => UserModel.fromJson(user)).toList();
      }
    }
  }

  toJson(){
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["address"] = address;
    json["rif"] = rif;
    json["type_ecommerce"] = type_ecommerce;
    json["user_id"] = user_id?.map<UserModel?>((user) => user?.toJson()).toList();
    return json;
  }

  @override
  String toString() {
    return 'Ecommerce model $name, $address, $rif, $type_ecommerce, $user_id';
  }
}

class UserModel{
  String? id;
  String? name;
  String? email;
  String? address;
  String? type;
  UserModel({
    id,
    name,
    email,
    address,
    type
  });

  UserModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    name = json["name"];
    email = json["email"];
    address = json["address"];
    type = json["type"];
  }

  toJson(){
    Map<String, dynamic> json = {};
    json["_id"] = id;
    json["name"] = name;
    json["email"] = email;
    json["address"] = address;
    json["type"] = type;
    return json;
  }
}
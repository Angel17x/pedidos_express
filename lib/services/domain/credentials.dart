class Credentials{ 
  String? token;
  String? refreshToken;

  Credentials({this.token, this.refreshToken});
  Credentials.fromJson(Map<String, dynamic>? data){
    token = data?["token"];
    refreshToken = data?["refresh_token"];
  }
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["token"] = token;
    data["refresh_token"] = refreshToken;
    return data;
  }
}
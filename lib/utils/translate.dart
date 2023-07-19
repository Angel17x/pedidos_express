String? translate({String? name}){
  switch(name){
    case "Connection failed":
      return "Se perdió la conexión a internet";
    case "Connection refused":
      return "Servidor no disponible en estos momentos";
    case "invalid_credentials":
      return "Credenciales inválidas";
    default:
      return name;
  }
}
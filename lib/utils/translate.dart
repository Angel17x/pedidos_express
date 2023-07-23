String? translate({String? name}){
  switch(name){
    case "creating_user_error":
      return "Error al crear el usuario";
    case "user_not_registered":
      return "usuario no registrado";
    case "No route to host":
      return "Fallo al conectar al servidor";
    case "Connection timeout":
      return "Fallo al conectar al servidor";
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
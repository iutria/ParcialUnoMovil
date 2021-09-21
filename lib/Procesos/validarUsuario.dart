const _usuario = "IUTRIA";
const _clave = "1234";
bool validarUsuario(String usuario, String clave) {
  return _usuario == usuario && _clave == clave;
}

getUsuario() {
  return _usuario;
}

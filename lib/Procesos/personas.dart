//flutter run -d chrome --web-renderer html
class Persona {
  var id;
  var foto;
  var nombre;
  var apellido;
  var profesion;
  DateTime fechaNacimiento;
  var edad;
  Persona(
      {this.id,
      this.foto,
      this.nombre,
      this.apellido,
      this.profesion,
      required this.fechaNacimiento});
  getEdad() {
    var y = DateTime.now().year - fechaNacimiento.year;
    var m = DateTime.now().month - fechaNacimiento.month;
    var d = DateTime.now().day - fechaNacimiento.day;
    var e = "$y años";
    if (y == 0) {
      e = "$m meses";
    } else {
      if (m < 0) {
        y--;
      }
      e = "$y Años";
    }
    return e;
  }
}

List<Persona> Personas = [
  Persona(
      id: '0',
      foto:
          "https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY",
      nombre: 'Iván',
      apellido: 'Utria',
      profesion: 'Ingeniero',
      fechaNacimiento: DateTime(1998, 10, 30)),
  Persona(
      id: '1',
      foto: "https://picsum.photos/seed/picsum/200/300",
      nombre: 'Cristina',
      apellido: 'Alvarez',
      profesion: 'Licenciada',
      fechaNacimiento: DateTime(1974, 05, 30)),
  Persona(
      id: '2',
      foto: "https://picsum.photos/200/300?grayscale",
      nombre: 'Jesus',
      apellido: 'Molina',
      profesion: 'Estudiante',
      fechaNacimiento: DateTime(2006, 05, 30)),
  Persona(
      id: '3',
      foto:
          "https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY",
      nombre: 'Jorge',
      apellido: 'Molina',
      profesion: 'Maestro',
      fechaNacimiento: DateTime(1966, 05, 30)),
  // Persona(
  //     id: '4',
  //     foto:
  //         "https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk",
  //     nombre: 'Mamá',
  //     apellido: 'Geno',
  //     profesion: 'Abuela',
  //     fechaNacimiento: DateTime(1940, 05, 30)),
  // Persona(
  //     id: '5',
  //     foto:
  //         "https://i.picsum.photos/id/1020/4288/2848.jpg?hmac=Jo3ofatg0fee3HGOliAIIkcg4KGXC8UOTO1dm5qIIPc",
  //     nombre: 'Papá',
  //     apellido: 'Jose',
  //     profesion: 'Abuelo',
  //     fechaNacimiento: DateTime(1938, 05, 30)),
  // Persona(
  //     id: '6',
  //     foto:
  //         "https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk",
  //     nombre: 'Carmen',
  //     apellido: 'Utria',
  //     profesion: 'Tia',
  //     fechaNacimiento: DateTime(1980, 05, 30)),
  // Persona(
  //     id: '7',
  //     foto:
  //         "https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y",
  //     nombre: 'Nataly',
  //     apellido: 'Luque',
  //     profesion: 'Prima',
  //     fechaNacimiento: DateTime(2009, 05, 30)),
  // Persona(
  //     id: '8',
  //     foto:
  //         "https://i.picsum.photos/id/1020/4288/2848.jpg?hmac=Jo3ofatg0fee3HGOliAIIkcg4KGXC8UOTO1dm5qIIPc",
  //     nombre: 'Alam',
  //     apellido: 'Utria',
  //     profesion: 'Hijo',
  //     fechaNacimiento: DateTime(2020, 05, 30)),
  // Persona(
  //     id: '9',
  //     foto:
  //         "https://i.picsum.photos/id/1013/4256/2832.jpg?hmac=UmYgZfqY_sNtHdug0Gd73bHFyf1VvzFWzPXSr5VTnDA",
  //     nombre: 'Monica',
  //     apellido: 'Utria',
  //     profesion: 'Hija',
  //     fechaNacimiento: DateTime(2021, 05, 30)),
];

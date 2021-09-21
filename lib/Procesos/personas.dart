class Persona {
  var id;
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNacimiento;
  var edad;
  Persona(
      {this.id,
      this.foto,
      this.nombre,
      this.apellido,
      this.profesion,
      this.fechaNacimiento});
  getEdad() {
    return '24';
  }
}

List<Persona> Personas = [
  Persona(
      id: '0',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.legendariummedia.com%2Fwp-content%2Fuploads%2F2016%2F11%2Fdoctorstrange.jpg&f=1&nofb=1",
      nombre: 'Iván',
      apellido: 'Utria',
      profesion: 'Ingeniero',
      fechaNacimiento: '30-05-1997'),
  Persona(
      id: '1',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.minuto.com.co%2Fu%2Ffotografias%2Fm%2F2020%2F10%2F23%2Ff768x1-24060_24187_5050.jpg&f=1&nofb=1",
      nombre: 'Cristina',
      apellido: 'Alvarez',
      profesion: 'Madre',
      fechaNacimiento: '30-07-1974'),
  Persona(
      id: '2',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pixel4k.com%2Fwp-content%2Fuploads%2F2020%2F08%2Fthor-reality-stone_1596915653.jpg&f=1&nofb=1",
      nombre: 'Jesus',
      apellido: 'Molina',
      profesion: 'Estudiante',
      fechaNacimiento: '13-09-2006'),
  Persona(
      id: '3',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic3.srcdn.com%2Fwordpress%2Fwp-content%2Fuploads%2F2019%2F08%2FYondu-Udonta-in-Guardians-Galaxy.jpg&f=1&nofb=1",
      nombre: 'Jorge',
      apellido: 'Molina',
      profesion: 'Maestro',
      fechaNacimiento: '5-07-1969'),
  Persona(
      id: '4',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.debate.com.mx%2Fexport%2Fsites%2Fdebate%2Fimg%2F2017%2F08%2F07%2Ftiaaaa.jpg_329896033.jpg&f=1&nofb=1",
      nombre: 'Mamá',
      apellido: 'Geno',
      profesion: 'Abuela',
      fechaNacimiento: '30-03-1997'),
  Persona(
      id: '5',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.comic-images.com%2Fwp-content%2Fuploads%2Fsites%2F26%2F2020%2F04%2Firon-man-2020-art-rj.jpg&f=1&nofb=1",
      nombre: 'Papá',
      apellido: 'Jose',
      profesion: 'Abuelo',
      fechaNacimiento: '22-10-1939'),
  Persona(
      id: '6',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FlUHianN5aPg%2Fmaxresdefault.jpg&f=1&nofb=1",
      nombre: 'Carmen',
      apellido: 'Utria',
      profesion: 'Tia',
      fechaNacimiento: '25-05-1997'),
  Persona(
      id: '7',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.girlmuseum.org%2Fwp-content%2Fuploads%2F2017%2F12%2FGwen-Stacy.jpg&f=1&nofb=1",
      nombre: 'Nataly',
      apellido: 'Luque',
      profesion: 'Prima',
      fechaNacimiento: '30-05-1997'),
  Persona(
      id: '8',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.ogginotizie.it%2Fwp-content%2Fuploads%2F2018%2F08%2FSchermata-2018-08-14-alle-14.04.36.png&f=1&nofb=1",
      nombre: 'Alam',
      apellido: 'Utria',
      profesion: 'Hijo',
      fechaNacimiento: '30-05-1997'),
  Persona(
      id: '9',
      foto:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fnaturalezasalvaje.es%2Fimg%2Fanimales%2FGuepardo-1.jpg&f=1&nofb=1",
      nombre: 'Monica',
      apellido: 'Utria',
      profesion: 'Hija',
      fechaNacimiento: '30-05-1997'),
];

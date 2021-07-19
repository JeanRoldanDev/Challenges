class DataW {
  static List<History> get listHistory => [
        History(user: User.listUser[0], postLength: 10),
        History(user: User.listUser[1], postLength: 5),
        History(user: User.listUser[2], postLength: 50),
        History(user: User.listUser[3], postLength: 0),
        History(user: User.listUser[4], postLength: 3),
        History(user: User.listUser[5], postLength: 3),
      ];

  static List<Chat> get listChats => [
        Chat(
          user: User.listUser[4],
          message: '¡Hola Mao! ¿Nos vemos después del trabajo?',
          updateLast: '11:00 am',
          status: false,
        ),
        Chat(
          user: User.listUser[5],
          message: 'Debo contarles sobre mi canal de nuevas tecnologias',
          updateLast: '10:00 am',
          status: true,
        ),
        Chat(
          user: User.listUser[6],
          message: 'Sí, puedo hacerte esto en la semana',
          updateLast: '1 hour ago',
          status: true,
        ),
        Chat(
          user: User.listUser[7],
          message: 'Por cierto, ¿no viste a mi perro …',
          updateLast: '1 day ago',
          status: false,
        ),
        Chat(
          user: User.listUser[8],
          message: 'Estoy muy emocionado',
          updateLast: '3 hours ago',
          status: false,
        ),
        Chat(
          user: User.listUser[9],
          message: 'El fin de semana podemos salir',
          updateLast: '4 hours ago',
          status: false,
        ),
        Chat(
          user: User.listUser[1],
          message: 'Genial vamos a programar',
          updateLast: '4 hours ago',
          status: false,
        ),
        Chat(
          user: User.listUser[2],
          message: 'que mas ve..!',
          updateLast: '2 hours ago',
          status: false,
        ),
        Chat(
          user: User.listUser[3],
          message: 'Que haces pe!',
          updateLast: '2 hours ago',
          status: false,
        ),
      ];
}

class Chat {
  final User user;
  final String message;
  final String updateLast;
  final bool status;

  Chat({
    required this.user,
    required this.message,
    required this.status,
    required this.updateLast,
  });
}

class Groups {
  final String title;
  final String img;
  final List<User> users;

  Groups({required this.title, required this.img, required this.users});
}

class History {
  final User user;
  final int postLength;

  History({required this.user, required this.postLength});
}

class User {
  final int id;
  final String img;
  final String imgProfile;
  final bool status;
  final String name;
  final String surname;

  User({
    required this.id,
    required this.img,
    required this.name,
    required this.surname,
    required this.imgProfile,
    required this.status,
  });

  static const _path = 'assets/images/2_challenge_whatsapp';
  static List<User> get listUser => [
        User(
          id: 1,
          img: '$_path/p1_1.jpg',
          imgProfile: '$_path/p1_2.jpg',
          name: 'Jean',
          surname: 'Roldan',
          status: true,
        ),
        User(
          id: 2,
          img: '$_path/p2_1.jpg',
          imgProfile: '$_path/p2_2.jpg',
          name: 'Mika',
          surname: 'Bettosini',
          status: true,
        ),
        User(
          id: 3,
          img: '$_path/p3_1.jpg',
          imgProfile: '$_path/p3_2.jpg',
          name: 'Mauricio',
          surname: 'Lopez',
          status: false,
        ),
        User(
          id: 4,
          img: '$_path/p4_1.jpg',
          imgProfile: '$_path/p4_2.jpg',
          name: 'Brayan',
          surname: 'Cantos',
          status: true,
        ),
        User(
          id: 5,
          img: '$_path/p5_1.jpg',
          imgProfile: '$_path/p5_2.jpg',
          name: 'Jose',
          surname: 'Loor',
          status: false,
        ),
        User(
          id: 6,
          img: '$_path/p6_1.jpg',
          imgProfile: '$_path/p6_2.jpg',
          name: 'Darwin',
          surname: 'Morocho',
          status: true,
        ),
        User(
          id: 7,
          img: '$_path/p7_1.jpg',
          imgProfile: '$_path/p7_2.jpg',
          name: 'Brian',
          surname: 'Castillo',
          status: true,
        ),
        User(
          id: 8,
          img: '$_path/p8_1.jpg',
          imgProfile: '$_path/p8_2.jpg',
          name: 'Lis',
          surname: 'Rengifo',
          status: false,
        ),
        User(
          id: 9,
          img: '$_path/p9_1.jpg',
          imgProfile: '$_path/p9_2.jpg',
          name: 'Jeanmartin',
          surname: 'Pachas',
          status: false,
        ),
        User(
          id: 10,
          img: '$_path/p10_1.jpg',
          imgProfile: '$_path/p10_2.jpg',
          name: 'Diego',
          surname: 'Velasquez',
          status: false,
        ),
      ];
}

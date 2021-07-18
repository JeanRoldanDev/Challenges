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
          status: true,
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
          status: true,
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
          status: true,
        ),
        User(
          id: 9,
          img: '$_path/p9_1.jpg',
          imgProfile: '$_path/p9_2.jpg',
          name: 'Jeanmartin',
          surname: 'Pachas',
          status: true,
        ),
        User(
          id: 10,
          img: '$_path/p10_1.jpg',
          imgProfile: '$_path/p10_2.jpg',
          name: 'Diego',
          surname: 'Velasquez',
          status: true,
        ),
      ];
}

class Bank {
  final int id;
  final String img;
  final String pricing;

  Bank({
    required this.id,
    required this.img,
    required this.pricing,
  });

  static const _path = 'assets/images/3_challenge_diego';
  static List<Bank> get listBank => [
        Bank(id: 1, img: '$_path/1.jpg', pricing: '\$10346'),
        Bank(id: 2, img: '$_path/2.jpg', pricing: '\$1036'),
        Bank(id: 3, img: '$_path/3.jpg', pricing: '\$102'),
      ];
}

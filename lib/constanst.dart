const _path = 'assets/images/0_globals';

class UserGlobal {
  UserGlobal({
    required this.id,
    required this.img,
    required this.name,
    required this.surname,
    required this.imgProfile,
    required this.status,
  });

  final int id;
  final String img;
  final String imgProfile;
  final bool status;
  final String name;
  final String surname;

  static List<UserGlobal> get list => [
        UserGlobal(
          id: 1,
          img: '$_path/p1_1.jpg',
          imgProfile: '$_path/p1_2.jpg',
          name: 'Jean',
          surname: 'Roldan',
          status: true,
        ),
        UserGlobal(
          id: 2,
          img: '$_path/p2_1.jpg',
          imgProfile: '$_path/p2_2.jpg',
          name: 'Mika',
          surname: 'Bettosini',
          status: true,
        ),
        UserGlobal(
          id: 3,
          img: '$_path/p3_1.jpg',
          imgProfile: '$_path/p3_2.jpg',
          name: 'Mauricio',
          surname: 'Lopez',
          status: false,
        ),
        UserGlobal(
          id: 4,
          img: '$_path/p4_1.jpg',
          imgProfile: '$_path/p4_2.jpg',
          name: 'Brayan',
          surname: 'Cantos',
          status: true,
        ),
        UserGlobal(
          id: 5,
          img: '$_path/p5_1.jpg',
          imgProfile: '$_path/p5_2.jpg',
          name: 'Jose',
          surname: 'Loor',
          status: false,
        ),
        UserGlobal(
          id: 6,
          img: '$_path/p6_1.jpg',
          imgProfile: '$_path/p6_2.jpg',
          name: 'Darwin',
          surname: 'Morocho',
          status: true,
        ),
        UserGlobal(
          id: 7,
          img: '$_path/p7_1.jpg',
          imgProfile: '$_path/p7_2.jpg',
          name: 'Brian',
          surname: 'Castillo',
          status: true,
        ),
        UserGlobal(
          id: 8,
          img: '$_path/p8_1.jpg',
          imgProfile: '$_path/p8_2.jpg',
          name: 'Lis',
          surname: 'Rengifo',
          status: false,
        ),
        UserGlobal(
          id: 9,
          img: '$_path/p9_1.jpg',
          imgProfile: '$_path/p9_2.jpg',
          name: 'Jeanmartin',
          surname: 'Pachas',
          status: false,
        ),
        UserGlobal(
          id: 10,
          img: '$_path/p10_1.jpg',
          imgProfile: '$_path/p10_2.jpg',
          name: 'Diego',
          surname: 'Velasquez',
          status: false,
        ),
      ];
}

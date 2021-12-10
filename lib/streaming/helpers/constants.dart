import 'package:flutter/widgets.dart';

const paddingPage = EdgeInsets.symmetric(horizontal: 10);

class Constants {
  static const double heightHeader = 140;
  static const String path = 'assets/images/6_streaming';

  static const List<String> imgs = [
    '$path/201.png',
    '$path/202.png',
    '$path/203.png',
  ];

  static const List<Game> games = [
    Game(
      img: '$path/1.png',
      name: 'Fortnite',
      title: 'Fortnite: Battle Royale',
      spectators: 64,
      followers: 45,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
    Game(
      img: '$path/2.png',
      name: 'Minecraft',
      title: 'Minecraft Earth',
      spectators: 100,
      followers: 3,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
    Game(
      img: '$path/3.png',
      name: 'Fall Guys',
      title: 'Fall Guys: Ultimate knockout',
      spectators: 32,
      followers: 12,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
    Game(
      img: '$path/4.png',
      name: 'Call of Duty',
      title: 'Call of Duty: Modern Warfare',
      spectators: 89,
      followers: 12,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
    Game(
      img: '$path/5.png',
      name: 'Mobile league',
      title: 'Mobile Legends: Adventure',
      spectators: 68,
      followers: 12,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
    Game(
      img: '$path/7.png',
      name: 'Mario',
      title: 'Super Mario Bros',
      spectators: 10,
      followers: 9,
      tags: ['Acción', 'Plataformas', 'Deportes'],
    ),
  ];

  static const List<GameExplorer> gamesExplorer = [
    GameExplorer(
      img: '$path/item1.png',
      name: 'Fire Fire',
      views: '18.6 K',
    ),
    GameExplorer(
      img: '$path/item3.png',
      name: 'Clash Royale',
      views: '28.3 K',
    ),
    GameExplorer(
      img: '$path/item2.png',
      name: 'Game Over',
      views: '14.3 K',
    ),
    GameExplorer(
      img: '$path/item1.png',
      name: 'Fire Fire',
      views: '18.6 K',
    ),
    GameExplorer(
      img: '$path/item3.png',
      name: 'Clash Royale',
      views: '28.3 K',
    ),
  ];
}

class GameExplorer {
  const GameExplorer({
    required this.img,
    required this.name,
    required this.views,
  });
  final String img;
  final String name;
  final String views;
}

class Game {
  const Game({
    required this.img,
    required this.name,
    required this.title,
    required this.spectators,
    required this.followers,
    required this.tags,
  });
  final String img;
  final String name;
  final String title;
  final int spectators;
  final int followers;
  final List<String> tags;
}

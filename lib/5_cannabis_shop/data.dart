class DataCannabisShop {
  static const _path = 'assets/images/5_cannabis_shop';
  static List<Product> cart = [
    Product(
      title: 'Royal High Green',
      subTitle: 'Semilla de cannabis',
      price: 260.00,
      cant: 1,
      img: '$_path/0.png',
    ),
  ];
}

class Product {
  final String title;
  final String subTitle;
  final double price;
  final int cant;
  final String img;

  Product({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.cant,
    required this.img,
  });
}

import 'package:challenges/4_car_selling/pages/constants.dart';
import 'package:challenges/4_car_selling/pages/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

// https://dribbble.com/shots/15104445-car-selling-app
//Mahdi.design

class CarSelling extends StatefulWidget {
  const CarSelling({Key? key}) : super(key: key);

  @override
  _CarSellingState createState() => _CarSellingState();
}

class _CarSellingState extends State<CarSelling>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> selectedItemBrand = ValueNotifier<int>(1);
  ValueNotifier<int> selectedItemMenuBottom = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CColors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //BODY
            Container(
              width: CC(context).width,
              height: CC(context).height,
              color: CColors.background,
              padding: EdgeInsets.only(top: 140, bottom: 100),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  ListVehicles(
                    onChange: (x) {
                      print(x);
                    },
                    onTapItem: (item) {
                      print(item);
                      Navigator.of(context).push<bool?>(
                        CupertinoPageRoute<bool?>(
                          builder: (_) => Page2(),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Best Selling",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          // fontFamily: CFonts.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 160,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: CColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/4_car_selling/46.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Tesla",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //HEADER
            Header(height: 60),
            //MENU CIRCULAR
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Menu(
                height: 90,
                selectedItemBrand: selectedItemBrand,
                onSelectedItemChanged: (x) {
                  selectedItemBrand.value = x;
                },
              ),
            ),
            // TAB BUTTOM
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MenuBottom(
                height: 80.0,
                onSelectedItem: (item) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBottom extends StatelessWidget {
  MenuBottom({
    Key? key,
    this.height = 80.0,
    required this.onSelectedItem,
  }) : super(key: key);

  final double height;
  final void Function(int) onSelectedItem;

  final ValueNotifier<int> index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Curve1(),
      child: Container(
        height: height,
        color: Colors.white,
        alignment: Alignment.topLeft,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: index,
              builder: (_, value, __) {
                return ItemMenuBottom(
                  onTap: () {
                    onSelectedItem.call(0);
                    index.value = 0;
                  },
                  status: value == 0 ? true : false,
                  text: 'Home',
                  iconData: CupertinoIcons.home,
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: index,
              builder: (_, value, __) {
                return ItemMenuBottom(
                  onTap: () {
                    onSelectedItem.call(1);
                    index.value = 1;
                  },
                  status: value == 1 ? true : false,
                  text: 'Search',
                  iconData: CupertinoIcons.search,
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: index,
              builder: (_, value, __) {
                return ItemMenuBottom(
                  onTap: () {
                    onSelectedItem.call(2);
                    index.value = 2;
                  },
                  status: value == 2 ? true : false,
                  text: 'Buy',
                  iconData: Icons.shopping_bag_outlined,
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: index,
              builder: (_, value, __) {
                return ItemMenuBottom(
                  onTap: () {
                    onSelectedItem.call(3);
                    index.value = 3;
                  },
                  status: value == 3 ? true : false,
                  text: 'User',
                  iconData: CupertinoIcons.person,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMenuBottom extends StatelessWidget {
  final String text;
  final bool status;
  final IconData iconData;
  final VoidCallback onTap;
  ItemMenuBottom({
    Key? key,
    this.text = 'Title',
    this.status = false,
    this.iconData = Icons.stop,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: status
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            : Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  iconData,
                  size: 30,
                ),
              ),
      ),
    );
  }
}

class ListVehicles extends StatefulWidget {
  const ListVehicles({
    Key? key,
    required this.onChange,
    required this.onTapItem,
  }) : super(key: key);

  final void Function(int) onChange;
  final void Function(int) onTapItem;

  @override
  _ListVehiclesState createState() => _ListVehiclesState();
}

class _ListVehiclesState extends State<ListVehicles> {
  late final _pageController = PageController(
    viewportFraction: 0.6,
    initialPage: 1,
  );
  double _currentPage = 0.00;

  void controllerListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener(controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(controllerListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const height = 360.0;
    return Container(
      height: height,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 10 + 1,
        onPageChanged: widget.onChange,
        itemBuilder: (ctx, index) {
          final operation = _currentPage - index;
          final double value =
              operation > 0 ? (operation - (operation * 2)) : operation;
          final double calScala = (operation.abs() - 1).abs();
          final double scala = calScala >= 0.70 ? calScala : 0.70;
          final double calRotateY = (50 / 100) * (operation * 100);
          final double calRotateZ = (5 / 100) * (operation * 100);
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(vector.radians(calRotateY))
              ..rotateZ(vector.radians(calRotateZ))
              ..scale(0.9999, scala)
              ..translate(-0.10, (height * 0.25) * (value)),
            child: Container(
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: CColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 150,
                            child: SvgPicture.asset(
                              'assets/images/4_car_selling/icons/3.svg',
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                              color: CColors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              tileMode: TileMode.clamp,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.30),
                                Colors.white.withOpacity(0.70),
                                CColors.white.withOpacity(0.99),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/images/4_car_selling/1.png',
                      height: 150,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tesla',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CColors.black,
                    ),
                  ),
                  Text(
                    'Model S',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: CColors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            '\$132.990',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          widget.onTapItem(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'See more',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: CColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    this.height = 100.0,
    required this.selectedItemBrand,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  final double height;
  final ValueListenable<int> selectedItemBrand;
  final void Function(int) onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Curve2(),
      child: Container(
        height: height,
        color: CColors.white,
        child: Stack(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView(
                onSelectedItemChanged: onSelectedItemChanged,
                offAxisFraction: -0.80,
                itemExtent: 90,
                physics: BouncingScrollPhysics(),
                children: List.generate(
                  6,
                  (x) => RotatedBox(
                    quarterTurns: 1,
                    child: AnimatedBuilder(
                      animation: selectedItemBrand,
                      builder: (context, child) {
                        return Container(
                          height: 130,
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 7),
                                child: SvgPicture.asset(
                                  'assets/images/4_car_selling/icons/' +
                                      (x + 1).toString() +
                                      '.svg',
                                  color: Colors.black54,
                                  width:
                                      x == selectedItemBrand.value ? 100 : 50,
                                  height:
                                      x == selectedItemBrand.value ? 100 : 50,
                                ),
                              ),
                              x == selectedItemBrand.value
                                  ? Container(
                                      height: 5,
                                      color: Colors.blue.shade600,
                                    )
                                  : SizedBox.shrink(),
                              x == selectedItemBrand.value
                                  ? Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          tileMode: TileMode.clamp,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.blue.shade600
                                                .withOpacity(0.01),
                                            Colors.blue.shade600
                                                .withOpacity(0.05),
                                            Colors.blue.shade600
                                                .withOpacity(0.20),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.centerLeft,
                  end: Alignment.center,
                  colors: [
                    CColors.white.withOpacity(0.90),
                    CColors.white.withOpacity(0.70),
                    CColors.white.withOpacity(0.20),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.centerRight,
                    end: Alignment.center,
                    colors: [
                      CColors.white.withOpacity(0.90),
                      CColors.white.withOpacity(0.70),
                      CColors.white.withOpacity(0.20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double height;
  const Header({Key? key, this.height = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: CColors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/4_car_selling/p1_1.jpg'),
            backgroundColor: Colors.transparent,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jean Roldan',
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                  color: CColors.black,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: CColors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: Icon(CupertinoIcons.search),
          )
        ],
      ),
    );
  }
}

class Curve2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = new Paint()
      ..color = Colors.red.withOpacity(0.6)
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height, (size.width / 2) + 50, size.height);
    path.lineTo((size.width / 2) - 50, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height, 0, size.height - 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Curve1 extends CustomClipper<Path> {
  static const ax = 60.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, ax, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

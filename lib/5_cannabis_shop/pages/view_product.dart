import 'dart:ui';

import 'package:challenges/5_cannabis_shop/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key? key}) : super(key: key);

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: FondoPainter(color: Helpers.backgroud),
            child: Container(
              width: double.infinity,
              height: size.height * 0.88,
              child: Stack(
                children: [
                  // ---- boton salir ---
                  Positioned(
                    top: 20,
                    left: size.width * 0.30,
                    child: InkWell(
                      onTap: () => _close(context),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.clear_thick,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.width * 0.22,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Mi Carrito',
                            style: Helpers.txtTitlemodal,
                          ),
                          subtitle: Text(
                            '2 productos',
                            style: Helpers.txtSubTitlemodal,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemExtent: 150,
                              itemCount: DataCannabisShop.cart.length,
                              itemBuilder: (context, index) {
                                var item = DataCannabisShop.cart[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: Colors.yellow,
                                        child: Image.asset(item.img),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.red,
                                          child: Column(
                                            children: [
                                              Text(item.subTitle),
                                              Text(item.title),
                                              Container(
                                                color: Colors.blue,
                                                child: _CantEdit(
                                                  initial: item.cant,
                                                  product: item,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CantEdit extends StatelessWidget {
  _CantEdit({
    Key? key,
    this.initial = 3,
    required this.product,
  }) : super(key: key);
  final int initial;
  final Product product;

  final ValueNotifier<int> cant = ValueNotifier<int>(0);
  final ValueNotifier<double> price = ValueNotifier<double>(0);

  void _add() {
    cant.value++;
    price.value = cant.value * product.price;
    if (cant.value > 99) {
      cant.value = 99;
      price.value = 99 * product.price;
    }
  }

  void _minis() {
    cant.value--;
    price.value = cant.value * product.price;
    if (cant.value <= 1) {
      cant.value = 1;
      price.value = product.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    cant.value = this.initial;
    price.value = this.initial * product.price;
    return Row(
      children: [
        // ---------------------------------------
        // --------------PRICE CALC---------------
        ValueListenableBuilder<double>(
          valueListenable: price,
          builder: (_, value, __) {
            return Text(
              '\$$value',
              style: Helpers.txtPrice,
            );
          },
        ),
        // ---------------------------------------

        // ---------------------------------------
        // --------------CANT EDIT---------------
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            color: Helpers.grey,
            borderRadius: BorderRadius.circular(35),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: Row(
            children: [
              InkWell(
                onTap: _minis,
                child: Icon(
                  CupertinoIcons.minus_circle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ValueListenableBuilder<int>(
                    valueListenable: cant,
                    builder: (_, value, __) {
                      return Text(
                        value.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: _add,
                child: Icon(
                  CupertinoIcons.add_circled,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//https://yqnn.github.io/svg-path-editor/
//https://fluttershapemaker.com/
class FondoPainter extends CustomPainter {
  FondoPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.28);
    path.lineTo(size.width * 0.861, size.height * 0.03);
    path.quadraticBezierTo(
      size.width * 0.84,
      size.height * 0.00,
      size.width * 0.78,
      size.height * 0.003,
    );
    path.lineTo(size.width * 0.07, size.height * 0.097);
    path.quadraticBezierTo(
      0,
      size.height * 0.11,
      0,
      size.height * 0.14,
    );
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(FondoPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FondoPainter oldDelegate) => false;
}

import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: Constants.heightHeader),
            const _Discover(),
            const _LiveChannels(),
            const Padding(
              padding: paddingPage,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Juego Recomendados',
                  style: TextStyles.txtTitle,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: Constants.games.length,
                itemExtent: MediaQuery.of(context).size.width / 3.4,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, item) {
                  final game = Constants.games[item];
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              game.img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          game.name,
                          style: TextStyles.txtDefault,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _Discover extends StatelessWidget {
  const _Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingPage,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CColors.purple,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                const Text(
                  'Descubrir',
                  style: TextStyles.txtTitle,
                ),
                const SizedBox(width: 30),
                const Text(
                  'Siguiendo',
                  style: TextStyles.txtTitleLigth,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: CColors.purple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ItemDiscover(
                      assetName: Images.icon1,
                      title: 'Acción',
                      shadowColor: const Color(0xffFC7C68).withOpacity(0.50),
                    ),
                    _ItemDiscover(
                      assetName: Images.icon4,
                      title: 'Storts',
                      shadowColor: const Color(0xffFFD93A).withOpacity(0.50),
                    ),
                    _ItemDiscover(
                      assetName: Images.icon3,
                      title: 'Rpg',
                      shadowColor: const Color(0xffA93AFF).withOpacity(0.50),
                    ),
                    _ItemDiscover(
                      assetName: Images.icon2,
                      title: 'Musica',
                      shadowColor: const Color(0xff3AFFE1).withOpacity(0.50),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CColors.whiteLigth,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDiscover extends StatelessWidget {
  const _ItemDiscover({
    Key? key,
    required this.assetName,
    required this.title,
    required this.shadowColor,
  }) : super(key: key);

  final String assetName;
  final String title;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: PhysicalModel(
                color: Colors.transparent,
                shadowColor: shadowColor,
                elevation: 10,
                shape: BoxShape.circle,
                child: SvgPicture.asset(
                  assetName,
                  allowDrawingOutsideViewBox: true,
                  // color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(title, style: TextStyles.txtDefault)
          ],
        )
      ],
    );
  }
}

class _LiveChannels extends StatelessWidget {
  const _LiveChannels({
    Key? key,
  }) : super(key: key);

  static const tags = ['Acción', 'Plataformas', 'Deportes'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //---------------------------------------------------
        //-----------------------TITLE-----------------------
        const Padding(
          padding: paddingPage,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Canales en vivo',
              style: TextStyles.txtTitle,
            ),
          ),
        ),
        //---------------------------------------------------
        //-----------------------SLIDER LIVES----------------
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: Constants.imgs.length,
            controller: PageController(viewportFraction: 0.9),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              final img = Constants.imgs[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red.withRed(index * 30),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: CColors.pink,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: const Text(
                              'En vivo',
                              style: TextStyles.txtDefault,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: CColors.purple,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: const Text(
                              '13K View',
                              style: TextStyles.txtDefault,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        //---------------------------------------------------
        //-----------------------LIVES DESCRIPTIONS----------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                'Auronplay ',
                style: TextStyles.txtDefaultB,
              ),
              Text(
                'esta transmitiendo ',
                style: TextStyles.txtDefault,
              ),
              Text(
                'Amoung us',
                style: TextStyles.txtDefaultB,
              ),
            ],
          ),
        ),
        //---------------------------------------------------
        //-----------------------LIVES TAGS----------
        Container(
          height: 30,
          padding: paddingPage,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              tags.length,
              (i) => Container(
                decoration: BoxDecoration(
                  color: CColors.purpleLigth,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  tags[i],
                  style: TextStyles.txtTag,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

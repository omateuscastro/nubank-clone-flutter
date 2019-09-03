import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:nubank/bloc/galeria.dart';
import 'package:nubank/widget/card-bottom.dart';
import 'package:nubank/widget/card-center.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PageController pageController =
      new PageController(initialPage: 0, viewportFraction: 1.0);

  final GaleriaBloc galeriaBloc = BlocProvider.getBloc<GaleriaBloc>();

  Animation<double> opacityAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: SafeArea(
            top: true,
            bottom: true,
            child: Scaffold(
                backgroundColor: Colors.purple,
                body: Container(
                    color: Colors.purple,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Text("Nome do vivente"),
                        AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Opacity(
                                      opacity: opacityAnimation.value,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: ListView(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                              CardBottom(),
                                            ],
                                          ))));
                            }),
                        StreamBuilder(
                            stream: galeriaBloc.update,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Positioned(
                                    top: snapshot.data,
                                    left: 0,
                                    right: 0,
                                    bottom: -snapshot.data,
                                    child: Center(
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            child: PageView(
                                              children: <Widget>[
                                                CardCenter(
                                                  callback: (val) {
                                                    if (val) {
                                                      animationController
                                                          .reverse();
                                                    } else {
                                                      animationController
                                                          .forward();
                                                    }
                                                  },
                                                ),
                                                CardCenter(
                                                  callback: (val) {
                                                    if (val) {
                                                      animationController
                                                          .reverse();
                                                    } else {
                                                      animationController
                                                          .forward();
                                                    }
                                                  },
                                                ),
                                                CardCenter(
                                                  callback: (val) {
                                                    if (val) {
                                                      animationController
                                                          .reverse();
                                                    } else {
                                                      animationController
                                                          .forward();
                                                    }
                                                  },
                                                )
                                              ],
                                            ))));
                              } else {
                                return Container();
                              }
                            })
                      ],
                    )))));
  }
}

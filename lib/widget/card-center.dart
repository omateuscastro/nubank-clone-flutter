import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:nubank/bloc/galeria.dart';

class CardCenter extends StatefulWidget {
  final Function(bool isTop) callback;

  CardCenter({this.callback});

  @override
  _CardCenterState createState() => _CardCenterState();
}

class _CardCenterState extends State<CardCenter> {
  final GaleriaBloc galeriaBloc = BlocProvider.getBloc<GaleriaBloc>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails value) {
          galeriaBloc.updateBloc(value.globalPosition.dy - context.size.height,
              value.globalPosition.dy - MediaQuery.of(context).size.height);
          if (value.delta.dy < 0) {
            galeriaBloc.delta = true;
            this.widget.callback(true);
          } else {
            galeriaBloc.delta = false;
            this.widget.callback(false);
          }
        },
        onVerticalDragEnd: (value) {
          galeriaBloc.bottomBloc(MediaQuery.of(context).size.height * 0.6);
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.credit_card, color: Colors.black54),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Cartão de crédito",
                                        style:
                                            TextStyle(color: Colors.black54)))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("FATURA ATUAL",
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 12)),
                                Row(children: <Widget>[
                                  Text(
                                    "R\$ ",
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 30),
                                  ),
                                  Text(
                                    "1.427",
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ",85",
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 30),
                                  )
                                ]),
                                Row(
                                  children: <Widget>[
                                    Text("Limite disponivel ",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12)),
                                    Text("R\$ 2.514,15",
                                        style: TextStyle(
                                            color: Colors.lightGreen,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            height: 70,
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 10,
                                    child: Icon(
                                      Icons.build,
                                      color: Colors.black54,
                                      size: 15,
                                    )),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 45,
                                  right: 45,
                                  child: Center(
                                      child: Text(
                                    "Compra mains recente em Amazon Web Services no valor de R\$ 230,54 hoje",
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 10,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black54,
                                      size: 10,
                                    )),
                              ],
                            ))
                      ],
                    )),
                Positioned(
                  bottom: 80,
                  top: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(40.0),
                                    topRight: const Radius.circular(40.0))),
                            width: 10,
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            width: 10,
                            color: Colors.lightBlue,
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                            width: 10,
                            decoration: new BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: new BorderRadius.only(
                                    bottomLeft: const Radius.circular(40.0),
                                    bottomRight: const Radius.circular(40.0)))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

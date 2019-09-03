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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Card(
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 10,
                    left: 10,
                    right: 40,
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.credit_card, color: Colors.grey)),
                        Text("Cartão de crédito")
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("FATURA ATUAL",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12)),
                        Text(
                          "R\$ 1.427,85",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 30),
                        ),
                        Text("Limite disponivel R\$ 2.514,15",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12))
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 80,
                        color: Colors.orangeAccent,
                      ),
                      Container(
                        width: 10,
                        height: 80,
                        color: Colors.lightBlue,
                      ),
                      Container(
                        width: 10,
                        height: 80,
                        color: Colors.green,
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

import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Card(
        color: Colors.purple[300],
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: 10,
              child: Icon(Icons.person, color: Colors.white),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  "Indicar Amigos",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

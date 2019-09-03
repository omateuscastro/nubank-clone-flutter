import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Card(
        elevation: 0,
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
                right: 10,
                child: Text(
                  "Indicar Amigos",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}

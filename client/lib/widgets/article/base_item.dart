import 'package:flutter/material.dart';

class BaseItem extends StatelessWidget {
  Widget image;
  Widget content;

  BaseItem({@required this.image, @required this.content, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: image,
          ),
          Container(
            height: 80,
            child: content,
          )
        ],
      ),
    );
  }
}

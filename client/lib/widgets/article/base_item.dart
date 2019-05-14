import 'package:flutter/material.dart';

class BaseItem extends StatelessWidget {
  Widget content;
  Widget image;
  Function onPressed;
  double _containerHeight;
  double _imageHeight;
  double _contentHeight;
  double _rectRadius;

  BaseItem(
      {@required this.image,
      @required this.content,
      @required this.onPressed,
      Key key}) {
    _containerHeight = 170;
    _imageHeight = 120;
    _contentHeight = _containerHeight - _imageHeight;
    _rectRadius = 8;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerHeight,
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Container(
            height: _imageHeight,
            width: double.infinity,
            child: SizedBox.expand(
              child: image,
            ),
          ),
          Container(
            height: _contentHeight,
            child: content,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_rectRadius),
                bottomRight: Radius.circular(_rectRadius),
              ),
            ),
          )
        ],
      ),
    );
  }
}

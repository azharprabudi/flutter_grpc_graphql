import 'package:client/widgets/article/base_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoad extends StatelessWidget {
  double _lineHeight;
  double _lineWidth;

  ItemLoad({Key key}) {
    _lineHeight = 8;
    _lineWidth = 220;
  }

  @override
  Widget build(BuildContext context) {
    return BaseItem(
      image: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[200],
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              width: _lineWidth,
              height: _lineHeight,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[200],
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              width: _lineWidth,
              height: _lineHeight,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

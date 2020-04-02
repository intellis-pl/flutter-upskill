import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteWidgetSate();

}

class FavoriteWidgetSate extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 40;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
              icon: _getFavoriteIconState(),
              color: Colors.yellow[600],
              onPressed: _toggleFavorite,
          ),
        ),
        Container( //TODO or SizedBox
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount++;
        _isFavorited = false;
      } else {
        _favoriteCount--;
        _isFavorited = true;
      }
    });
  }

  Widget _getFavoriteIconState() => _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border);
}
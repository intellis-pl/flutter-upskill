import 'package:flutter/material.dart';

import 'favorite_widget_state.dart';

class MainPageScreen extends StatelessWidget {
  static const String _PAGE_TITLE = "Funclub szlonej Puchy z Różanki";
  static const String _PAGE_SUBTITLE = "Pucha to szlaony kot, co uwielbia drapać nowe kanapy i fotele";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page')
      ),
          body: Center(
            child: Wrap(
              children: <Widget>[
                Column(
                  children: [
                    _addWallpaper(),
                    _getTitleSelection(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            _addButton(Icons.call, "CALL", "call", context),
                            _addButton(Icons.description, "DESCRIPTION", "description", context),
                            _addButton(Icons.share, "SHARE", "share", context),
                            ])
                    ),
                    _addDescription(),
                  ],
                )
              ],
            ),
          )
      );
  }

  Widget _getTitleSelection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    _PAGE_TITLE,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                    _PAGE_SUBTITLE,
                    style: TextStyle(
                        color: Colors.grey[500]
                    ))
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }

  Widget _getMiddleButtons(Color color, IconData icon, String label) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          child: Text(
              label
          ),
        )
      ],
    );
  }

  Widget _addButton(IconData icon, String label, String route, context) {
    return
      Container(
        child: FlatButton(
          child: _getMiddleButtons(Colors.red, icon, label),
          onPressed: () {
            Navigator.pushNamed(context, '/' + route);
          },
          color: Colors.transparent,
        ),
      );
  }

  Widget _addDescription() {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      ),
    );
  }

  Widget _addWallpaper() {
    return Image.asset(
        'images/pucha.jpeg',
        fit: BoxFit.cover);
  }
}
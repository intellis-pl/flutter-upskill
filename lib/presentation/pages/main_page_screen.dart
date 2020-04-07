import 'package:flutter/material.dart';
import 'package:multilayerapp/presentation/widgets/favorite_star/favorite_widget_state.dart';

class MainPageScreen extends StatelessWidget {
  static const String _PAGE_TITLE = "Mobile VAT calculator";
  static const String _PAGE_SUBTITLE = "This app will help you to calculate a polish VAT rates from your invoices";
  static const String _MAIN_PAGE_IMAGE = "tax.jpeg";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('VAT-insider')
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
                            _addButton(Icons.account_balance_wallet, "CALCULATOR", "calculator", context),
                            _addButton(Icons.call, "CONTACT", "contact", context),
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
    return Container(
        height: 150,
        width: 500,
        child:
          Image.asset(
          'images/' + _MAIN_PAGE_IMAGE,
          fit: BoxFit.fitWidth)
    );
  }
}
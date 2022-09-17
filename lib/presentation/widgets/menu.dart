import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_application_1/presentation/pages/cart.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;

class MainMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: style.MainAppStyle().bodyBG,
      foregroundColor: style.MainAppStyle().mainColor,
      //title: const Text('title'),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.short_text),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Badge(
            elevation: 1.0,
            badgeColor: Colors.white,
            position: BadgePosition.bottomEnd(bottom: 5, end: 0),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "10",
              style: TextStyle(
                color: style.MainAppStyle().mainColor,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCart(),
                      ));
                }),
          ),
        )
      ],
    );
  }
}

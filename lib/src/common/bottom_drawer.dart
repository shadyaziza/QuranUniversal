import 'package:flutter/material.dart';

class BottomDrawer extends StatelessWidget {
  final Locale locale;
  final VoidCallback onTap;
  final String title;
  final VoidCallback showSnackBar;
  const BottomDrawer(
      {Key key,
      @required this.locale,
      @required this.onTap,
      @required this.title,
      @required this.showSnackBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (con) {
        return ListView(
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                "assets/imgs/quran.png",
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                title,
                textScaleFactor: 1.4,
              )),
            ),
            ListTile(
              title: Text(
                locale.languageCode == 'ar' ? 'المفضلات' : "Starred",
              ),
              leading: Icon(
                Icons.star_border,
              ),
              onTap: showSnackBar,
            ),
            ListTile(
              title: Text(
                locale.languageCode == 'ar' ? "إعدادات" : 'Settings',
              ),
              leading: Icon(
                Icons.settings,
              ),
              onTap: showSnackBar,
            ),
            Align(
              // heightFactor: 7.5,
              alignment: locale?.languageCode == 'ar'
                  ? FractionalOffset.bottomLeft
                  : FractionalOffset.bottomRight,
              child: Directionality(
                textDirection: locale?.languageCode == 'ar'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: ListTile(
                    leading: Icon(Icons.language),
                    title:
                        Text(locale?.languageCode == 'ar' ? 'English' : 'عربي'),
                    enabled: true,
                    onTap: onTap),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onTap(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(locale.languageCode == 'ar'
            ? 'الخاصية غير متوفرة حالياً.'
            : 'This feature is not available yet.')));
  }
}

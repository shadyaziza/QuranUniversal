import 'package:flutter/material.dart';
import '../locale/locales.dart';
import './bottom_drawer.dart';

class StackedScaffoldBody extends StatefulWidget {
  final Widget child;
  final AppLocalizations locals;
  final VoidCallback onTap;
  final Locale locale;

  const StackedScaffoldBody(
      {Key key,
      @required this.locals,
      @required this.child,
      @required this.onTap,
      @required this.locale})
      : super(key: key);

  @override
  _StackedScaffoldBodyState createState() => _StackedScaffoldBodyState();
}

class _StackedScaffoldBodyState extends State<StackedScaffoldBody>
    with SingleTickerProviderStateMixin {
  AnimationController _anController;
  Animation _an;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _anController = AnimationController(
      vsync: this,
      // animationBehavior: AnimationBehavior.preserve,
      duration: Duration(milliseconds: 1200),
      // value: 5.0,
      // lowerBound: 0.0,
      // upperBound: 10.0);
    );
    // _an = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //   parent: _anController,
    //   curve: Interval(0.0, 0.5, curve: Curves.linear),
    // ));
    // _anController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        alignment: FractionalOffset.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.cyan[700], width: 12.0))),
              padding: const EdgeInsets.only(top: 12.0),
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _anController.forward().then((_) {
                        showModalBottomSheet(
                                builder: (context) {
                                  return BottomDrawer(
                                    locale: widget.locale,
                                    onTap: widget.onTap,
                                    title: widget.locals.title,
                                    showSnackBar: _showSnackBar,
                                  );
                                },
                                context: context)
                            .then((_) => _anController.reverse());
                      });
                    },
                    child: Hero(
                      tag: 'drawer',
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_home,
                        progress: _anController,
                      ),
                    ),
                  ),
                ),
                elevation: 0.0,
                centerTitle: true,
                title: Text(widget.locals.title),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              // alignment: Alignment(0.5, 10.0),
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 0.2,
                child: widget.child,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar() {
    Navigator.pop(context);
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(widget.locale.languageCode == 'ar'
            ? 'الخاصية غير متوفرة حالياً.'
            : 'This feature is not available yet.')));
  }
}

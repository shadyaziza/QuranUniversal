import 'package:flutter/material.dart';
import '../locale/locales.dart';

class StackedScaffoldBody extends StatelessWidget {
  final Widget child;
  final AppLocalizations locals;

  const StackedScaffoldBody(
      {Key key, @required this.locals, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 12.0),
            child: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text(locals.title),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Container(
            // alignment: Alignment(0.5, 10.0),
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 2.0,
              child: child,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2.0)),
            ),
          ),
        ),
      ],
    );
  }
}

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
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border(
                    bottom: BorderSide(color: Colors.cyan[700], width: 12.0))),
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
              elevation: 0.2,
              child: child,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

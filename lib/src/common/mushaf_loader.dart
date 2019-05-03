import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class MushafLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlareActor(
        'assets/flares/Mushaf.flr',
        animation: 'fade opacity',
      ),
    );
  }
}

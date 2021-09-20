import 'package:flutter/material.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          child: SpinKitSquareCircle(
            color: kcSecondaryColor,
            size: 50.0,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      drawer: MenuLateral(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kcPrimaryColor),
        title: Text('Lart', style: ktsSubheader),
      ),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
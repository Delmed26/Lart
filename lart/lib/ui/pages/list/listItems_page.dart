import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lart/ui/shared/styles.dart';

class ListItemsPage extends StatefulWidget {
  ListItemsPage({Key? key}) : super(key: key);

  @override
  _ListItemsPageState createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    DocumentReference<Map<String, dynamic>> path = args['listPath'];

    return Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: kcPrimaryColor),
        ),
        body: Center(child: Text(path.toString())));
  }
}

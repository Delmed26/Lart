import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key, required this.name, required this.date}) : super(key: key);
  final String name;
  final Timestamp date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                color: Colors.grey.shade400,
                offset: Offset(0, 3))
          ]),
      child: Row(
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(DateFormat('yyyy-MM-dd').format(date.toDate()))
              ]
            
          )
        ]
      ),
    );
  }
}

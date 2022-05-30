import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lart/ui/shared/styles.dart';
import 'dart:math' as math;

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {Key? key,
      required this.name,
      required this.date,
      required this.progress,
      required this.isShared,
      required this.listPath})
      : super(key: key);

  final String name;
  final Timestamp date;
  final double progress;
  final bool isShared;
  final DocumentReference<Map<String, dynamic>> listPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'listItems',
            arguments: {'listPath': listPath});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey.shade200,
                  spreadRadius: 5,
                  offset: Offset(0, 3))
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: ktsTitle, overflow: TextOverflow.ellipsis),
              Text(
                DateFormat('yyyy-MM-dd hh:mm').format(date.toDate()),
                style: ktsDrawerItem,
              )
            ]),
          ),
          isShared == true
              ? SizedBox(
                  width: 50,
                  child: Icon(Icons.people_rounded, color: kcSecondaryColor))
              : SizedBox(width: 25),
          SizedBox(
            width: 25,
            height: 25,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: kcBackgroundColor,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

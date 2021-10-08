import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lart/Data/Repositories/ad_state.dart';
import 'package:lart/main.dart';
import 'package:lart/ui/pages/home/widgets/listItem_widget.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/drawer_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lart/ui/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BannerAd banner;
  bool isBannerReady = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            listener: adState.adListener,
            request: AdRequest())
          ..load();
        isBannerReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference usersInfo =
        FirebaseFirestore.instance.collection('usersInfo');
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kcSecondaryColor,
          child: Icon(
            Icons.post_add_rounded,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kcBackgroundColor,
      drawer: LateralMenu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kcPrimaryColor),
        title: Text('Lart', style: ktsSubheader),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder<DocumentSnapshot>(
                future:
                    usersInfo.doc(FirebaseAuth.instance.currentUser!.uid).get(),
                    builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.somethingWrong),
                      );
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.noDataLists),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return ListView.builder(
                        itemCount: (data['lists'] as List<dynamic>).length,
                        itemBuilder: (BuildContext context, int i) {
                          return ListItemWidget(
                            name: data['lists'][i]['name'].toString(),
                            date: data['lists'][i]['dateOfExpire'],
                          );
                        }
                      );
                    }

                    return LoadingWidget();
                  },
                )
              ),
              isBannerReady == false
                  ? SizedBox(height: 50)
                  : Container(height: 50, child: AdWidget(ad: banner))
            ],
          )),
    );
  }
}

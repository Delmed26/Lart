import 'package:flutter/material.dart';
import 'package:lart/Data/Repositories/ad_state.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/drawer_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

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
            request: AdRequest()
        )..load();
        isBannerReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: kcPrimaryColor,
        child: Icon(Icons.post_add_rounded),
      ),
      backgroundColor: kcBackgroundColor,
      drawer: MenuLateral(),
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
              child: ListView(
                children: [
                  Container(height: 200, color: kcPrimaryColor,),
                  Container(height: 200, color: kcSecondaryColor,),
                  Container(height: 200, color: kcBlueColor,),
                  Container(height: 200, color: kcPrimaryColor,),
                  Container(
                    child: Text('This is my homepage'),
                  )
                ],
              )
            ),
            isBannerReady == false
              ? SizedBox(height: 50)
              : Container(height: 50, child: AdWidget(ad: banner))
          ],
        )
              
      ),
    );
  }
}


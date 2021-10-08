import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(children: [
        Expanded(
          child: Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: <Color>[kcPrimaryColor, kcBlueColor],
                )),
                accountName: Text("Fernando Delgadillo"),
                accountEmail: Text("fer@test.com"),
              ),
              new ListTile(
                leading: Icon(Icons.star_rounded, color: Color(0xFFE4D834)),
                title: Text(AppLocalizations.of(context)!.getPremium,
                    style: ktsDrawerItem),
                onTap: () {},
              ),
              Divider(height: 1),
              new ListTile(
                leading: Icon(Icons.manage_accounts_rounded,
                    color: kcSecondaryColor),
                title: Text(AppLocalizations.of(context)!.account,
                    style: ktsDrawerItem),
                onTap: () {},
              ),
              Divider(height: 1),
              new ListTile(
                leading: Icon(Icons.settings, color: kcSecondaryColor),
                title: Text(AppLocalizations.of(context)!.settings,
                    style: ktsDrawerItem),
                onTap: () {},
              ),
              Divider(height: 1),
            ],
          ),
        ),
        Container(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.logout_rounded, color: Colors.red),
                      title:
                          Text('Logout', style: TextStyle(color: Colors.red)),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/design/Twitter.svg',
                              semanticsLabel: 'Link to Twitter',
                              color: kcSecondaryColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/design/Instagram.svg',
                              semanticsLabel: 'Link to instagram',
                              color: kcSecondaryColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/design/google-play.svg',
                              semanticsLabel: 'Link to google play',
                              color: kcSecondaryColor,
                            )),
                      ],
                    )
                  ],
                ))),
      ]),
    );
  }
}

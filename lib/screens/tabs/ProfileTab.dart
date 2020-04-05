import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';

class ProfileTab extends StatelessWidget {
  Widget getSettingsRow(BuildContext context, Icon icon, String text) {
    return Row(
      children: <Widget>[
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.black),
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 220,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(22, 65, 22, 14),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/user.jpeg'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Austin Mates',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColorScheme(Theme.of(context).colorScheme).light,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(22, 28, 16, 0),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: <Widget>[
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.account_balance_wallet,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .secondary
                            .withOpacity(0.8),
                      ),
                      'My Wallet',
                    ),
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.notification_important,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .ternary,
                        size: 28,
                      ),
                      'Notifications',
                    ),
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.favorite,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .primary,
                        size: 24,
                      ),
                      'Notifications',
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Divider(),
                    ),
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.settings,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        size: 22,
                      ),
                      'Settings',
                    ),
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.person_add,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        size: 24,
                      ),
                      'Invite a Friend',
                    ),
                    getSettingsRow(
                      context,
                      Icon(
                        Icons.help,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        size: 22,
                      ),
                      'Help',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

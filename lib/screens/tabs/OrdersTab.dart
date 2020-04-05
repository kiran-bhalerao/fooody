import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/widgets/PostOrderCard.dart';
import 'package:fooody/widgets/UpcomingCard.dart';

class OrderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 290,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(22, 65, 22, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Upcoming',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white),
                  ),
                ),
                UpcomingCard()
              ],
            )),
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
                padding: EdgeInsets.fromLTRB(22, 28, 22, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Past Orders',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                            itemCount: 2,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (ctx, idx) {
                              return PostOrderCard();
                            }),
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}

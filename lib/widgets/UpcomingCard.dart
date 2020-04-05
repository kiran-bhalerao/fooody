import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';

class UpcomingCard extends StatelessWidget {
  Widget getProgressDash(BuildContext context, double size) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: (width - 88) * size,
      decoration: BoxDecoration(
        color: CustomColorScheme(Theme.of(context).colorScheme).primary,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Burger King',
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  color: Colors.grey.withOpacity(0.6),
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Estimated Arrival',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Text('25min', style: Theme.of(context).textTheme.subhead),
                    ],
                  ),
                ),
                Spacer(),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .secondary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                          color:
                              CustomColorScheme(Theme.of(context).colorScheme)
                                  .secondary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              getProgressDash(context, 0.12),
              getProgressDash(context, 0.28),
              Expanded(
                child: getProgressDash(context, 1),
              )
            ],
          )
        ],
      ),
    );
  }
}

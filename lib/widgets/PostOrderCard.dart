import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';

class PostOrderCard extends StatelessWidget {
  const PostOrderCard({
    Key key,
  }) : super(key: key);

  Widget getOrderItem(String name, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Text(
              quantity.toString(),
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pizza Hut',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'July 06, 2019 • 23:54',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Completed',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: <Widget>[
            getOrderItem('5 Cheese Pie', 1),
            getOrderItem('Peperoni Pie', 1),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .primary
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        'Get Help',
                        style: TextStyle(
                          color:
                              CustomColorScheme(Theme.of(context).colorScheme)
                                  .primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/screens/food.dart';

class TrendingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FoodScreen.routeName),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/burger.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Rodeo Burger',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'New Rodeo Burger features a savory flame-grilled beef patty topped with sweet and smoky BBQ sauce and crispy, golden onion rings served on a toasted',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 16, height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      '\$5.90',
                      style: TextStyle(
                          color:
                              CustomColorScheme(Theme.of(context).colorScheme)
                                  .primary,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

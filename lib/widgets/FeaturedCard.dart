import 'package:flutter/material.dart';
import 'package:fooody/screens/food.dart';

class FeaturedCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const FeaturedCard({
    Key key,
    @required this.name,
    @required this.image,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FoodScreen.routeName),
      child: Container(
        margin: const EdgeInsets.only(right: 18),
        padding: const EdgeInsets.all(18),
        width: 280,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.multiply),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                name,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

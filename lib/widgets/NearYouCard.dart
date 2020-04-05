import 'package:flutter/material.dart';

class NearYouCard extends StatelessWidget {
  final String icon;
  final String name;
  final String time;

  const NearYouCard({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Image.asset(
              icon,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              time,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

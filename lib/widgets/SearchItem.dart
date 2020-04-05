import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String name;

  const SearchItem({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.access_time,
              size: 18,
              color: Colors.grey.withOpacity(0.7),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.7),
                  fontFamily: 'Nunito',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

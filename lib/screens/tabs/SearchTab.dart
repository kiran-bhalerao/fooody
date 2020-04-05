import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/widgets/SearchCategoryCard.dart';
import 'package:fooody/widgets/SearchItem.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 140,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(22, 65, 22, 14),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for a dish or Restaurant',
              hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              border: InputBorder.none,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              fillColor: Colors.black.withOpacity(0.1),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
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
              padding: EdgeInsets.fromLTRB(22, 28, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recent Searches',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  Column(
                    children: <Widget>[
                      SearchItem(name: 'Burger'),
                      SearchItem(name: 'Pizza'),
                      SearchItem(name: 'Hard Rock Coffee'),
                      SearchItem(name: 'Sandwich'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 22),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 460,
                          children: <Widget>[
                            SearchCategoryCard(
                              name: 'Chicken',
                              image: 'assets/images/chicken.jpeg',
                            ),
                            SearchCategoryCard(
                              name: 'Biryani',
                              image: 'assets/images/biryani.jpg',
                            ),
                            SearchCategoryCard(
                              name: 'Breakfast',
                              image: 'assets/images/breakfast.jpeg',
                            ),
                            SearchCategoryCard(
                              name: 'Burger',
                              image: 'assets/images/burger.jpeg',
                            ),
                            SearchCategoryCard(
                              name: 'Asian',
                              image: 'assets/images/asian.jpg',
                            ),
                            SearchCategoryCard(
                              name: 'Pizza',
                              image: 'assets/images/pizza.jpeg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

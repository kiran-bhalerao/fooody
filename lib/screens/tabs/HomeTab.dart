import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/widgets/FeaturedCard.dart';
import 'package:fooody/widgets/NearYouCard.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 220,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(22, 60, 22, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'DELIVERING TO',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Post Street San Francisco, CA',
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a dish or restaurant',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            color: Colors.white),
                        border: InputBorder.none,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
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
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
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
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(22, 28, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Featured',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FeaturedCard(
                            name: 'Dum Biryani',
                            image: 'assets/images/biryani.jpg',
                            price: '\$19',
                          ),
                          FeaturedCard(
                            name: 'Burger',
                            image: 'assets/images/burger.jpeg',
                            price: '\$19',
                          ),
                          FeaturedCard(
                            name: 'Peperoni Pie',
                            image: 'assets/images/pizza.jpeg',
                            price: '\$23',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Near you',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          NearYouCard(
                            name: 'Burger King',
                            time: '30 min',
                            icon: 'assets/images/burger-king.png',
                          ),
                          NearYouCard(
                            name: 'Mc Donald\'s',
                            time: '40 min',
                            icon: 'assets/images/mc-donalds.png',
                          ),
                          NearYouCard(
                            name: 'KFC',
                            time: '20 min',
                            icon: 'assets/images/kfc.png',
                          ),
                          NearYouCard(
                            name: 'Dominos',
                            time: '10 min',
                            icon: 'assets/images/dominos.png',
                          ),
                          NearYouCard(
                            name: 'Chipotle',
                            time: '45 min',
                            icon: 'assets/images/chipotle.png',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

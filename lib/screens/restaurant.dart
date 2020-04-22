import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/widgets/CircleTabIndicator.dart';
import 'package:fooody/widgets/FeaturedCard.dart';
import 'package:fooody/widgets/TrendingCard.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurant-screen';

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void onTabSelect(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorScheme(Theme.of(context).colorScheme).ternary,
      // backgroundColor: Color(0xFFf2f2f2),
      body: Column(
        children: <Widget>[
          Container(
            height: 265,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .dark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColorScheme(Theme.of(context).colorScheme)
                            .secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset('assets/images/pizza_hut.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pizza Hut',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SmoothStarRating(
                                    rating: 1,
                                    starCount: 1,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 6, 0),
                                    child: Text(
                                      '4.5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Text(
                                      'Pizza',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Text(
                                      '\$\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 3,
                                  ),
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    '20-30 min',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                                Text(
                                  '2.2km',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFf4f4f4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                    child: TabBar(
                      controller: _tabController,
                      onTap: onTabSelect,
                      indicatorColor: Color(0xFF469469),
                      labelColor:
                          CustomColorScheme(Theme.of(context).colorScheme)
                              .primary,
                      indicator: CircleTabIndicator(
                          color:
                              CustomColorScheme(Theme.of(context).colorScheme)
                                  .primary,
                          radius: 2.8),
                      unselectedLabelColor: Colors.grey.withOpacity(0.6),
                      isScrollable: true,
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(text: 'Menu'),
                        Tab(text: 'Restaurant info'),
                        Tab(text: 'Directions'),
                        Tab(text: 'Reviews'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 0, 20),
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
                              'Trending',
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                              child: Column(
                                children: <Widget>[
                                  TrendingCard(),
                                  TrendingCard(),
                                  TrendingCard(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

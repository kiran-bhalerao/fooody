import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';

class FoodScreen extends StatefulWidget {
  static String routeName = '/food-screen';
  double offset = 30.0;
  double containerHeight = 300.0;

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
    with AfterLayoutMixin<FoodScreen>, TickerProviderStateMixin {
  PageController _pageController;
  AnimationController _controller;
  Animation<double> _animation;

  int currentPage = 0;
  double radius = 0.0;

  final List<String> images = [
    'assets/images/biryani2.jpeg',
    'assets/images/biryani.jpg',
    'assets/images/biryani1.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 1,
    );

    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    _animation = Tween<double>(
      begin: 1.4,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        radius = 35;
        _pageController.animateToPage(1,
            duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
      });
    });
  }

  Widget getExtrasRow(bool checked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor:
                    CustomColorScheme(Theme.of(context).colorScheme).secondary,
              ),
              child: Checkbox(
                value: checked,
                onChanged: (_) {},
                checkColor: Colors.white,
                activeColor:
                    CustomColorScheme(Theme.of(context).colorScheme).secondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Extra Tomatoes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: checked ? Colors.black : Colors.grey,
              ),
            ),
          ),
          Spacer(),
          Text(
            '\$2',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: checked ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform.scale(
                  scale: _animation.value,
                  alignment: Alignment.center,
                  child: Container(
                    height: widget.containerHeight,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.overlay),
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: widget.containerHeight - widget.offset,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  widget.containerHeight +
                  widget.offset,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dum Biryani',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Chicken Biryani is a delicious savory rice dish that is loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice. \nOne such biryani is the kachay gosht ki biryani or the dum biryani, where the goat meat is marinated and cooked along with the rice.',
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.4,
                            color: Colors.grey,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Let\'s make it better?',
                          style: TextStyle(
                            color:
                                CustomColorScheme(Theme.of(context).colorScheme)
                                    .primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          getExtrasRow(true),
                          getExtrasRow(false),
                          getExtrasRow(false),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: widget.containerHeight - widget.offset * 1.8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images
                        .asMap()
                        .map((i, _) {
                          bool isActive = i == currentPage;
                          return MapEntry(
                              i,
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                height: isActive ? 9 : 8,
                                width: isActive ? 9 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white
                                      .withOpacity(isActive ? 1 : 0.6),
                                ),
                              ));
                        })
                        .values
                        .toList(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        width: double.infinity,
        height: 50.0,
        child: RaisedButton(
          elevation: 0,
          highlightElevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onPressed: () {},
          color: CustomColorScheme(Theme.of(context).colorScheme).primary,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  'Add to Order',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Spacer(),
              Text(
                '\$25.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

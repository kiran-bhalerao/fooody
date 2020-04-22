import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          maxChildSize: 0.6,
          builder: (BuildContext context, ScrollController scrollController) {
            if (scrollController.hasClients) {
              print(scrollController.position.viewportDimension);
            }

            return Container(
                color: Colors.blue[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hello',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'World',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}

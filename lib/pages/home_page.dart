import 'package:flutter/material.dart';
import '/model/item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sum = 0; // holds total price for selected items
  bool _showSelected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo2.png', height: 50, width: 50,),
        centerTitle: true,
        actions: [
          // displays reset icon in AppBar
          Tooltip(
              message: 'Reset selection',
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _sum = 0;
                    for (var e in items) {
                      e.selected = false;
                    }
                    _showSelected = false;
                  });
                },
                icon: const Icon(
                  Icons.restore,
                ),
              )),
          // displays show selected icon in AppBar
          Tooltip(
              message: 'Show/Hide Selected Items',
              child: IconButton(
                onPressed: () {
                  if (_sum != 0) {
                    setState(() {
                      _showSelected = !_showSelected;
                    });
                  }
                },
                icon: const Icon(
                  Icons.shopping_bag,
                ),
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Available Shoes",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),

          const SizedBox(height: 24),

          Expanded(
            child:
            _showSelected ? ShowSelectedItems(width: screenWidth) :
            ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(192, 192, 192, 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                      children: [
                        Image.asset(items[index].image ,height: 150,width: 200,),

                        SizedBox(width: screenWidth * 0.24),

                        Text(items[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Checkbox(
                            value: items[index].selected,
                            onChanged: (e) {
                              items[index].selected = e as bool;
                              if (items[index].selected) {
                                // add its price to total price
                                _sum += items[index].price;
                              } else {
                                // subtract its price from total price
                                _sum -= items[index].price;
                              }
                              setState(() {});
                            },
                          ),
                          Text('\$${items[index].price}', style: const TextStyle(fontSize: 15),),
                        ]),

                      ],
                  ),
                  ),
              );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 8),
                      // total price
                      Text(
                        '\$$_sum',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // pay now
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade200),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Row(
                      children: [
                        Text(
                          'Pay Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),

    );
  }

}

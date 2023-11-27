import 'package:flutter/material.dart';

class Item {
  final String _name;
  final double _price;
  bool _selected = false; // determines if an item is selected from the menu
  final String _image; // holds image url

  Item(this._name, this._price, this._image,);

  // getters and setters
  String get name => _name;
  double get price => _price;
  bool get selected => _selected;
  String get image => _image;
  set selected(bool e) => _selected = e;

}

// list of items, used to populate ListView
List<Item> items = [
  Item("Grey Shoes", 249, "assets/images/GreyShoes.png",),
  Item("White Rose Shoes", 269, "assets/images/WhiteRoseShoes.png",),
  Item("Beige Shoes", 264, "assets/images/BeigeShoes.png", ),
  Item("Blue Shoes", 220, "assets/images/BlueShoes.png", ),
  Item("White Shoes", 274, "assets/images/WhiteShoes.png", ),
  Item("Blue White Shoes", 311, "assets/images/BlueWhiteShoes.png", ),
];


class ShowSelectedItems extends StatelessWidget {
  const ShowSelectedItems({required this.width, Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    List<Item> selectedItems = [];
    for (var e in items) {
      if (e.selected) {
        selectedItems.add(e);
      }
    }
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: selectedItems.length,
      itemBuilder: (context, index) {
        return Column(children: [
          SizedBox(width: width * 0.28),
          Text(
            'Price: \$${selectedItems[index].price} ${selectedItems[index].name}',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          // get image from url stored in Item image field
          Image.asset(selectedItems[index].image,
              height: width * 0.3),
          const SizedBox(height: 30),
          const Divider(),
        ]);
      },
    );
  }
}


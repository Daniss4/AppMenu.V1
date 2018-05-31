class Drink {
  final String name;
  final double price;

  const Drink({this.name, this.price});
}

const kDrink = const <Drink>[
  const Drink(
    name: 'Agua',
    price: 1.00
  ),
  const Drink(
    name: 'Cerveza',
    price: 1.10
  ),
  const Drink(
    name: 'Refrescos',
    price: 1.30
  )
];

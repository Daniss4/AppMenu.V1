class Food {
  final String name;
  final double price;

  const Food({this.name, this.price});
}

const kFood = const <Food>[
  const Food(
    name: 'Pollo al Pedro Ximenez',
    price: 12.50
  ),
  const Food(
    name: 'Lasaña',
    price: 9.99
  ),
  const Food(
      name: 'Ensalada César',
      price: 3.50
  ),
  const Food(
      name: 'Solomillo de buey',
      price: 18.90
  ),
  const Food(
      name: 'Raviolis rellenos',
      price: 9.99
  ),
  const Food(
      name: 'Spaguettis carbonara',
      price: 8.50
  )
];
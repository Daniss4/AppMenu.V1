class Menu {
  final String name;
  final String description;
  final String price;

  const Menu({this.name, this.description, this.price});
}

const kMenu = const <Menu>[
  const Menu(
    name: 'Pollo al Pedro Ximenez',
    description: 'Ingredientes: Medio pollo, Un diente de ajo, Una cebolla, Sal y pimienta, Harina, Aceite de oliva, 200 ml de vino Pedro Ximenez, Arroz o patatas (opcional)',
    price: '12.50€'
  ),
  const Menu(
    name: 'Lasaña',
    description: 'La lasaña es un tipo de pasta que se sirve en láminas, además de denominarse así también a un plato que tiene pasta en láminas intercaladas con carne y bechamel llamado lasaña al horno.',
    price: '9.99€'
  )
];
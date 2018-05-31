class Food {
  final String name;
  final String description;
  final double price;

  const Food({this.name, this.description, this.price});
}

const kFood = const <Food>[
  const Food(
    name: 'Pollo al Pedro Ximenez',
    description: 'Ingredientes: Medio pollo, Un diente de ajo, Una cebolla, Sal y pimienta, Harina, Aceite de oliva, 200 ml de vino Pedro Ximenez, Arroz o patatas (opcional)',
    price: 12.50
  ),
  const Food(
    name: 'Lasaña',
    description: 'La lasaña es un tipo de pasta que se sirve en láminas, además de denominarse así también a un plato que tiene pasta en láminas intercaladas con carne y bechamel llamado lasaña al horno.',
    price: 9.99
  ),
  const Food(
      name: 'Ensalada César',
      description: 'La ensalada César es una ensalada de lechuga romana, trocitos de pan tostado aliñados y queso parmesano.',
      price: 3.50
  ),
  const Food(
      name: 'Solomillo de buey',
      description: 'El solomillo es una pieza de carne procedente de la parte lumbar, alojado entre las costillas inferiores y la columna vertebral; más concretamente, encima de los riñones y debajo del lomo bajo; de ahí el nombre de so-lomillo. Se entiende por solomillo la pieza correspondiente al vacuno o al porcino, pues en otros animales el músculo es tan pequeño que no se despieza separadamente. El solomillo se considera en la cocina una pieza selecta de carne que se prepara de diversas formas.',
      price: 18.90
  ),
  const Food(
      name: 'Raviolis rellenos',
      description: 'Ravioli (del italiano raviolo, plural ravioli, del genovés raviolo, ‘plegado’), es el nombre de un tipo de pasta rellena con diferentes ingredientes, generalmente replegada en forma cuadrada. Se acompañan de algún tipo de salsa, en especial de tomate (similar al ragú), tucos, pesto (salsa a base de albahaca) o cremas.',
      price: 9.99
  ),
  const Food(
      name: 'Spaguettis carbonara',
      description: 'Plato originario del Lacio cuya receta original incluye huevos, queso, aceite de oliva, pancetta o guanciale y pimienta negra. Existen variantes en las que se añade nata, no presente en la receta original.',
      price: 8.50
  )
];
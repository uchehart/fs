class Addition {
  final String name;
  final String image;

  const Addition({required this.image, required this.name});

  static const samples = [
    Addition(
      image: "assets/chicken_addition.png",
      name: "Chicken",
    ),
    Addition(
      image: "assets/beef_addition.png",
      name: "Beef",
    ),
    Addition(
      image: "assets/fish_addition.png",
      name: "Fish",
    ),
  ];
}

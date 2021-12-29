class Meal {
  final String name;
  final String thumb;
  final String image;
  final String description;
  final List<List<String>> nutritionalValues;
  final List<String> ingredients;
  final double rating;
  final double price;
  final int cals;
  final int revs;
  bool hearted;

  Meal({
    required this.name,
    required this.thumb,
    required this.image,
    required this.price,
    required this.description,
    required this.nutritionalValues,
    required this.ingredients,
    this.hearted = false,
    this.rating = 1.0,
    this.cals = 0,
    this.revs = 0,
  });
}

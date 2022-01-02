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
  bool selected;
  bool hearted;
  int count;

  Meal({
    required this.name,
    required this.thumb,
    required this.image,
    required this.price,
    required this.description,
    required this.nutritionalValues,
    required this.ingredients,
    this.selected = false,
    this.hearted = false,
    this.rating = 1.0,
    this.count = 1,
    this.cals = 0,
    this.revs = 0,
  });
}

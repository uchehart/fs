class GiftPillItem {
  final String selection;
  final int noOfMeals;
  final String price;
  final bool isSelected;

  GiftPillItem({
    required this.selection,
    required this.noOfMeals,
    required this.price,
    this.isSelected = false,
  });
}

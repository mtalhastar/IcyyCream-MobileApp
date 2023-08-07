class IceCream {
  const IceCream(
      {this.id,
      required this.name,
      required this.shortDescription,
      required this.longDescription,
      required this.imageUrl,
      required this.price,
      required this.category});
  final String ?id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final double price;
  final String category;
  final String imageUrl;
}

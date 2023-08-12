class Nft {
  final String name;
  final double price;
  final String image;

  Nft(this.name, this.price, this.image);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}

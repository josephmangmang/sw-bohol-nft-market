class Nft {
  final String name;
  final double price;
  final String image;
  final bool isTrending;
  final bool isTopSelling;
  final int likes;

  Nft(
      {required this.name,
      required this.price,
      required this.image,
      required this.isTrending,
      required this.isTopSelling,
      this.likes = 0});

  // to json
  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'image': image,
        'isTrending': isTrending,
        'isTopSelling': isTopSelling,
        'likes': likes,
      };

  static Nft fromJson(Map<String, dynamic> data) {
    return Nft(
      name: data['name'],
      price: data['price'],
      image: data['image'],
      isTrending: data['isTrending'] ?? false,
      isTopSelling: data['isTopSelling']?? false,
      likes: data['likes']?? 0,
    );
  }
}

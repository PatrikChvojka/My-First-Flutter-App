class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: "lib/assets/food01.jpg",
    name: 'Sushi',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: "lib/assets/food02.jpg",
    name: 'Pizza',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: "lib/assets/food03.jpg",
    name: 'Fast food',
    address: '404 Great St',
    price: 240,
  ),
];

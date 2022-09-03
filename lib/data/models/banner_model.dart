class FrontBanner {
  String imageUrl;
  String name;
  String description;

  FrontBanner({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
}

final List<FrontBanner> banners = [
  FrontBanner(
    imageUrl: "lib/assets/banner.png",
    name: 'Víkendová zľava na naše burgre',
    description: '20% na prvú objednávku',
  ),
  FrontBanner(
    imageUrl: "lib/assets/banner.png",
    name: 'Víkendová zľava na naše burgre',
    description: '20% na prvú objednávku',
  ),
  FrontBanner(
    imageUrl: "lib/assets/banner.png",
    name: 'Víkendová zľava na naše burgre',
    description: '20% na prvú objednávku',
  ),
];

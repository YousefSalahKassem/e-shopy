class Boarding {
  final String title;
  final String image;

  Boarding({required this.title, required this.image});
}

List<Boarding> getBoardings= [
  Boarding(
    title: "Welcome to Shopify, Lets shop!",
    image: "assets/images/splash_1.png",
  ),
  Boarding(
    title: "We help people to shop easily and fast",
    image: "assets/images/splash_2.png",
  ),
  Boarding(
    title: "Explore now!",
    image: "assets/images/splash_3.png",
  ),
];

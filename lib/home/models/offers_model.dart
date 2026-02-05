class OffersModel {
  final String image;
  final String description;
  final String header;
  const OffersModel(this.image, this.description, this.header);
  static List<OffersModel> offersproduct = [
    OffersModel('assets/chicken-shwarma.png', "Special offer", "noed"),
    OffersModel('assets/Baked-Jollof-Rice 2.png', "Special offer", "noed"),
  ];
}

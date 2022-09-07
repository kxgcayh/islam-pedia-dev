class EncyclopediaModel {
  EncyclopediaModel({
    this.imgPath = '',
    required this.title,
    required this.content,
  });

  final String imgPath, title, content;

  static List<EncyclopediaModel> items = [
    EncyclopediaModel(
      title: 'Sejarah Islam Nusantara',
      content:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
    EncyclopediaModel(
      title: 'Toko Islam Nusantara',
      content:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
    EncyclopediaModel(
      title: 'Kerajaan Islam Pertama',
      content:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ];
}

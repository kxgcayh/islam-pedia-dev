class MainMenuModel {
  MainMenuModel({
    this.path,
    required this.index,
    required this.title,
  });
  final int index;
  final String title;
  final String? path;

  static List<MainMenuModel> items = [
    MainMenuModel(index: 1, title: 'Doa Harian', path: '/dailyprayer'),
    MainMenuModel(index: 2, title: 'Ensiklopedia', path: '/encyclopedia'),
    MainMenuModel(index: 3, title: 'Desain Islami'),
    MainMenuModel(index: 4, title: 'Hadits'),
  ];
}

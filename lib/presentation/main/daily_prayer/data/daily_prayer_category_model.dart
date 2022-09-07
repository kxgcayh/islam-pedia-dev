import 'package:islam_pedia/presentation/main/models/hadist_model.dart';

class DailyPrayerCategoryModel {
  DailyPrayerCategoryModel({required this.category, required this.data});

  final String category;
  final List<HadistModel> data;

  static Future<List<DailyPrayerCategoryModel>> contents() async {
    return [
      DailyPrayerCategoryModel(
        category: 'Amalan Puasa',
        data: [
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin()
        ],
      ),
      DailyPrayerCategoryModel(
        category: 'Zikir Salat',
        data: [
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin()
        ],
      ),
      DailyPrayerCategoryModel(
        category: 'Doa Pagi Petang',
        data: [
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin(),
          await HadistModel.getRandomYasin()
        ],
      ),
    ];
  }
}

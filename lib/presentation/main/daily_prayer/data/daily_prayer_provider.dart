import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islam_pedia/presentation/main/daily_prayer/data/daily_prayer_category_model.dart';
import 'package:islam_pedia/presentation/main/home/data/home_provider.dart';
import 'package:islam_pedia/presentation/main/models/hadist_model.dart';

final dailyPrayerProvider = FutureProvider<List<DailyPrayerCategoryModel>>((
  ref,
) async {
  return [
    DailyPrayerCategoryModel(
      category: 'Amalan Puasa',
      data: [
        HadistModel(
          nomor: 1,
          arab: 'bahasa arabnya',
          terjemahan: 'terjemahannya',
        ),
        HadistModel(
          nomor: 2,
          arab: 'bahasa arabnya 2',
          terjemahan: 'terjemahannya',
        ),
        HadistModel(
          nomor: 3,
          arab: 'bahasa arabnya 2',
          terjemahan: 'terjemahannya',
        ),
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
      ],
    ),
    DailyPrayerCategoryModel(
      category: 'Zikir Salat',
      data: [
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
      ],
    ),
    DailyPrayerCategoryModel(
      category: 'Doa Pagi Petang',
      data: [
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
      ],
    ),
    DailyPrayerCategoryModel(
      category: 'Zikir Malam',
      data: await ref.watch(yasinFullProvider),
    ),
    DailyPrayerCategoryModel(
      category: 'Zikir Pagi',
      data: [
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
        await ref.watch(ayatRandomProvider),
      ],
    ),
  ];
});

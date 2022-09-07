import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islam_pedia/presentation/main/daily_prayer/data/daily_prayer_category_model.dart';
import 'package:islam_pedia/presentation/main/home/data/home_provider.dart';

final dailyPrayerProvider = FutureProvider<List<DailyPrayerCategoryModel>>((
  ref,
) async {
  return [
    DailyPrayerCategoryModel(
      category: 'Amalan Puasa',
      data: [
        await ref.watch(ayatRandomProvider),
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
  ];
});

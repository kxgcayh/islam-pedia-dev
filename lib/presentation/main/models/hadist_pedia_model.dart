import 'package:islam_pedia/presentation/main/models/hadist_model.dart';

class HadistHistoryModel {
  HadistHistoryModel({
    required this.name,
    required this.pedia,
  });

  final String name;
  final List<HadistPediaModel> pedia;

  static List<HadistHistoryModel> contents = [
    HadistHistoryModel(
      name: 'Imam Bukhari',
      pedia: [
        HadistPediaModel(
          name: 'Hadist Tentang Pernikahan',
          hadist: [
            HadistModel(
              nomor: 1,
              arab: 'bahasa arab update disini',
              terjemahan: 'terjemahan bahasa arab update disini',
            ),
            HadistModel(
              nomor: 2,
              arab: 'bahasa arab update disini',
              terjemahan: 'terjemahan bahasa arab update disini',
            ),
            HadistModel(
              nomor: 3,
              arab: 'bahasa arab update disini',
              terjemahan: 'terjemahan bahasa arab update disini',
            ),
          ],
        ),
      ],
    ),
    HadistHistoryModel(
      name: 'Imam Muslim',
      pedia: [],
    ),
    HadistHistoryModel(
      name: 'Imam Abu Dawud',
      pedia: [],
    ),
  ];
}

class HadistPediaModel {
  HadistPediaModel({
    required this.name,
    required this.hadist,
  });

  final String name;
  final List<HadistModel> hadist;
}

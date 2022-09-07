import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islam_pedia/generated/assets.gen.dart';
import 'package:islam_pedia/presentation/main/models/hadist_model.dart';

final yasinFutureProvider = FutureProvider<List<HadistModel>>((ref) async {
  final file = await rootBundle.loadString(Assets.jsons.yasin);
  return List<HadistModel>.from(
    jsonDecode(file)["data"].map((x) => HadistModel.fromJson(x)),
  );
});

final ayatRandomFutureProvider = FutureProvider<HadistModel>((ref) async {
  // await Future.delayed(Duration(seconds: 5));
  final file = await rootBundle.loadString(Assets.jsons.yasin);
  final surat = List<HadistModel>.from(
    jsonDecode(file)["data"].map((x) => HadistModel.fromJson(x)),
  );
  return surat[Random().nextInt(surat.length)];
});

final ayatRandomProvider = Provider((ref) async {
  final file = await rootBundle.loadString(Assets.jsons.yasin);
  final surat = List<HadistModel>.from(
    jsonDecode(file)["data"].map((x) => HadistModel.fromJson(x)),
  );
  return surat[Random().nextInt(surat.length)];
});

final yasinFullProvider = Provider((ref) async {
  final file = await rootBundle.loadString(Assets.jsons.yasin);
  return List<HadistModel>.from(
    jsonDecode(file)["data"].map((x) => HadistModel.fromJson(x)),
  );
});

import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:islam_pedia/generated/assets.gen.dart';

class HadistModel {
  HadistModel({
    required this.nomor,
    required this.arab,
    required this.terjemahan,
  });

  final int nomor;
  final String arab, terjemahan;

  factory HadistModel.fromJson(Map<String, dynamic> json) => HadistModel(
        nomor: json["nomor"],
        arab: json["arab"],
        terjemahan: json["terjemahan"],
      );

  Map<String, dynamic> toJson() {
    return {
      "nomor": nomor,
      "arab": arab,
      "terjemahan": terjemahan,
    };
  }

  static Future<List<HadistModel>> yasin() async {
    // Beri perintah
    final file = await rootBundle.loadString(
      Assets.jsons.yasin,
    ); // menunggu hasil perintah
    return List<HadistModel>.from(
      jsonDecode(file)["data"].map((x) => HadistModel.fromJson(x)),
    );
  }

  static Future<HadistModel> getRandomYasin() async {
    final list = await yasin();
    return list[Random().nextInt(list.length)];
  }
}

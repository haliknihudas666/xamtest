// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:xamtest/src/models/diary_model.dart';

class SubmitAPI {
  static Future<DiaryModel> submit(DiaryModel data) async {
    final response = await http
        .post(
          Uri.parse('https://reqres.in/api/users'),
          body: data.toJson(),
        )
        .timeout(const Duration(seconds: 60));

    log(response.statusCode.toString());
    log(response.body);

    if (response.statusCode == 201) {
      return DiaryModel.message('Success!');
    } else {
      return DiaryModel.error('Something went wrong');
    }
  }
}

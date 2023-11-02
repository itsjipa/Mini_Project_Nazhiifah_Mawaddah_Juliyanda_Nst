import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/const/openai_constant.dart';
import 'package:gumsmile_dental_care/model/openai_model.dart';

class OpenAIService {
  final Dio _dio = Dio();

  Future<OpenAIModel> getRecomendations({
    required String prompt,
  }) async {
    try {
      final Uri url = Uri.parse('https://api.openai.com/v1/completions');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${OpenAIConstant.apiKey}',
      };

      final Map<String, dynamic> requestBody = {
        "model": "text-davinci-003",
        "prompt": prompt,
        "max_tokens": 180,
        "temperature": 0.4,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      };

      final Response response = await _dio.postUri(
        url,
        data: requestBody,
        options: Options(
          headers: headers,
        ),
      );
      debugPrint(response.statusMessage);
      return OpenAIModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

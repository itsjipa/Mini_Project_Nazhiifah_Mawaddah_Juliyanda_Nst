// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/openai_model.dart';
import 'package:gumsmile_dental_care/service/openai_service.dart';

class OpenAIProvider extends ChangeNotifier {
  final OpenAIService openAIService = OpenAIService();

  final formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  OpenAIModel? openAIModel;

  Future<void> getRecomendations({
    required String text,
  }) async {
    try {
      debugPrint(text);

      final String prompt =
          "Based on the text of $text";
      openAIModel = await openAIService.getRecomendations(
        prompt: prompt,
      );
      notifyListeners();
    } on DioException catch (e) {
      debugPrint('Error $e');

    }
  }
}

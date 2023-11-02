import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/openai_provider.dart';
import 'package:provider/provider.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provAI = Provider.of<OpenAIProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI CHAT',
          style: Constant().textAppBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: provAI.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: provAI.textController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(
                          20,
                          10,
                          10,
                          40,
                        ),
                        label: const Text(
                          'Ask your problem...',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        fillColor: Constant().colorPage,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () => provAI.textController.clear(),
                          icon: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 30.0,
                      ),
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (provAI.formKey.currentState!.validate()) {
                            context.read<OpenAIProvider>().getRecomendations(
                                text: provAI.textController.text);
                          }
                        },
                        child: Text(
                          'Get Answer',
                          style: Constant().textButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<OpenAIProvider>(
                builder: (context, provAI, _) {
                  if (provAI.openAIModel != null) {
                    return
                        Text(
                      '${provAI.openAIModel?.choices[0].text}',
                      textAlign: TextAlign.justify,
                      // ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

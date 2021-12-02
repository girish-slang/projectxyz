import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:mentalmath/backend/controllers/quizController.dart';

class ProblemPage extends HookWidget {
  final String track;
  ProblemPage({Key? key, required this.track}) : super(key: key);

  QuizController _quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    AlanVoice.addButton(
        "36cf10a045ad4f147daed15d057fa38b2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    final _question =
        useState(_quizController.handlerFunction(track)['question']);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(_question.value),
            ElevatedButton(
                onPressed: () {
                  _question.value =
                      _quizController.handlerFunction(track)['question'];
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}

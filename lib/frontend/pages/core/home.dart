import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalmath/backend/constants/testTrackData.dart';
import 'package:mentalmath/frontend/pages/core/quiz.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState() {
    AlanVoice.addButton(
        "36cf10a045ad4f147daed15d057fa38b2e956eca572e1d8b807a3e2338fdd0dc/prod");

    AlanVoice.onCommand.add((command) {
      _handleCommand(command.data);
    });
  }

  _handleCommand(Map<String, dynamic> command) {
    print("Command =  $command");
    _handleNavigation(command["route"]);
  }

  _handleNavigation(String route) {
    if (route == 'back') {
      Navigator.pop(context);
    } else {
      Get.to(ProblemPage(track: route));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mental Math - Demo",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: testTracks.map((testTrack) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 100,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  key: Key(testTrack['id'].toString()),
                  onPressed: () {
                    Get.to(ProblemPage(track: testTrack['track'].toString()));
                  },
                  child: Text(
                    testTrack['title'].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}

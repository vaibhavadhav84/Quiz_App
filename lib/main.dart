import "dart:developer";

import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "Which keyword is used to inherit a class in Java?",
      "options": ["this", "super", "extends", "implements"],
      "correctAnswer": 2,
    },
    {
      "question": "What is the size of an int data type in Java?",
      "options": ["4 bytes", "2 bytes", "8 bytes ", "Depends on the system"],
      "correctAnswer": 0,
    },
    {
      "question": "Which of the following is not a Java feature?",
      "options": ["Object-Oriented", "Platform Dependent", "Secure", "Robust"],
      "correctAnswer": 1,
    },
    {
      "question": "What will System.out.println(10 + 20 + \"Java\") output?",
      "options": ["Java1020", "30Java", "Java30", "1020Java"],
      "correctAnswer": 1,
    },
    {
      "question":
          "Which exception is thrown when a thread is waiting, sleeping, or otherwise occupied, and the thread is interrupted?",
      "options": [
        "InterruptedException",
        "IOException",
        "TimeoutException",
        " ThreadException",
      ],
      "correctAnswer": 0,
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage = true;
  int count = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
        if (selectedAnswerIndex ==
            allQuestions[currentQuestionIndex]['correctAnswer']) {
          log(
            "--------------------------Correct Answer Score = $count----------------------",
          );
          count++;
        }
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        log("--------------------------Red Color----------------------");
        return WidgetStatePropertyAll(Colors.red);
      } else {
        log("--------------------------White Color----------------------");
        return WidgetStatePropertyAll(Colors.white);
      }
    } else {
      log("--------------------------White2 Color----------------------");
      return WidgetStatePropertyAll(Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    log("--------------------------In Build ----------------------");
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 14, 14),
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Column(
          children: [
            Image.asset("assets/java.png", height: 150, width: 150),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 15),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length} ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 140,
              width: 380,
              child: Text(
                allQuestions[currentQuestionIndex]['question'],
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  log(
                    "--------------------------Press Button 1----------------------",
                  );
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    log("selectedAnswerIndex = $selectedAnswerIndex");
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][0],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  log(
                    "--------------------------Press Button 2----------------------",
                  );
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    log("selectedAnswerIndex = $selectedAnswerIndex");
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][1],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  log(
                    "--------------------------Press Button 3----------------------",
                  );
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    log("selectedAnswerIndex = $selectedAnswerIndex");
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][2],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  log(
                    "--------------------------Press Button 4----------------------",
                  );
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    log("selectedAnswerIndex = $selectedAnswerIndex");
                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][3],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              log(
                "--------------------------In Floating Button----------------------",
              );
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
                log("currentQuestionIndex = $currentQuestionIndex");
                log("selectedAnswerIndex = $selectedAnswerIndex");

                selectedAnswerIndex = -1;
              } else {
                isQuestionPage = false;
              }
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Please select an answer before proceeding."),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          backgroundColor: Colors.blue,
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 249, 249, 249),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Result Screen", style: TextStyle(fontSize: 30)),
        ),
        body: Column(
          children: [
            Image.network(
              "https://tse3.mm.bing.net/th/id/OIP.lfHu-jh9r3dJvWLvKw1dbAHaG3?pid=Api&P=0&h=180",
              width: 400,
              height: 400,
            ),
            Text(
              "Congratulations",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Text(
              "$count/${allQuestions.length}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = -1;
                  isQuestionPage = true;
                  count = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                "Reset Quiz",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Image.asset("assets/java.png", height: 150, width: 150),
          ],
        ),
      );
    }
  }
}

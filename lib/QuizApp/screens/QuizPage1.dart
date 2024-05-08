import 'package:flutter/material.dart';
import 'package:assignments/QuizApp/model/Quiz%20Q&A.dart';
import '../../ConstantUtils/mytexttheme.dart';
import 'QuizMainPage.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  PageController pageController = PageController();

  //to store the answer from user
  late List<String?> userAnswer;
  late List<bool> isOptionSelected;

  @override
  void initState() {
    userAnswer = List.filled(queAns.length, null);
    isOptionSelected = List.filled(queAns.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: PageView.builder(
        controller: pageController,
        itemCount: queAns.length,
        itemBuilder: (context, index) {
          return buildQuizPage(index);
        },
      ),
    );
  }

  Widget buildQuizPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            queAns[index]['question'],
            style: MyTextThemes.textHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(
              queAns[index]['options'].length,
                  (optionIndex) {
                //single option from options list
                String option = queAns[index]['options'][optionIndex];
                bool isCorrectOption = userAnswer[index] == option &&
                    userAnswer[index] == queAns[index]['correctAnswer'];
                return InkWell(
                  onTap: isOptionSelected[index]
                      ? null
                      : () {
                    setState(() {
                      //selected option stored to userAnswer list
                      userAnswer[index] = option;
                      isOptionSelected[index] = true;
                    });
                  },
                  child: Card(
                    // Wrap each option in a Card widget
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    color: userAnswer[index] == option
                        ? isCorrectOption
                        ? Colors.green
                        : Colors.red
                        : Colors.white,
                    // Set color based on correctness
                    child: RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: userAnswer[index],
                      onChanged: isOptionSelected[index]
                          ? null
                          : (value) {
                        setState(() {
                          userAnswer[index] = value;
                          isOptionSelected[index] = true;
                        });
                      },
                      activeColor: userAnswer[index] == option
                          ? Colors.transparent
                          : null,
                      // Set active color to transparent
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (index < queAns.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                showResult();
              }
            },
            child: Text(index < queAns.length - 1 ? "Next" : "Submit"),
          ),
        ],
      ),
    );
  }

  void showResult() {
    int correctAns = 0;
    for (int i = 0; i < queAns.length; i++) {
      if (userAnswer[i] == queAns[i]['correctAnswer']) {
        correctAns++;
      }
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5DhXlozUl6aAIqotXpkARJSruRqlRs46SYg&s',
              ),
              const Text("Quiz Completed Successfully!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.green
              ),),
              const SizedBox(height: 10),
              const Text(
                'QUIZ Result',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "You got ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextSpan(
                      text: "$correctAns",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    const TextSpan(
                      text: " correct answers out of ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextSpan(
                      text: "${queAns.length}",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const TextSpan(
                      text: " questions",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizMain(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
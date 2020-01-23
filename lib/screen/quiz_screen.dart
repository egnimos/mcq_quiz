import 'dart:async';

import 'package:flutter/material.dart';
import '../widget/quiz_item.dart';
import 'package:provider/provider.dart';

import '../model/question_answer.dart';


class QuizScreen extends StatefulWidget {

  static const routeName = '/quiz-screen';

  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var i = 0;
   Map<String, Color> btnColor = {
   'a': Colors.indigoAccent,
   'b': Colors.indigoAccent,
   'c': Colors.indigoAccent,
   'd': Colors.indigoAccent,
 };
 bool cancelTimer = false;
 var timer = 30;
 String showTimer = "30";

 @override
 void initState() { 
   startTimer();
   super.initState();
 }


 void startTimer() async {
   const onesec = Duration(seconds: 1);
   Timer.periodic(onesec, (Timer t) {
     setState(() {
       if (timer < 1) {
         t.cancel();
         nextQuestion();
       }else if(cancelTimer == true) {
         t.cancel();
       }else {
         timer = timer - 1;
       }
       showTimer = timer.toString();
     });
   });
 }

  void nextQuestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {

    if (i < 4) {
      i++;
    }else {
      // i= 0;
    }

    btnColor["a"] = Colors.indigoAccent;
    btnColor["b"] = Colors.indigoAccent;
    btnColor["c"] = Colors.indigoAccent;
    btnColor["d"] = Colors.indigoAccent;
    });
    startTimer();

  }

  @override
  Widget build(BuildContext context) {

    final quizCatId = ModalRoute.of(context).settings.arguments;

    final questionData = Provider.of<Question>(context).question.where((ques) => ques.qcId == quizCatId).toList();



    return Scaffold(

    
    
    body: Container(
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height - 10,
       child: ListView(
         children: [

           QuizItem(
             id: questionData[i].id,
             question: questionData[i].question,
             options: questionData[i].options,
             answer: questionData[i].answer,
             nextQuestion: nextQuestion,
             cancelTimer: cancelTimer,
             showTimer: showTimer,
             btnColor: btnColor,
         )

         ] 
       )
    )
    );
  }
}



///widget of the quiz item 
///





class QuizItem extends StatefulWidget {

  final String id;
  final String question;
  final Map<String, String> options;
  final String answer;
  final Function nextQuestion;
  bool cancelTimer;
  String showTimer;
  Map<String, Color> btnColor;



   QuizItem({
     @required this.id,
     @required this.question,
     @required this.options,
     @required this.answer,
     @required this.nextQuestion,
     @required this.cancelTimer,
     @required this.showTimer,
     @required this.btnColor,
     Key key}) : super(key: key);


  @override
  _QuizItemState createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {

 var marks = 0;
 Color colorToShow = Colors.indigoAccent;
 Color right = Colors.green;
 Color wrong = Colors.red;

//  Map<String, Color> btnColor = {
//    'a': Colors.indigoAccent,
//    'b': Colors.indigoAccent,
//    'c': Colors.indigoAccent,
//    'd': Colors.indigoAccent,
//  };


  void checkAnswer(String k) {

    if (widget.options[k] == widget.answer) {
      marks = marks + 5;
      colorToShow = right;
      print(marks);
    }else {
      colorToShow = wrong;
    }

    setState(() {
      
     widget.btnColor[k] = colorToShow;
     widget.cancelTimer = true;

    });

    Timer(Duration(seconds: 1), widget.nextQuestion);

  }

  


  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-30,
          child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.question,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    choiceOptions('a'),
                    choiceOptions('b'),
                    choiceOptions('c'),
                    choiceOptions('d'),

                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
               alignment: Alignment.topCenter,
               child: Center(
                 child: Text(
                   widget.showTimer,
                   style: TextStyle(
                     fontSize: 35.0,
                     fontWeight: FontWeight.w700,  // colorToShow = colorToShow;
                   ),
                 ),
               ),
              ),
            ),

          ],
        ),
    );
  }

  Padding choiceOptions(String k) {
    return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print(widget.options[k]);
                      checkAnswer(k);
                    } ,
                    child: Text(
                      widget.options[k],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                    ),
                    color: widget.btnColor[k],
                    splashColor: Colors.indigo[700],
                    highlightColor: Colors.indigo[700],
                    minWidth: 200.0,
                    height: 45.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                );
  }
}
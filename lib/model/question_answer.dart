import 'package:flutter/material.dart';
import 'package:mcq_app/dummy_content/dummy_question_answer.dart';


class QuestionAnswer {

  final String id;
  final String qcId;
  final String question;
  final Map<String , String> options;
  final String answer;
  

  //construct
 const QuestionAnswer({
    @required this.id,
    @required this.qcId,
    @required this.question,
    @required this.options,
    @required this.answer,
  });
  
}


class Question with ChangeNotifier {
  
  List<QuestionAnswer> _question = DUMMY_QUESTION_ANSWER;


  List<QuestionAnswer> get question {
    return [..._question];
  } 
}
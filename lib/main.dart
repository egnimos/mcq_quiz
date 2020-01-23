import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './splash_screen.dart';
import './model/question_answer.dart';
import './model/quiz_category_model.dart';
import './screen/quiz_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      
      providers: [

      ChangeNotifierProvider.value(
      value: Question(),
      ),

      ChangeNotifierProvider.value(
        value: QuizCategory(),
      ),
    ],
    
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          QuizScreen.routeName: (ctx) => QuizScreen(),
        },
      ),
  
    ); 
    
    
  }
}


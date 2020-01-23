import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/dummy_content/dummy_category.dart';
import 'package:provider/provider.dart';


class QuizCategoryModel {

  final String id;
  final String categoryName;
  final String intro;
  final String imageUrl;
  

  //construct
  const QuizCategoryModel({
    @required this.id,
    @required this.categoryName,
    @required this.intro,
    @required this.imageUrl,
  });

}


class QuizCategory with ChangeNotifier {

  List<QuizCategoryModel> _category = DUMMY_CATEGORY;


  List<QuizCategoryModel> get category {
    return [..._category];
  }
  
}
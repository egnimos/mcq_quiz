import 'package:flutter/material.dart';


import '../dummy_content/dummy_category.dart';
import '../widget/category_widget.dart';


class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);


  // Widget categoryWidget(BuildContext context, String imageUrl, String languageName, String intro) {

  //   return ;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.all(10),
          child: ListView(
            children: 
            DUMMY_CATEGORY.map((cat) {
              
              return CategoryWidget(
                id: cat.id,
                languageName: cat.categoryName,
                intro: cat.intro,
                imageUrl: cat.imageUrl,
              );

            }).toList(),
           
          ),
        ),
    );
  }
}
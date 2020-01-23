import 'package:flutter/material.dart';


import '../screen/quiz_screen.dart';


class CategoryWidget extends StatelessWidget {

  final String id;
  final String languageName;
  final String intro;
  final String imageUrl;


  //construct....
  CategoryWidget({
    @required this.id,
    @required this.languageName,
    @required this.intro,
    @required this.imageUrl,
    Key key
    }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          QuizScreen.routeName,
          arguments: id,
        );
      },

      splashColor: Colors.purple,
          child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              spreadRadius: 2.0,
              offset: Offset(2.0,2.0),
              blurRadius: 8.0,
            )
          ],
          border: Border.all(
            color: Colors.white,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        // width: 200,
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

         
              ClipOval(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
       

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                languageName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                intro,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
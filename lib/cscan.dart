import 'package:flutter/material.dart';

class cscan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('CSCAN Page',style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.lightBlue,
          actions:<Widget>[
            IconButton(onPressed:(){
              Navigator.pop(context);
            }
                , icon: Icon(Icons.arrow_back))
          ]
      ),

    );
  }
}
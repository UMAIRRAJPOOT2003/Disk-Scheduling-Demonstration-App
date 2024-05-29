import 'package:flutter/material.dart';
import 'dart:math';
import 'homepage.dart';

class firstpage extends StatefulWidget
{
  _firstpageState createState()=>_firstpageState();
}
class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DISK SCHEDULAR", style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,),

      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/images/firstimage.jpg',),
              fit:BoxFit.cover,
            ),
          ),

          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0), // Spacer with black color
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    firstcontainer(),
                    SizedBox(height: 30.0),

                    // Add more widgets here as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstcontainer()
  {
    return InkWell(

      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => diskschedularapp()),
        );
      },
      child: Container(
          width:100,
          height:400,

          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border:Border.all(
              color:Colors.blue,
              width:1,
            ),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue[100]!, // Lightest shade
                Colors.blue[200]!,
                Colors.blue[300]!,
                Colors.blue[400]!,
                Colors.blue[500]!, // Base color
                Colors.blue[600]!,
                Colors.blue[700]!,
                Colors.blue[800]!,
                Colors.blue[900]!, // Darkest shade
              ],
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("WELCOME TO DISK SCHEDULAR",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
              Center(child:Text("Click To Continue",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
            ],
          )

      ),
    );

  }
}
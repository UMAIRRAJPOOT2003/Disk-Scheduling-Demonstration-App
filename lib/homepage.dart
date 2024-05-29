import 'package:flutter/material.dart';
import 'dart:math';
import 'fcfs.dart';
import 'sstf.dart';
import 'ssd.dart';





class diskschedularapp extends StatefulWidget
{
  _diskschedularappState createState()=>_diskschedularappState();
}
class _diskschedularappState extends State<diskschedularapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("DISK SCHEDULAR",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.lightBlue,),

      body: SafeArea(

        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(height:30.0), // Spacer with black color
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    firstcontainer(),
                    SizedBox(height:30.0),
                    secondcontainer(),
                    SizedBox(height:30.0),
                    thirdcontainer(),
                    SizedBox(height:30.0),
                    fourthcontainer(),
                    SizedBox(height:30.0),
                    fifthcontainer(),
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
          MaterialPageRoute(builder: (context) => fcfs()),
        );
      },
      child:Container(
          width:100,
          height:100,

          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border:Border.all(
              color:Colors.purple,
              width:1,
            ),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[100]!, // Lightest shade
                Colors.purple[200]!,
                Colors.purple[300]!,
                Colors.purple[400]!,
                Colors.purple[500]!, // Base color
                Colors.purple[600]!,
                Colors.purple[700]!,
                Colors.purple[800]!,
                Colors.purple[900]!, // Darkest shade
              ],
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child:Text("FCFS",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),),
              Center(child:Text("First Come First Serve",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
            ],
          )

      ),
    );

  }

  Widget secondcontainer()
  {
    return InkWell(

      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sstf()),
        );
      },
        child: Container(
            width:100,
            height:100,

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
                Center(child:Text("SSTF",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),),
                Center(child:Text("Shortest Seek Time First",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
              ],
            )

        ),
    );

  }


  Widget thirdcontainer()
  {
    return InkWell(

        onTap:(){
         debugPrint('in process');
        },
    child: Container(
        width:100,
        height:100,

        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border:Border.all(
            color:Colors.deepOrange,
            width:1,
          ),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepOrange[100]!, // Lightest shade
              Colors.deepOrange[200]!,
              Colors.deepOrange[300]!,
              Colors.deepOrange[400]!,
              Colors.deepOrange[500]!, // Base color
              Colors.deepOrange[600]!,
              Colors.deepOrange[700]!,
              Colors.deepOrange[800]!,
              Colors.deepOrange[900]!, // Darkest shade
            ],
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child:Text("SSCAN",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),),
            Center(child:Text("Elevator Algorithm",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
          ],
        )
    ),
    );
  }

  Widget fourthcontainer()
  {
    return InkWell(

        onTap:(){
     debugPrint('in prcess');
    },
    child:Container(
        width:100,
        height:100,

        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border:Border.all(
            color:Colors.pink,
            width:1,
          ),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[100]!, // Lightest shade
              Colors.pink[200]!,
              Colors.pink[300]!,
              Colors.pink[400]!,
              Colors.pink[500]!, // Base color
              Colors.pink[600]!,
              Colors.pink[700]!,
              Colors.pink[800]!,
              Colors.pink[900]!, // Darkest shade
            ],
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child:Text("CSCAN",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),),
            Center(child:Text("Circular Elevator Algorithm",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
          ],
        )
    ),
    );
  }


  Widget fifthcontainer()
  {
    return InkWell(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ssd()),
        );
      },
      child:Container(
          width:100,
          height:100,

          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border:Border.all(
              color:Colors.purple,
              width:1,
            ),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[100]!, // Lightest shade
                Colors.purple[200]!,
                Colors.purple[300]!,
                Colors.purple[400]!,
                Colors.purple[500]!, // Base color
                Colors.purple[600]!,
                Colors.purple[700]!,
                Colors.purple[800]!,
                Colors.purple[900]!, // Darkest shade
              ],
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child:Text("ssd",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),),
              Center(child:Text("Solid State Drive",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
            ],
          )

      ),
    );

  }

}
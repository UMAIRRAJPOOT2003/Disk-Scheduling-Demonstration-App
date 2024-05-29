import 'package:flutter/material.dart';
import 'fcfs.dart';
class fcfstheory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FCFS INFO",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue,),
      body: Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'The First-Come, First-Served (FCFS) algorithm stands as one of the fundamental principles in disk scheduling within operating systems. It operates on a simple premise: prioritize disk requests strictly based on their arrival order. When a process submits a request to access a disk block, it joins a queue, awaiting its turn. FCFS, akin to a sequential line, serves these requests in the order they were received, with the disk arm traversing the queue sequentially. Upon servicing a request, the disk arm moves to the next location in the queue, repeating this process until all requests are fulfilled. This straightforward approach ensures fairness in access, as every request receives attention without bias. However, FCFS may exhibit inefficiency when faced with significant disparities in the distances between requested disk tracks. Such variations can lead to prolonged average seek times, as the disk arm follows a rigid sequential path, potentially traversing vast distances unnecessarily. Despite its simplicity and fairness, FCFS may not always be the optimal choice for disk scheduling, particularly in scenarios where minimizing seek time is paramount.',
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,),

                ),
              ],
            ),
          ],
        ),
      ),


    );
  }
}
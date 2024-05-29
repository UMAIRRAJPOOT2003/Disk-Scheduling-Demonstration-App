import 'package:flutter/material.dart';
import 'fcfs.dart';

class sstftheory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SSTF INFO",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Shortest Seek Time First (SSTF) scheduling algorithm is a fundamental method used in disk scheduling to optimize the movement of the disk arm, thereby reducing seek time and improving overall system performance. In SSTF, the disk arm moves to the next track that is closest to its current position, based on the shortest seek time required. This algorithm aims to minimize the seek time by selecting the closest request among the pending requests in the queue.\n\nSSTF operates on the principle of minimizing seek time, which is the time taken for the disk arm to move to the desired track. By choosing the request closest to the current position of the disk arm, SSTF minimizes the distance the arm needs to travel, hence reducing seek time. This results in faster access to data and better disk performance.\n\nOne of the key advantages of the SSTF algorithm is its ability to adapt dynamically to the changing workload. Unlike other scheduling algorithms like FCFS (First-Come, First-Served) or SCAN, which may result in long seek times for distant requests, SSTF prioritizes requests based on proximity, leading to more efficient disk operations.\n\nHowever, SSTF scheduling is not without its limitations. One major drawback is the possibility of starvation for certain requests. If there is a continuous stream of requests near the current position of the disk arm, requests located farther away may never get serviced, leading to potential delays or even data starvation.\n\nTo mitigate this issue, some systems implement variants of the SSTF algorithm that introduce additional mechanisms to ensure fairness and prevent starvation. For example, the SCAN-LOOK algorithm combines aspects of both SSTF and SCAN, allowing the disk arm to move in both directions to service pending requests.\n\nIn summary, SSTF scheduling is a widely used disk scheduling algorithm that prioritizes requests based on proximity to the current position of the disk arm, aiming to minimize seek time and improve disk performance. While it offers significant advantages in terms of reducing seek time and improving efficiency, it may also face challenges such as request starvation, which need to be addressed through appropriate modifications and enhancements.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

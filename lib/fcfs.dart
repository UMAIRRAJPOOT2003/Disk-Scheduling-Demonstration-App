import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'fcfstheory.dart';


class DiskScheduler {
  List<int> sequence = []; // Sequence of disk accesses
  int currentPosition = 0;
  int totalHeadMovements = 0; // Total head movements

  // Function to add a new disk request
  void addRequest(int request) {
    sequence.add(request);
  }

  // Function to execute FCFS algorithm and calculate total head movements
  void executeFCFS(int currentTrack) {
    for (int request in sequence) {
      int headMovements = (request - currentTrack).abs();
      totalHeadMovements += headMovements; // Update total head movements
      print("Servicing request $request");
      print("Head movements: $headMovements");
      currentTrack = request;
      print("Current position: $currentTrack");
    }
    print("Total Head Movements: $totalHeadMovements"); // Print total head movements
    print("FCFS Scheduling Complete");
  }
}

class fcfs extends StatefulWidget {
  @override
  _fcfsState createState() => _fcfsState();
}

class _fcfsState extends State<fcfs> {
  final DiskScheduler diskScheduler = DiskScheduler();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _currentTrackController = TextEditingController();
  List<int> sequence = [];
  int currentTrack = 0;
  int totalMovements = 0;

  String prefixtext = "Enter Values Of Sequence";
  String prefixtext2 = "Do You Know From Where Head Starts?";

  int calculateTotalTrackMovements(List<int> sequence) {
    if (sequence.isEmpty || sequence.length == 1) {
      return 0;
    }

    int totalMovements = 0;

    for (int i = 1; i < sequence.length; i++) {
      int movement = sequence[i] - sequence[i - 1];
      totalMovements += movement.abs();
    }

    return totalMovements;
  }

  void _updateTotalTrackMovements() {
    setState(() {
      totalMovements = calculateTotalTrackMovements(sequence);
    });
  }

  double calculateTotalSeekTime(List<int> sequence) {
    if (sequence.isEmpty || sequence.length == 1) {
      return 0;
    }

    double seekTime = 0;

    for (int i = 1; i < sequence.length; i++) {
      seekTime += (sequence[i] - sequence[i - 1]).abs() * 0.1; // Assuming seek time of 0.1 milliseconds per track
    }

    return seekTime;
  }

  double calculateLatency() {
    // Assuming disk speed is 7200 RPM and there are 100 sectors per track
    double diskSpeed = 7200; // in RPM
    double sectorsPerTrack = 100;
    double latency = (60 / diskSpeed / 2) * sectorsPerTrack; // in milliseconds
    return latency;
  }

  double calculateTransferTime(List<int> sequence) {
    // Assuming transfer rate is 100 MB/s
    double transferRate = 100; // in MB/s
    double transferTimePerSector = 1 / transferRate; // in seconds
    double totalTransferTime = sequence.length * transferTimePerSector * 1000; // in milliseconds
    return totalTransferTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FCFS Algorithm',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => fcfstheory()),
              );

            },
            icon: Icon(Icons.info),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                myTextField(),
                SizedBox(height: 6.0),
                myButton(),
                SizedBox(height: 6.0),
                mySecondTextField(),
                SizedBox(height: 6.0),
                mySecondButton(),
                SizedBox(height: 6.0),
                forText(),
                forText2(),
                SizedBox(height: 10.0),
                forGraph(),
                SizedBox(height: 10.0),
                totalSeekTimeWidget(),
                SizedBox(height: 10.0),
                latencyWidget(),
                SizedBox(height: 10.0),
                transferTimeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myTextField() {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixText: prefixtext,
        prefixStyle: TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      onChanged: (value) {
        if (value.isNotEmpty && prefixtext.isNotEmpty) {
          setState(() {
            prefixtext = ""; // Set prefix text to empty string
          });
        }
      },
    );
  }

  Widget myButton() {
    return InkWell(
      onTap: () {
        setState(() {
          String input = _controller.text.trim();
          if (input.isNotEmpty) {
            int? request = int.tryParse(input);
            if (request != null) {
              diskScheduler.addRequest(request);
              sequence = diskScheduler.sequence;
              _controller.clear(); // Clear text field after adding request
              _updateTotalTrackMovements(); // Update total track movements
            } else {
              // Handle invalid input
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Invalid Input"),
                    content: Text("Please enter a valid integer."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Add Request',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget mySecondTextField() {
    return TextField(
      controller: _currentTrackController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          if (value.isNotEmpty && prefixtext2.isNotEmpty) {
            prefixtext2 = ""; // Set prefix text to empty string
          }
          if (value.isNotEmpty) {
            currentTrack =
            sequence[0]; // Update current track based on the sequence
          }
        });
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixText: prefixtext2,
        prefixStyle: TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
      ),
    );
  }

  Widget mySecondButton() {
    return InkWell(
      onTap: () {
        setState(() {
          diskScheduler.executeFCFS(currentTrack);
          _updateTotalTrackMovements(); // Update total track movements
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'HEAD Starts From ${currentTrack}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget forText() {
    return Text(
      'Current Sequence: ${sequence.join(', ')}',
      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget forText2() {
    return Text(
      'Total Head Movements: ${totalMovements}',
      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget forGraph() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: sequence.length.toDouble() - 1,
                minY: 0,
                maxY: sequence.isNotEmpty ? sequence.reduce((a, b) => a > b ? a : b).toDouble() : 5,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(color: Color(0xff939393), fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 20,
                    getTitles: (double value) {
                      if (value.toInt() < sequence.length) {
                        return sequence[value.toInt()].toString();
                      }
                      return '';
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(color: Color(0xff939393), fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 20,
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: sequence.asMap().entries.map((entry) {
                      return FlSpot(entry.key.toDouble(), entry.value.toDouble());
                    }).toList(),
                    isCurved: false,
                    colors: [Colors.blue],
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    isStrokeCapRound: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0), // Add spacing
      ],
    );
  }

  Widget totalSeekTimeWidget() {
    double totalSeekTime = calculateTotalSeekTime(sequence);
    return Text(
      'Total Seek Time: ${totalSeekTime.toStringAsFixed(2)} ms',
      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget latencyWidget() {
    double latency = calculateLatency();
    return Text(
      'Latency: ${latency.toStringAsFixed(2)} ms',
      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget transferTimeWidget() {
    double transferTime = calculateTransferTime(sequence);
    return Text(
      'Transfer Time: ${transferTime.toStringAsFixed(2)} ms',
      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}



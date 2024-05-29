import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'sstftheory.dart';
class DiskScheduler {
  List<int> plattersSequence = []; // Sequence of platters (numbers)
  List<int> seekTimes = []; // Seek times for each platter

  // Function to calculate seek time for each platter in the sequence
  void calculateSeekTimes() {
    for (int i = 0; i < plattersSequence.length; i++) {
      int currentPlatter = plattersSequence[i];
      int totalSeekTime = 0;
      for (int j = i + 1; j < plattersSequence.length; j++) {
        totalSeekTime += (plattersSequence[j] - currentPlatter).abs();
      }
      seekTimes.add(totalSeekTime);
    }
  }

  // Function to arrange the sequence based on shortest seek time
  void arrangeSequence() {
    List<int> sortedIndices = List.generate(plattersSequence.length, (index) => index);
    sortedIndices.sort((a, b) => seekTimes[a].compareTo(seekTimes[b]));

    plattersSequence = sortedIndices.map((index) => plattersSequence[index]).toList();
    seekTimes.sort();
  }

  // Function to calculate total track movements (in ms)
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

  // Function to calculate transfer time (in ms)
  int calculateTransferTime() {
    // Assuming transfer rate is 100 MB/s
    double transferRate = 100; // in MB/s
    double transferTimePerSector = 1 / transferRate; // in seconds
    double totalTransferTime = plattersSequence.length * transferTimePerSector * 1000; // in milliseconds
    return totalTransferTime.toInt();
  }

  // Function to calculate latency (in ms)
  // Function to calculate latency (in ms)
  int calculateLatency() {
    // Assuming disk speed is 7200 RPM and there are 100 sectors per track
    double diskSpeed = 7200; // in RPM
    double sectorsPerTrack = 100;
    double latency = (60 / (diskSpeed / 60)) * 1000 / sectorsPerTrack; // in milliseconds
    return latency.toInt();
  }


}

class sstf extends StatefulWidget {
  @override
  _sstfState createState() => _sstfState();
}

class _sstfState extends State<sstf> {
  final DiskScheduler diskScheduler = DiskScheduler();
  final TextEditingController _plattersController = TextEditingController();
  List<int> plattersSequence = []; // Sequence of platters (numbers)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SSTF Algorithm',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sstftheory()),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _plattersController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter sequence of platters (numbers)',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      plattersSequence = value.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      diskScheduler.plattersSequence = List.from(plattersSequence);
                      diskScheduler.seekTimes.clear();
                      diskScheduler.calculateSeekTimes();
                      diskScheduler.arrangeSequence();
                    });
                  },
                  child: Text('Calculate and Arrange Sequence', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
                SizedBox(height: 20.0),
                if (diskScheduler.seekTimes.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seek Time for each Platter:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      for (int i = 0; i < diskScheduler.plattersSequence.length; i++)
                        Text('Platter ${diskScheduler.plattersSequence[i]}: ${diskScheduler.seekTimes[i]} ms', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                SizedBox(height: 20.0),
                if (diskScheduler.plattersSequence.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sorted Sequence:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text('${diskScheduler.plattersSequence}', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                SizedBox(height: 20.0),
                if (diskScheduler.plattersSequence.isNotEmpty)
                  Container(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: diskScheduler.plattersSequence.length.toDouble() - 1,
                        minY: 0,
                        maxY: diskScheduler.plattersSequence.isNotEmpty
                            ? diskScheduler.plattersSequence.reduce((a, b) => a > b ? a : b).toDouble()
                            : 5,
                        titlesData: FlTitlesData(
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              if (value.toInt() < diskScheduler.plattersSequence.length) {
                                return diskScheduler.plattersSequence[value.toInt()].toString();
                              }
                              return '';
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            margin: 20,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: diskScheduler.plattersSequence.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value.toDouble());
                            }).toList(),
                            isCurved: false,
                            colors: [Colors.blue],
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                            isStrokeCapRound: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20.0),
                if (diskScheduler.plattersSequence.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Head Movements: ${diskScheduler.calculateTotalTrackMovements(diskScheduler.plattersSequence)} ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Transfer Time: ${diskScheduler.calculateTransferTime()} ms',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Latency: ${diskScheduler.calculateLatency()} ms',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



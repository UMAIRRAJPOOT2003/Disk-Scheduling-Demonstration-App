import 'package:flutter/material.dart';
import 'dart:math';



class ssd extends StatefulWidget {
  @override
  _ssdState createState() => _ssdState();
}

class _ssdState extends State<ssd> {
  final List<int?> _ssdData = List<int?>.filled(100, null); // Simulated SSD storage
  final Random _random = Random();
  String _log = '';
  int? _writeAddress;
  int? _writeData;
  int? _readAddress;

  void _writeDataToSSD() {
    if (_writeAddress != null && _writeData != null) {
      setState(() {
        _ssdData[_writeAddress!] = _writeData;
        _log = '${DateTime.now()}: Wrote $_writeData to address $_writeAddress\n' + _log;
        _writeAddress = null;
        _writeData = null;
      });
    }
  }

  void _readDataFromSSD() {
    if (_readAddress != null) {
      setState(() {
        int? data = _ssdData[_readAddress!];
        _log = '${DateTime.now()}: Read $data from address $_readAddress\n' + _log;
        _readAddress = null;
      });
    }
  }

  void _clearLog() {
    setState(() {
      _log = '';
    });
  }

  Color _getBlockColor(int? data) {
    if (data == null) return Colors.grey[200]!;
    return Colors.blue[200]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SSD Simulation',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue, centerTitle: true,// Set app bar background color to blue
      ),
      body: Container(
        color: Colors.black, // Set background color of body to black
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: _ssdData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: _getBlockColor(_ssdData[index]),
                      child: Center(
                        child: Text(
                          _ssdData[index]?.toString() ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.white), // Set text color to white
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _log,
                    style: TextStyle(fontFamily: 'Courier', fontSize: 14, color: Colors.white), // Set text color to white
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _writeDataToSSD,
                    child: Text('Write Data'),
                  ),
                  ElevatedButton(
                    onPressed: _readDataFromSSD,
                    child: Text('Read Data'),
                  ),
                  ElevatedButton(
                    onPressed: _clearLog,
                    child: Text('Clear Log'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Write Address:', style: TextStyle(color: Colors.white)), // Set text color to white
                        SizedBox(
                          width: 50,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _writeAddress = int.tryParse(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white), // Set text color to white
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Write Data:', style: TextStyle(color: Colors.white)), // Set text color to white
                        SizedBox(
                          width: 50,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _writeData = int.tryParse(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white), // Set text color to white
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Read Address:', style: TextStyle(color: Colors.white)), // Set text color to white
                        SizedBox(
                          width: 50,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _readAddress = int.tryParse(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white), // Set text color to white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



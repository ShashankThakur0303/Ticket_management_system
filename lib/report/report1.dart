import 'package:complaint_management/report/report2.dart';
import 'package:flutter/material.dart';

class Report1 extends StatefulWidget {
  const Report1({super.key});

  @override
  State<Report1> createState() => _Report1State();
}

class _Report1State extends State<Report1> {
  final List<String> serviceProviders = [
    'Provider A',
    'Provider B',
    'Provider C',
    'Provider D',
  ];

  String? _selectedServiceProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Report1'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Report2()));
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 35,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ticket #: 12345', // Display your ticket number here
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Status - Open',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: 'Work'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Building'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Floor'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Room'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Asset'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButtonFormField(
                        value: _selectedServiceProvider,
                        items: serviceProviders.map((String provider) {
                          return DropdownMenuItem(
                            value: provider,
                            child: Text(provider),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedServiceProvider = value.toString();
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Service Provider',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Remark:-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Remarks',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getCurrentDate(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    return '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }
}

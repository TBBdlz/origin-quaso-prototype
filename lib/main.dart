import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/menu.dart';

//! under development
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  const Text(
                    'Mission',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const MissionSlider(),
                  const SizedBox(height: 16),
                  const HeaderCard(),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'Card 1',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Card(
                                      child: Container(
                                        width: 150,
                                        child: const Center(
                                          child: Text('Item 1'),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        width: 150,
                                        child: const Center(
                                          child: Text('Item 2'),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        width: 150,
                                        child: const Center(
                                          child: Text('Item 3'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // make button when click navigate to menu page
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddMenu(),
                              ),
                            );
                          },
                          child: const Text('Add Menu'),
                        ),
                        //! under dev !
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const AddMenu(),
                        //       ),
                        //     );
                        //   },
                        //   child: const Text('CV'),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headerWidth = screenWidth * 0.8;

    return Container(
      width: headerWidth,
      height: 200,
      // decorate with color and rounded corners
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Main Card',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Main Card subtitle',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class MissionSlider extends StatelessWidget {
  const MissionSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 80,
      child: Center(
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      FontAwesomeIcons.flag,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Day ${index + 1}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _selectedIndex = 0;

  // Bottom navigation bar handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          children: [
            const Text(
              'Vidhya',
              style: TextStyle(
                fontFamily: 'Cursive', // Optional custom font
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // Circle avatar for the robot/book icon
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.menu_book,
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),

      // Body with gradient background
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFE3F2FD), // Light blue near bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Greeting row with a speaker/play icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hello Aryan,',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Play/speaker icon button
                      InkWell(
                        onTap: () {
                          // TODO: Implement audio play logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Playing audio...')),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
            
                  // Card with the house image and text
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // House image (use your own asset or network image)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset("assets/images/home.png"),
                          ),
                          const SizedBox(height: 16),
            
                          // Divider or a thin line
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
            
                          // Row with the English/Hindi text and a speaker icon
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // "House" / "मकान"
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'House',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'मकान',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // Speaker icon
                              IconButton(
                                onPressed: () {
                                  // TODO: Implement TTS or audio logic
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Playing "House" audio...')),
                                  );
                                },
                                icon: const Icon(Icons.volume_up),
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 20),
            
                  // Prompt to speak + microphone icon
                  Row(
                    children: [
                      const Text(
                        'Speak the word ......',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // TODO: Implement speech recognition logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Listening...')),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.lightBlueAccent,
                          child: const Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

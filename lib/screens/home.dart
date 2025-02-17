import 'package:flutter/material.dart';
import 'package:vidhya/screens/lessonscreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom navigation bar index
  int _selectedIndex = 0;

  // Mock data for 5 levels
  // levelNumber: the level label (1, 2, 3, 4, 5)
  // progress: the user’s current progress (0.0 to 1.0)
  // requiredProgress: the fraction needed to pass (e.g., 0.90 => 90%)
  // isLocked: whether the level is locked
  final List<Map<String, dynamic>> _levels = [
    {
      'levelNumber': 1,
      'progress': 0.75,
      'requiredProgress': 0.90,
      'isLocked': false,
    },
    {
      'levelNumber': 2,
      'progress': 0.0,
      'requiredProgress': 0.90,
      'isLocked': true,
    },
    {
      'levelNumber': 3,
      'progress': 0.0,
      'requiredProgress': 0.90,
      'isLocked': true,
    },
    {
      'levelNumber': 4,
      'progress': 0.0,
      'requiredProgress': 0.90,
      'isLocked': true,
    },
    {
      'levelNumber': 5,
      'progress': 0.0,
      'requiredProgress': 0.90,
      'isLocked': true,
    },
  ];

  // Handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // You can navigate or change screens here if desired
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a light blue background and "Vidhya" title
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
            // Placeholder icon for the robot/book image
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: Icon(
            //     Icons.menu_book,
            //     color: Colors.lightBlueAccent,
            //   ),
            // ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFE3F2FD), // Light blue near the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                const Text(
                  'Hello Aryan,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                // Levels List
                Expanded(
                  child: ListView.builder(
                    itemCount: _levels.length,
                    itemBuilder: (context, index) {
                      final level = _levels[index];
                      final levelNumber = level['levelNumber'] as int;
                      final progress = level['progress'] as double;
                      final requiredProgress = level['requiredProgress'] as double;
                      final isLocked = level['isLocked'] as bool;

                      return _buildLevelCard(
                        levelNumber: levelNumber,
                        progress: progress,
                        requiredProgress: requiredProgress,
                        isLocked: isLocked,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar with 2 items: Home and Profile
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

  // Widget for each Level Card
  Widget _buildLevelCard({
    required int levelNumber,
    required double progress,
    required double requiredProgress,
    required bool isLocked,
  }) {
    // Display progress in % for the label
    final int currentPercent = (progress * 100).round();
    final int requiredPercent = (requiredProgress * 100).round();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row: "Level X" + either Continue button or Lock icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Level $levelNumber',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isLocked
                    ? const Icon(
                        Icons.lock,
                        size: 28,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LessonScreen(),
                            ),
                          );
                          // TODO: Handle level continue logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Continuing Level $levelNumber')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Continue'),
                      ),
              ],
            ),
            const SizedBox(height: 12),

            // Progress bar and labels
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            Text('$currentPercent% / 100%'),
            Text('$requiredPercent% to pass the level'),
          ],
        ),
      ),
    );
  }
}

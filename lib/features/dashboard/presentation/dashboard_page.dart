import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Dummy slider data.
  final List<Map<String, dynamic>> sliderItems = [
    {
      'text': 'Welcome to HRMS',
      'startColor': Colors.blueAccent,
      'endColor': Colors.lightBlue,
    },
    {
      'text': 'Streamline Your HR Processes',
      'startColor': Colors.deepPurple,
      'endColor': Colors.purpleAccent,
    },
    {
      'text': 'Empower Your Workforce',
      'startColor': Colors.teal,
      'endColor': Colors.green,
    },
  ];

  // Builds a carousel item with a gradient background.
  Widget buildCarouselItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [item['startColor'], item['endColor']],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: item['endColor'].withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            item['text'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Builds a dot indicator row based on the current slide index.
  Widget buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          sliderItems.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == entry.key
                        ? Colors.blueAccent
                        : Colors.grey,
              ),
            );
          }).toList(),
    );
  }

  // Helper method to build a summary card.
  Widget buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Carousel slider with dot indicators.
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: sliderItems.map((item) => buildCarouselItem(item)).toList(),
          ),
          buildDotIndicator(),
          const SizedBox(height: 24),
          // Grid summary cards.
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                buildSummaryCard(
                  'Total Employees',
                  '100',
                  Icons.people,
                  Colors.blue,
                ),
                buildSummaryCard(
                  'Pending Leave Requests',
                  '5',
                  Icons.pending_actions,
                  Colors.orange,
                ),
                buildSummaryCard(
                  'Approved Leaves',
                  '80',
                  Icons.check_circle,
                  Colors.green,
                ),
                buildSummaryCard(
                  'Rejected Leaves',
                  '2',
                  Icons.cancel,
                  Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

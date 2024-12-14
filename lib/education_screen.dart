
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  // List of stories
  final List<Map<String, String>> stories = [
    {
      'title': 'The Little Fox Learns to Focus',
      'content':
          'Once upon a time, a little fox struggled to pay attention in the forest school. Every time the teacher spoke, the little fox would daydream about running and playing. One day, the wise owl taught the fox a special trick: to count to three before starting a task. With practice, the fox learned to stay focused and listen better!',
      'image': 'assets/images/little_fox.png',
    },
    {
      'title': 'The Curious Caterpillar’s Journey',
      'content':
          'A curious caterpillar often forgot where it was going. It loved to explore, but its friends helped it stay on track by playing a memory game. They took turns hiding objects along the path, and the caterpillar had to remember where they were. With each game, the caterpillar became more focused and turned into a beautiful butterfly!',
      'image': 'assets/images/curious_caterpillar.png',
    },
    // Add other story items as needed...
  ];

  // List of tasks for different types of ADHD
  final List<Map<String, String>> tasks = [
    {
      'type': 'Inattentive ADHD',
      'task': 'Break tasks into smaller steps and set clear deadlines.',
      'image': 'assets/images/inattentive_adhd.png',
    },
    // Add other task items as needed...
  ];

  // List of daily routine activities
  final List<Map<String, String>> dailyRoutineActivities = [
    {
      'title': 'Morning Routine',
      'tasks':
          '1. Wake up and stretch.\n2. Have a healthy breakfast.\n3. Review the day’s tasks.',
      'image': 'assets/images/morning_routine.png',
    },
    // Add other routine items as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education on ADHD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Stories to Help Focus',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stories[index]['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset(stories[index]['image']!),
                        SizedBox(height: 10),
                        Text(
                          stories[index]['content']!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Tasks Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Daily Tasks for Different Types of ADHD',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tasks[index]['type']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset(tasks[index]['image']!),
                        SizedBox(height: 10),
                        Text(
                          tasks[index]['task']!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Daily Routine Activities Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Daily Routine Activities',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dailyRoutineActivities.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dailyRoutineActivities[index]['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset(dailyRoutineActivities[index]['image']!),
                        SizedBox(height: 10),
                        Text(
                          dailyRoutineActivities[index]['tasks']!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

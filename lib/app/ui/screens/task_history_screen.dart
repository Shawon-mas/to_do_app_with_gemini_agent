
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_with_gemini_agent/app/constants/app_text_styles.dart';
import 'package:to_do_app_with_gemini_agent/app/controller/task_controller.dart';
import 'package:to_do_app_with_gemini_agent/app/data/models/task.dart';

class TaskHistoryScreen extends StatelessWidget {
  const TaskHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task History', style: AppTextStyles.heading),
      ),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(
            child: Text('No tasks yet.', style: AppTextStyles.body),
          );
        }

        // Group tasks by date
        final groupedTasks = <DateTime, List<Task>>{};
        for (final task in taskController.tasks) {
          final date = DateTime(task.createdAt.year, task.createdAt.month, task.createdAt.day);
          if (groupedTasks[date] == null) {
            groupedTasks[date] = [];
          }
          groupedTasks[date]!.add(task);
        }

        final sortedDates = groupedTasks.keys.toList()..sort((a, b) => b.compareTo(a));

        return ListView.builder(
          itemCount: sortedDates.length,
          itemBuilder: (context, index) {
            final date = sortedDates[index];
            final tasks = groupedTasks[date]!;
            final formattedDate = DateFormat.yMMMd().format(date);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(formattedDate, style: AppTextStyles.subheading),
                ),
                ...tasks.map((task) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(task.title, style: AppTextStyles.subheading),
                    subtitle: Text(task.description),
                    trailing: Text(task.status),
                  ),
                )),
              ],
            );
          },
        );
      }),
    );
  }
}

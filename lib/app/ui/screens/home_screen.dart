
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:to_do_app_with_gemini_agent/app/constants/app_colors.dart';
import 'package:to_do_app_with_gemini_agent/app/constants/app_text_styles.dart';
import 'package:to_do_app_with_gemini_agent/app/controller/task_controller.dart';
import 'package:to_do_app_with_gemini_agent/app/data/models/task.dart';
import 'package:to_do_app_with_gemini_agent/app/ui/screens/task_history_screen.dart';
import 'package:to_do_app_with_gemini_agent/app/ui/widgets/custom_button.dart';
import 'package:to_do_app_with_gemini_agent/app/ui/widgets/custom_dropdown.dart';
import 'package:to_do_app_with_gemini_agent/app/ui/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // Placeholder for a logo
          child: Image.asset('assets/images/logo.png', width: 40, height: 40),
        ),
        title: Text('To-Do App', style: AppTextStyles.heading),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppColors.primaryColor),
            onPressed: () {
              Get.to(() => const TaskHistoryScreen());
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final Task task = taskController.tasks[index];
            return Slidable(
              key: Key(task.id),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => _showDeleteConfirmationDialog(context, taskController, task.id),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(task.title, style: AppTextStyles.subheading),
                  subtitle: Text(task.description),
                  trailing: Text(task.status),
                  onTap: () {
                    _showTaskDialog(context, taskController, task: task);
                  },
                  onLongPress: () => _showDeleteConfirmationDialog(context, taskController, task.id),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context, taskController);
        },
        child: const Icon(Icons.add, color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  void _showTaskDialog(BuildContext context, TaskController taskController, {Task? task}) {
    final isEditing = task != null;
    final titleController = TextEditingController(text: isEditing ? task.title : '');
    final descriptionController = TextEditingController(text: isEditing ? task.description : '');
    String assignValue = isEditing ? task.assign : 'Self';
    String roleValue = isEditing ? task.role : 'Personal';
    String statusValue = isEditing ? task.status : 'To-Do';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Task' : 'Add Task', style: AppTextStyles.heading),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(controller: titleController, labelText: 'Title'),
                const SizedBox(height: 16),
                CustomTextField(controller: descriptionController, labelText: 'Description'),
                const SizedBox(height: 16),
                CustomDropdown(
                  value: assignValue,
                  items: const ['Self', 'Team'],
                  onChanged: (newValue) {
                    if (newValue != null) {
                      assignValue = newValue;
                    }
                  },
                  labelText: 'Assign',
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  value: roleValue,
                  items: const ['Personal', 'Work'],
                  onChanged: (newValue) {
                    if (newValue != null) {
                      roleValue = newValue;
                    }
                  },
                  labelText: 'Role',
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  value: statusValue,
                  items: const ['To-Do', 'In Progress', 'Done'],
                  onChanged: (newValue) {
                    if (newValue != null) {
                      statusValue = newValue;
                    }
                  },
                  labelText: 'Status',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: AppTextStyles.body.copyWith(color: AppColors.primaryColor)),
            ),
            CustomButton(
              onPressed: () {
                final newTask = Task(
                  id: isEditing ? task.id : DateTime.now().toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                  assign: assignValue,
                  role: roleValue,
                  status: statusValue,
                  createdAt: isEditing ? task.createdAt : DateTime.now(),
                );
                if (isEditing) {
                  taskController.updateTask(newTask);
                } else {
                  taskController.addTask(newTask);
                }
                Navigator.pop(context);
              },
              text: 'Save',
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, TaskController taskController, String taskId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Task', style: AppTextStyles.heading),
          content: Text('Are you sure you want to delete this task?', style: AppTextStyles.body),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: AppTextStyles.body.copyWith(color: AppColors.primaryColor)),
            ),
            CustomButton(
              onPressed: () {
                taskController.deleteTask(taskId);
                Navigator.pop(context);
              },
              text: 'Delete',
            ),
          ],
        );
      },
    );
  }
}

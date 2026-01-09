
import 'package:get/get.dart';
import 'package:to_do_app_with_gemini_agent/app/data/models/task.dart';
import 'package:to_do_app_with_gemini_agent/app/data/services/hive_service.dart';

class TaskController extends GetxController {
  final HiveService _hiveService = HiveService();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    _hiveService.init();
    tasks.assignAll(_hiveService.getAllTasks());
  }

  void addTask(Task task) {
    _hiveService.addTask(task);
    tasks.add(task);
  }

  void updateTask(Task task) {
    _hiveService.updateTask(task);
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  void deleteTask(String id) {
    _hiveService.deleteTask(id);
    tasks.removeWhere((t) => t.id == id);
  }
}

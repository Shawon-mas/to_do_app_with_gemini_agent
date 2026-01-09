
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:to_do_app_with_gemini_agent/app/data/models/task.dart';
import 'package:to_do_app_with_gemini_agent/app/constants/hive_constants.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() {
    return _instance;
  }

  HiveService._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>(HiveConstants.taskBox);
  }

  Box<Task> getTaskBox() {
    return Hive.box<Task>(HiveConstants.taskBox);
  }

  Future<void> addTask(Task task) async {
    final box = getTaskBox();
    await box.put(task.id, task);
  }

  Future<void> updateTask(Task task) async {
    final box = getTaskBox();
    await box.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    final box = getTaskBox();
    await box.delete(id);
  }

  List<Task> getAllTasks() {
    final box = getTaskBox();
    return box.values.toList();
  }
}

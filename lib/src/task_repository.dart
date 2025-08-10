import 'package:vaden/vaden.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.create({
    required String title,
    required String description,
    required String status,
  }) {
    return Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      status: status,
    );
  }
}

@Repository()
class TaskRepository {
  var tasks = <Task>[];

  Future<Task> create(Task task) async {
    final newTask = Task.create(
      title: task.title,
      description: task.description,
      status: task.status,
    );

    tasks.add(newTask);
    
    return newTask;
  }

  Future<List<Task>> findAll() async {
    return tasks;
  }

  Task? findById(String id) {
    return tasks.firstWhereOrNull((task) => task.id == id);
  }

  Future<Task> update(String id, Task updatedTask) async {
    final index = tasks.indexWhere((task) => task.id == id);

    final taskWithId = Task(
      id: id,
      title: updatedTask.title,
      description: updatedTask.description,
      status: updatedTask.status,
    );

    tasks[index] = taskWithId;

    return taskWithId;
  }

  Future<void> delete(String id) async {
    tasks.removeWhere((task) => task.id == id);
  }
}
import 'package:vaden/vaden.dart';
import 'package:task_tracker/src/task_repository.dart';

class NotFoundException implements Exception {
  final String message;
  NotFoundException([this.message = 'Resource not found']);
}

@Service()
class TaskService {
    final TaskRepository _taskRepository;

    TaskService(this._taskRepository);

    Future<Task> create(Task task) async {
        return _taskRepository.create(task);
    }

    Future<List<Task>> findAll() async {
        return _taskRepository.findAll();
    }

    Future<Task> findById(String id) async {
        var task = _taskRepository.findById(id);

        if (task == null) {
            throw NotFoundException();
        }

        return task;
    }

    Future<Task> update(String id, Task updatedTask) async {
        var existingTask = _taskRepository.findById(id);

        if (existingTask == null) {
            throw NotFoundException();
        }

        var updatedTaskResult = await _taskRepository.update(id, updatedTask);

        return updatedTaskResult;
    }

    Future<void> delete(String id) async {
        var task = _taskRepository.findById(id);

        if (task == null) {
            throw NotFoundException();
        }

        return _taskRepository.delete(id);
    }
}
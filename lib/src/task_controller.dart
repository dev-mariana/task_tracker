import 'package:vaden/vaden.dart';
import 'package:task_tracker/src/task_service.dart';
import 'package:task_tracker/src/task_repository.dart';

@Controller('/tasks')
class TaskController {
  final TaskService _taskService;

  TaskController(this._taskService);

  @Post()
  Future<Task> create(@Body() Task task) async {
    return await _taskService.create(task);
  }

  @Get()
  Future<List<Task>> list() async {
    return await _taskService.findAll();
  }

  @Get(':id')
  Future<Task> get(String id) async {
    return await _taskService.findById(id);
  }

  @Patch(':id')
  Future<Task> update(String id, @Body() Task task) async {
    return await _taskService.update(id, task);
  }

  @Delete(':id')
  Future<void> delete(String id) async {
    await _taskService.delete(id);
  }
}


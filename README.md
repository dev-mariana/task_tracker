# Task Tracker

A simple task management API built with the Vaden framework in Dart.

## Features

- **CRUD Operations**: Create, read, update, and delete tasks
- **RESTful API**: Clean HTTP endpoints following REST principles
- **In-Memory Storage**: Fast data access with automatic UUID generation
- **JSON API**: Easy integration with any frontend or client application

## Prerequisites

- **Dart SDK**: Version 3.0.0 or higher
- **Git**: For cloning the repository

## Installation

1. **Clone the repository**:

   ```bash
   git clone <your-repository-url>
   cd task_tracker
   ```

2. **Install dependencies**:
   ```bash
   dart pub get
   ```

## Running the Project

### Start the Server

```bash
dart run bin/server.dart
```

The server will start on port 8080 by default. You should see:

```
Server listening on port 8080
```

### API Endpoints

The API is available at `http://localhost:8080/api/tasks`

| Method   | Endpoint          | Description              | Request Body                                                                              |
| -------- | ----------------- | ------------------------ | ----------------------------------------------------------------------------------------- |
| `POST`   | `/api/tasks/`     | Create a new task        | `{"title": "Task Title", "description": "Task Description", "status": "open"}`            |
| `GET`    | `/api/tasks/`     | List all tasks           | None                                                                                      |
| `GET`    | `/api/tasks/{id}` | Get a specific task      | None                                                                                      |
| `PUT`    | `/api/tasks/{id}` | Update a task completely | `{"title": "Updated Title", "description": "Updated Description", "status": "completed"}` |
| `PATCH`  | `/api/tasks/{id}` | Partially update a task  | `{"status": "in-progress"}`                                                               |
| `DELETE` | `/api/tasks/{id}` | Delete a task            | None                                                                                      |

## Testing the API

### Using curl

#### Create a Task

```bash
curl -X POST http://localhost:8080/api/tasks/ \
  -H 'Content-Type: application/json' \
  -d '{
    "title": "Complete Project",
    "description": "Finish the task tracker application",
    "status": "open"
  }'
```

#### List All Tasks

```bash
curl http://localhost:8080/api/tasks/
```

#### Get a Specific Task

```bash
curl http://localhost:8080/api/tasks/{task-id}
```

#### Update a Task

```bash
curl -X PUT http://localhost:8080/api/tasks/{task-id} \
  -H 'Content-Type: application/json' \
  -d '{
    "title": "Updated Task Title",
    "description": "Updated description",
    "status": "completed"
  }'
```

#### Delete a Task

```bash
curl -X DELETE http://localhost:8080/api/tasks/{task-id}
```

### Using Postman or Similar Tools

1. Set the base URL to: `http://localhost:8080`
2. Use the endpoints listed above
3. For POST/PUT/PATCH requests, set `Content-Type: application/json` header
4. Include the request body in JSON format

## Project Structure

```
task_tracker/
├── bin/
│   └── server.dart          # Main entry point
├── lib/
│   ├── config/              # Configuration files
│   ├── src/
│   │   ├── task_controller.dart  # API endpoints
│   │   ├── task_service.dart     # Business logic
│   │   └── task_repository.dart  # Data access
│   └── vaden_application.dart    # Vaden framework setup
├── public/                  # Static files
├── pubspec.yaml            # Dependencies
└── README.md              # This file
```

## Task Model

```dart
class Task {
  final String id;           // Auto-generated UUID
  final String title;        // Task title
  final String description;  // Task description
  final String status;       // Task status (e.g., "open", "in-progress", "completed")
}
```

## Development

### Adding New Features

1. **Models**: Add new model classes in `lib/src/`
2. **Repositories**: Create data access classes with `@Repository()` annotation
3. **Services**: Implement business logic with `@Service()` annotation
4. **Controllers**: Define API endpoints with `@Controller()` annotation

### Code Generation

The Vaden framework auto-generates some code. After making changes to annotations:

1. Stop the server
2. Run `dart run build_runner build` (if using build_runner)
3. Restart the server

## Troubleshooting

### Common Issues

1. **Port already in use**: Change the port in the server configuration or kill the process using the port
2. **Route not found**: Ensure all routes start with a forward slash `/`
3. **JSON parsing errors**: Verify request body format and Content-Type header

### Debug Mode

For debugging, you can add print statements in your service or repository methods. The server will output these to the console.

## Dependencies

- **vaden**: Main framework for routing and dependency injection
- **uuid**: For generating unique task identifiers
- **collection**: For utility methods like `firstWhereOrNull`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

[Add your license information here]

## Support

For issues or questions:

1. Check the troubleshooting section
2. Review the Vaden framework documentation
3. Create an issue in the repository

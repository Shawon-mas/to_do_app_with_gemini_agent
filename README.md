# 📝 Flutter Pro Task Manager




---

## 🚀 Key Features

*   **Clean & Modern UI:** Aesthetically pleasing design with a focus on usability.
*   **Full CRUD Functionality:** Create, read, update, and delete tasks seamlessly.
*   **State Management with GetX:** Efficient and reactive state management for a smooth UX.
*   **Local Persistence with Hive_CE:** High-performance, NoSQL database for offline-first capabilities.
*   **Interactive Task Management:**
    *   **Swipe to Delete:** Quickly discard tasks with a simple gesture.
    *   **Long-Press Actions:** Access contextual options with haptic feedback.
*   **Task History:** View tasks grouped by date for better organization.
*   **Reusable Components:** Modular UI widgets for consistency and rapid development.
*   **Clean Architecture:** Follows MVC principles for a scalable and testable codebase.

---

## 📱 App Preview


<table> <tr> <th align="center">Dashboard</th> <th align="center">Create/Edit Task</th> <th align="center">Task History</th> </tr> <tr> <td><img src="assets/images/1.png" width="220" alt="Dashboard"></td> <td><img src="assets/images/3.png" width="220" alt="Create Task"></td> <td><img src="assets/images/2.png" width="220" alt="Task History"></td> </tr> <tr> <th align="center">Update Task</th> <th align="center">Swipe/Delete Action</th> <th></th> </tr> <tr> <td><img src="assets/images/5.png" width="220" alt="Update Task"></td> <td><img src="assets/images/4.png" width="220" alt="Delete Action"></td> <td></td> </tr> </table>



## 📂 Project Structure

```text
lib/
├── app/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_constants.dart
│   │   ├── app_text_styles.dart
│   │   └── hive_constants.dart
│   ├── controller/
│   │   └── task_controller.dart
│   ├── data/
│   │   ├── models/
│   │   │   └── task.dart
│   │   └── services/
│   │       └── hive_service.dart
│   └── ui/
│       ├── screens/
│       │   ├── home_screen.dart
│       │   └── task_history_screen.dart
│       └── widgets/
│           ├── custom_button.dart
│           ├── custom_dropdown.dart
│           └── custom_text_field.dart
└── main.dart
```



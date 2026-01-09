
📝 Flutter Pro Task Manager
A professional-grade To-Do application built with Flutter, focused on clean architecture and high-performance local storage.

🚀 Key Features
Advanced CRUD: Create, Read, Update, and Delete tasks with a modern UI.

Detailed Task Metadata: Manage Title, Description, Assignee, and Role.

Smart Storage: Powered by Hive_CE for lightning-fast local persistence.

State Management: Reactive UI updates using GetX.

Modern Interaction:

Swipe to Delete: Quick removal using Dismissible.

Long Press: Contextual actions for task management.

Date-wise History: Automatically groups tasks by date for a clean timeline view.

🎨 Design & UI
Typography: Poppins (Global)

Color Palette: Modern Orange, Success Green, and Clean White.

Architecture: MVC (Model-View-Controller) for high maintainability.


lib/
├── app/
│   ├── core/            # AppColors, AppTextStyles, HiveConstants
│   ├── data/            # TaskModel & HiveService
│   ├── modules/         # MVC: Controllers & Views (Home, History, Widgets)
│   └── main.dart        # Initialization & Dependency Injection
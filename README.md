# 📝 Flutter To-Do App (Clean Architecture + BloC + Isar DB)

[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev) 
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev) 
[![BloC](https://img.shields.io/badge/BloC-00BFA6?logo=flutter&logoColor=white)](https://bloclibrary.dev/#/) 
[![Isar](https://img.shields.io/badge/Isar_DB-FC8019?logo=database&logoColor=white)](https://isar.dev) 


A modern **To-Do application** built with **Flutter**, following **Clean Architecture principles** and powered by the **BloC state management pattern**.  
The app uses **[Isar Database](https://isar.dev/)** for fast, efficient, and reliable offline-first data persistence.  

---

## 🚀 Features
- ✅ Add, update, delete tasks  
- 🔄 Real-time task state management with **BloC**  
- 💾 Offline-first support using **Isar DB**  
- 🎨 Minimal, clean, and responsive UI  
- 🧪 Testable and maintainable **Clean Architecture** structure  

---

## 🏗️ Architecture
This project strictly follows **Clean Architecture**, ensuring scalability and separation of concerns:

- **Domain Layer** → Business logic (entities, use cases, repositories)  
- **Data Layer** → Data sources & models (Isar DB integration)  
- **Presentation Layer** → UI + BloC (state management, events, states)  

This makes the codebase **modular, testable, and easy to extend**.  


---

## 🛠️ Tech Stack
- **Flutter** – UI framework  
- **BloC** – State management  
- **Isar DB** – Local NoSQL database  
- **Dart** – Programming language  

---

## 📦 Getting Started
```bash
# Clone the repository
git clone https://github.com/onluxall/ToDo-app.git

# Navigate into the project
cd ToDo-app

# Get dependencies
flutter pub get

# Run the app
flutter run

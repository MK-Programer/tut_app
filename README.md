# 🚀 Tut App  
### A Flutter Application Built with Clean Architecture and MVVM Pattern  

> A complete example of scalable app architecture in Flutter — applying **Clean Architecture**, **MVVM**, **Dependency Injection**, **Reactive Streams**, and **State Management**.  

---

## 🧾 Copy the Full Architecture Summary  

> 🧠 Use the button below to copy all project structure and notes.  

<pre>

📦 Tut App  
│  
├── 🏗️ **Architecture Overview**  
│  
│   lib/  
│   ├── presentation/        → UI Layer (MVVM Views, ViewModels, States)  
│   ├── domain/              → Business Logic Layer (Entities, UseCases, Repositories)  
│   ├── data/                → Data Layer (API, Local Cache, Repository Implementation)  
│   ├── app/                 → Core Layer (DI, Routing, Theming, Localization)  
│   └── resources/           → Assets, Styles, Values, Fonts  
│  
│  
├── ⚙️ **Design Pattern** — Clean Architecture  
│  
│   Presentation → UI, State Rendering, ViewModels  
│   Domain       → Use Cases, Entities, Repository Interfaces  
│   Data         → Data Sources, API Clients, Mappers  
│   App/Core     → Dependency Injection, Routing, Configurations  
│  
│  
├── 🧩 **MVVM Pattern**  
│  
│   Model  → Domain Data Structures  
│   View   → UI Screens and Widgets  
│   ViewModel → Business Logic + State Management  
│  
│  
├── 🌐 **Data Layer**  
│  
│   - Remote & Local Data Sources  
│   - API Client (Dio)  
│   - Logger Interceptor  
│   - API Caching  
│   - JSON Serialization & Annotations  
│   - Repository Implementation  
│   - Mapper (Response → Model → Domain)  
│   - Null Safety  
│   - Mock APIs (Stub APIs)  
│  
│  
├── 💡 **Domain Layer**  
│  
│   - Models / Entities  
│   - Repository Interfaces  
│   - UseCases  
│   - Either (Left = Failure / Right = Success)  
│   - Data Classes  
│  
│  
├── 🎨 **Presentation Layer**  
│  
│   - Splash, Onboarding, Login, Register, Forgot Password  
│   - Main, Details, Settings, Notification, Search  
│   - State Renderer (Full Screen / Popup)  
│   - State Management (RxDart, StreamBuilder)  
│   - Localization (EN/AR, RTL & LTR)  
│   - Assets Manager (Icons, Images)  
│   - Fonts, Styles, Themes, Strings, Colors Managers  
│   - Lottie Animations & SVG Support  
│  
│  
├── 🧰 **Packages Used**  
│  
│   dio  
│   rxdart  
│   get_it  
│   json_serializable  
│   shared_preferences  
│   flutter_svg  
│   lottie  
│   intl  
│   device_info_plus  
│  
│  
├── 🧱 **Key Concepts**  
│  
│   - BaseViewModel & BaseUseCase  
│   - Reactive Streams (RxDart)  
│   - Either Concept  
│   - Localization (EN/AR)  
│   - Abstract Classes  
│   - State Renderer  
│  
│  
├── 📱 **Device Support**  
│  
│   ✅ Android  
│   ✅ iOS  
│  

</pre>

---

## 🧑‍💻 Author  
**Mostafa Khaled**  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?logo=linkedin)](https://linkedin.com/in/mostafa-khaleedd)  
[![GitHub](https://img.shields.io/badge/GitHub-black?logo=github)](https://github.com/MK-Programer)  

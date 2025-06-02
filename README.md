# Project Structure Overview
## 📁 Folder Breakdown

- **lib/app/**: App-wide configurations including colors, themes, and asset paths.
  - **lib/features/**: Divided by features (`auth`, `home`, `products`, `common`) and each feature contains:
    - `data/` - for dummy/mock data or later services/repositories
    - `ui/screens/` - for screen widgets
    - `ui/widgets/` - for reusable widgets within the feature
    - `ui/controller/` – GetX or other state management logic (optional per feature)

    - ** lib/services/
    App-wide services such as:
    - `network_caller/` – Handles API calls (NetworkCaller, NetworkResponse)

- **main.dart**: Entry point of the application.

## ✅ Strengths
- Clean separation by feature makes scaling and maintenance easier.
- Reusable widgets are clearly scoped within their features.

## 🧱 Clean Architecture Layout
```
lib/         
├── app/                        # Default App configs
├── features/
│   ├── auth/
│   │   ├── data/               # Data sources, services 
│   │   └── ui/                 # Screens and widgets
│   │       ├── screens/
│   │       └── widgets/
│   ├── common/
│   │   └── ui/
│   │       ├── screens/
│   │       └── widgets/
│   ├── home/
│   │   ├── data/
│   │   │   └── models/
│   │   └── ui/
│   │       ├── controller/
│   │       └── screens/
│   │       └── widgets/
│   └── products/
│       ├── data/
│       │   └── models/
│       └── ui/
│           │── screens/
│           └── widgets/
├── services/
│   └── network_caller/
└── main.dart
```

---
_This structure balances clarity for small-to-medium apps, while being easily extendable into Clean Architecture for larger projects._

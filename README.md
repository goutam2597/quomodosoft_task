# Project Structure Overview
## 📁 Folder Breakdown

- **lib/app/**: App-wide configurations including colors, themes, and asset paths.
- **lib/features/**: Divided by features (`auth`, `home`, `products`, `common`) and each feature contains:
  - `data/` - for dummy/mock data or later services/repositories
  - `ui/screens/` - for screen widgets
  - `ui/widgets/` - for reusable widgets within the feature
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
│   │   └── ui/
│   │       ├── screens/
│   │       └── widgets/
│   └── products/
│       ├── data/
│       └── ui/
│           │── screens/
│           └── widgets/
└── main.dart
```

---
_This structure balances clarity for small-to-medium apps, while being easily extendable into Clean Architecture for larger projects._

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

## 🧱 Possible Clean Architecture Layout (Optional Upgrade)
```
lib/
├── core/                       # Shared components or services
├── features/
│   ├── auth/
│   │   ├── data/              # Data sources, services 
│   │   └── presentation/      # Screens and widgets
│   │       ├── screens/
│   │       └── widgets/
│   ├── common/
│   │   └── presentation/
│   │       ├── screens/
│   │       └── widgets/
│   ├── home/
│   │   ├── data/
│   │   └── presentation/
│   │       ├── screens/
│   │       └── widgets/
│   └── products/
│       ├── data/
│       └── presentation/
│           └── widgets/
└── main.dart
```

---
_This structure balances clarity for small-to-medium apps, while being easily extendable into Clean Architecture for larger projects._

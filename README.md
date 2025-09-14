# 📱 Asset Management App

Aplikasi sederhana untuk mengelola aset (Create, Read, Update, Delete) dengan fitur pencarian.  
Dibangun menggunakan **Flutter + Bloc (Cubit) + Clean Architecture**.

---

## 📋 Requirements
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio
- Emulator / Device Android (API 21+)
- Internet connection (untuk request API)

---

## 🚀 Installation
1. **Clone repository**
   ```bash
   git clone https://github.com/xridwan/GoodsApp.git
   cd GoodsApp
   
2. **Install Dependencies**
    ```bash
   flutter pub get
   
3. **Run App**`
   ```bash
   flutter run

4. **Build App**`
   ```bash
   flutter build apk --release
   
## Structured Directory
lib/
├── core/                # utils, constants, error handling
├── data/                # data sources & repository implementation
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/              # entity & usecase
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/        # UI (pages, widgets, cubit)
│   ├── cubit/
│   ├── pages/
│   └── widgets/
└── main.dart

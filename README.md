# 🍯 Honey Comp

A full-featured e-commerce Flutter application tailored for selling honey and related products. It offers a smooth and intuitive user experience with support for the Arabic language by default. The application is built using a feature-first Clean Architecture, ensuring scalability, maintainability, and testability.

## ✨ Features

- **Authentication**: Secure login and registration using Firebase Auth. Supports Email/Password, Google, and Facebook sign-in.
- **Product Catalog**: Browse and explore best-selling honey products.
- **Shopping Cart & Checkout**: Seamlessly add products to the cart and proceed to checkout.
- **Payment Integration**: Integrated with **Paymob** for secure and reliable payment processing.
- **User Profile**: Manage user details, preferences, and view order history.
- **Localization**: Fully localized with Arabic as the default language for a native experience.
- **Onboarding**: Engaging onboarding flow for first-time users.

## 🛠 Tech Stack & Libraries

- **Framework**: Flutter & Dart (SDK `^3.5.3`)
- **State Management**: BLoC / Cubit (`flutter_bloc`), `provider`
- **Dependency Injection**: GetIt (`get_it`)
- **Backend as a Service (BaaS)**: 
  - Firebase (Authentication, Cloud Firestore)
  - Supabase (`supabase_flutter`)
- **Networking API**: Dio (`dio`)
- **Architecture**: Clean Architecture (Domain, Data, Presentation layers per feature)
- **UI Components & Styling**:
  - `skeletonizer` for shimmer loading states
  - `cached_network_image` for optimized image caching
  - `modal_progress_hud_nsn` for blocking progress indicators
  - Custom Typography (Cairo Font)
- **Code Generation**: `build_runner`, `flutter_gen_runner`
- **Functional Programming**: `dartz`, `equatable`

## 📁 Folder Structure

The project follows a modular, feature-driven Clean Architecture approach:

```text
lib/
 ├── core/              # Shared infrastructure across the app
 │    ├── constants/    # Theme, colors, strings
 │    ├── errors/       # Failure handling and exceptions
 │    ├── services/     # 3rd party services (Firebase, Paymob, Supabase, GetIt)
 │    └── ...
 ├── features/          # Independent application modules
 │    ├── auth/         # Authentication flow
 │    ├── best_selling/ # Best selling products display
 │    ├── checkout/     # Cart and payment process
 │    ├── home/         # Main application dashboard
 │    ├── on_boarding/  # Intro screens
 │    ├── profile/      # User settings
 │    └── splash/       # Initial splash screen
 ├── l10n/              # Localization dictionaries
 └── main.dart          # Application entry point
```

*Note: Inside each feature directory (e.g., `auth`), you will find `data`, `domain`, and `presentation` layers to separate business logic from UI and data sources.*

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version `^3.5.3` or higher)
- Setup a Firebase project and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd honey_comp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generators** (for assets, locators, etc.)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 💳 Payment Gateway

This project integrates with **Paymob** for handling transactions. Configuration and API requests are handled inside the `lib/core/services/paymob_service.dart` file. Ensure you provide your own test/live API keys when setting up the project for deployment.

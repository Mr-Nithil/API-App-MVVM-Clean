# API App MVVM Clean

This Flutter app demonstrates clean architecture and state management using Riverpod. It fetches posts from the JSONPlaceholder API, displays them in a list, and allows local editing of post details with instant state updates across screens.

## Features

- Fetches a list of posts (limited to 10-20) from https://jsonplaceholder.typicode.com/posts
- Displays post titles in a List Screen
- Handles loading and error states gracefully
- Navigates to a Details Screen on tap, showing title and body
- Allows editing of title and body locally (no API update)
- Edits are reflected instantly on both Details and List screens

## Architecture

- **MVVM Clean Architecture**: Clear separation of data, domain, and UI layers
- **State Management**: [Riverpod](https://riverpod.dev/) is used for sharing and mutating state across screens
- **Data Layer**: API logic is separated from UI, using repository and model classes

## Packages Used

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) — State management
- [http](https://pub.dev/packages/http) — For REST API calls
- [fpdart](https://pub.dev/packages/fpdart) — Functional programming utilities (optional, for error handling)

## How it Works

1. The List Screen fetches and displays posts from the API
2. Tapping a post navigates to the Details Screen
3. The Details Screen allows editing the post title and body locally
4. Edits update the Riverpod state, instantly reflecting on both screens

## Getting Started

Clone the repo, run `flutter pub get`, and launch the app on your device or emulator.

---

This project is for demonstration and evaluation of clean architecture and Riverpod state management in Flutter.

## App Flow Screenshot

Below is a screenshot of the app flow, showing the List Screen and Details Screen with editing capabilities.

![App Flow](assets/screenshots/App%20Flow.png)

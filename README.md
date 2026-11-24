# JSONPlaceholder App

This Flutter application is built as a school project that consumes data from the public JSONPlaceholder REST API (https://jsonplaceholder.typicode.com).

## Features

The application displays 6 data endpoints across tabs:
- Posts (List of posts with ID and User ID)
- Comments (List of comments with name, email, and ID)
- Albums (List of albums with photo preview pop-ups)
- Users (List of user profiles with contact and address details)
- Photos (List of photos with thumbnails and full-size dialog previews)
- Todos (List of todos with completed status)

Additional features:
- Dynamic total item counters on each tab
- Pull-to-refresh functionality
- Responsive layout for both mobile and desktop screens

## Tech Stack

- Flutter SDK
- Dart
- `http` package for API requests

## Getting Started

1. Clone or open this repository.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

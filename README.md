# Food Delivery App

A food delivery application built with **Flutter and Dart**, designed to provide a food ordering experience through a structured and maintainable mobile application.

The project focuses on state management, separation of concerns, REST API integration, and map-based functionality.

## Features

- **Food Browsing:** Explore available restaurants and food items.
- **Food Ordering:** User-facing workflows for browsing menus and managing orders.
- **User Roles:** Separate functionality for customers and restaurant owners.
- **REST API Integration:** Communicate with a Django REST API backend.
- **Map Integration:** Use Flutter Map and map APIs for location-related functionality.
- **State Management:** Manage application state using the BLoC pattern.
- **Layered Architecture:** Organize application logic using models, repositories, and data sources.

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform application development |
| Dart | Programming language |
| BLoC | State management |
| Repository Pattern | Separation of data access from application logic |
| Django REST Framework | Backend API integration |
| Flutter Map | Map-related functionality |

## Architecture

The application follows a layered structure to improve code organization and maintainability.

- **Presentation Layer:** Screens and widgets responsible for the user interface.
- **BLoC Layer:** Handles application events and state transitions.
- **Repository Layer:** Coordinates data access and communication with data sources.
- **Data Source Layer:** Handles communication with backend APIs.
- **Model Layer:** Represents application data.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Git
- Access to the configured backend API

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/avafrzmhr/Food_Delivery.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Food_Delivery
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure the backend API endpoint according to your environment.

5. Run the application:

   ```bash
   flutter run
   ```

**Note:** The backend must be configured and accessible for API-dependent features to work.

## Learning Objectives

This project demonstrates practical experience with Flutter application development, BLoC-based state management, repository-based data organization, REST API integration, and map-related features.

## Author

**Ava Firouzmehr**

- GitHub: [avafrzmhr](https://github.com/avafrzmhr)

## License

No license has been specified yet. Please check the repository's license before reusing or distributing the code.

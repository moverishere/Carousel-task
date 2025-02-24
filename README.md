# Carousel Interview Project

A Flutter project implementing a headless carousel component with example applications. The project demonstrates a reusable carousel component with two different implementations.

### Project Structure

```
├── components/ # Shared components library
├── main_app/ # Main application
├── widgetbook/ # Component showcase
├── melos.yaml # Monorepo configuration
├── pubspec.yaml # Root pubspec
└── README.md # Project documentation
```

### Prerequisites

- Flutter SDK (3.29.0)
- Dart SDK (3.7.0)
- [Melos](https://melos.invertase.dev/) for monorepo management

### Getting Started

Clone the repository:
```bash
git clone https://github.com/yourusername/carousel_inteview
cd carousel_inteview
```

Install Melos:
```bash
dart pub global activate melos
```

Bootstrap the project:
```bash
melos bootstrap
```


### Project Components
#### Components Library
Contains the headless carousel component and shared theme. The component is designed to be reusable and customizable across different implementations.

#### Main Application
Demonstrates the carousel component with real API integration:
1.  Uses Riverpod for state management
2.  Implements two different carousel designs
3.  Fetches data from Steller.co APIs

#### Widgetbook
Showcases the carousel component with various configurations and usage examples.

### Running the Projects
#### Main Application

Use melos which is designed for managing different repos (wrapper on classic commands)
Call all commands in root of the project.

First of all you need to run pub get to update your pubspec packages:

```bash
melos get
```

#### Widgetbook

```bash
melos run widgetbook:run
```

#### Main
```bash
melos run main:run
```

### API Integration
The main application uses two endpoints:

Collections Endpoint:
```
https://steller.co/users/2166257779239552048/collections
```
Displays: cover_image_url

Stories Endpoint:
```
https://steller.co/feeds/users/2166257779239552048/feeds/collection-stories?context=2279792120556423125
```
Displays: cover_src
Note: Requires header "Accept": "application/json"

### Features
Core Features:

1.  Headless carousel component
2.  Navigation controls
3.  Slide indicators
4.  Current slide information
5.  Customizable UI elements
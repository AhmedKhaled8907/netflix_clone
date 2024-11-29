# netflix_clone

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

'''
├───core
│   ├───error
│   ├───movies
│   │   ├───data
│   │   │   ├───data_sources
│   │   │   ├───models
│   │   │   │   └───movie_model
│   │   │   └───repos
│   │   └───domain
│   │       ├───entity
│   │       ├───repo
│   │       └───usecase
│   └───utils
│       ├───functions
│       ├───managers
│       ├───usecase
│       └───widgets
└───features
    ├───home
    │   └───presentation
    │       ├───controller
    │       │   └───movie_cubit
    │       └───views
    │           └───widgets
    ├───main
    │   └───presentation
    │       ├───controller
    │       │   └───bottom_nav_bar_cubit
    │       └───views
    │           └───widgets
    ├───movie_details
    │   └───presentation
    │       ├───controller
    │       │   └───movie_details_bloc
    │       └───views
    │           └───widgets
    ├───search
    │   └───presentation
    │       ├───controller
    │       │   └───search_bloc
    │       └───views
    │           └───widgets
    └───splash
        └───presentation
            └───views
                └───widgets

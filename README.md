# **Netflix Clone**

I made this app with Flutter using clean architecture and  bloc as state management at the presentation layer.

## Demo for the app

https://youtube.com/shorts/khY6PuJC3mU?si=s2CQbTOiLbHN5ocD

## Brief explanation

Netflix Clone is a movie and TV show data app that searches for them, too.
I used (Tvmaze) for fetching the data.

## Screenshots

| Splash View | Home View | Search View | Details View |
| :-----------: | :---------: | :------------: | :--------------: |
![](https://github.com/AhmedKhaled8907/netflix_clone/blob/main/screenshots/splash.png?raw=true)|![](https://github.com/AhmedKhaled8907/netflix_clone/blob/main/screenshots/home.png?raw=true)|![](https://github.com/AhmedKhaled8907/netflix_clone/blob/main/screenshots/search.png?raw=true)|![](https://github.com/AhmedKhaled8907/netflix_clone/blob/main/screenshots/details.png?raw=true)

## Directory Structure for project
```
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
```

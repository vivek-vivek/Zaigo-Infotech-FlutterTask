# Zaigo-Infotech-FlutterTask

This is a Flutter application that demonstrates the implementation of a splash screen, login screen, home screen, location finder screen, and lawyer details screen, along with an exit pop-up dialog. The app uses the following packages:

- provider: ^6.0.5
- shared_preferences: ^2.1.0
- dio: ^5.1.1
- geocoding: ^2.1.0
- geolocator: ^9.0.2
- google_maps_flutter: ^2.2.6
- glassmorphism: ^3.0.0

## Screenshots

![Splash Screen](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/splash_screen_pqf2gy.jpg) | ![Login Screen](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/login_screen_habfgs.jpg) | ![Home Screen](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/home_screen_aymcr8.jpg)
:-------------------------:|:-------------------------:|:-------------------------:
Splash Screen | Login Screen | Home Screen

![Location Finder Screen](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/location_screen_ju6v2q.jpg) | ![Lawyers Details Screen](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/detailes_screen_pm6gmz.jpg) | ![Exit Dialog](https://res.cloudinary.com/dmucol7ic/image/upload/v1683547084/exit_pop_up_ekrpke.jpg)
:-------------------------:|:-------------------------:|:-------------------------:
Location Finder Screen | Lawyers Details Screen | Exit Dialog

## Features

- The app displays a splash screen while the app is loading.
- Users can log in using their email and password. The app uses the `shared_preferences` package to save the user's login credentials and keep them logged in across app sessions.
- The home screen displays a list of lawyers that the user can search and filter.
- The location finder screen allows the user to search for a location and get its latitude and longitude coordinates.
- The lawyers details screen displays detailed information about a selected lawyer.
- The exit pop-up dialog appears when the user attempts to exit the app and gives the user the option to log out, exit the app, or cancel.

## Installation

To run this app, you will need to have Flutter installed on your machine. Then, clone this repository and run `flutter pub get` to install the dependencies. Finally, run `flutter run` to launch the app.

```bash
git clone https://github.com/<username>/Zaigo-Infotech-FlutterTask.git
cd Zaigo-Infotech-FlutterTask
flutter pub get
flutter run
```

## Usage

The app is designed to be self-explanatory and easy to use. Users can navigate between screens by tapping the appropriate button or icon. The app uses provider package for state management.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

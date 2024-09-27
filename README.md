# Task Manager



## Index of the documentation

1.  [Introduction](#introduction)
2.  [Code Architecture](#code-architecture)
3.  [Database Structure](#database-structure)
4.  [App Flow Chart](#app-flow-chart)
5.  [Installation](#installation)
6.  [Features](#features-of-the-application)

##
## Introduction

Is an application to keep track of your daily tasks.

##
## Code Architecture

Clean architecture revolves around separating code into layers, each with a distinct responsibility. The primary layers include:

1.  **Application Layer**: The application layer contains the application's core business logic. It serves as an intermediary between the presentation and domain layers, coordinating data flow and enforcing business rules.

2.  **Data Layer**: This layer manages data storage, retrieval, and interactions with external APIs. It encompasses repositories, data sources, and API clients.

3.  **Domain Layer**: The domain layer defines the fundamental business logic and domain models of the application. It remains independent of specific UI frameworks or databases, ensuring high reusability and testability.

4.  **Presentation Layer**: This layer concerns itself with the user interface and interactions. It includes global widgets, screens, and controllers responsible for user input and data display.


<img width="668" alt="Screenshot 2024-07-09 at 8 34 10 PM" src="https://github.com/Danish-Git/expense_manager/assets/79436114/582df4ac-28a1-41d3-a8f2-b19622f3599d">

##
## Database Structure

The application uses SQLite for data storage. Below is the structure of the database:

<img width="727" alt="Screenshot 2024-07-09 at 9 09 36 PM" src="https://github.com/Danish-Git/expense_manager/assets/79436114/e21577a2-1775-41a9-a754-6de0511eae28">

##
## App Flow Chart

Below is a flow chart illustrating the app's workflow:

![app-flow-chart](https://github.com/Danish-Git/expense_manager/assets/79436114/6c2dcf20-a0a0-4f0c-a156-f5621d2e6ab9)


##
## Installation

This project is based on Flutter framework.

For help getting started with Flutter setup, view the [online documentation](https://docs.flutter.dev/get-started/install), which offers tutorials, guidance on mobile development.

This project is based latest configuration (for now) of flutter framework. Please refer to the attached flutter doctor summery


    apple@ todo % flutter doctor  
    Doctor summary (to see all details, run flutter doctor -v):  
    [✓] Flutter (Channel stable, 3.22.2, on macOS 14.4.1)  
    [✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)  
    [✓] Xcode - develop for iOS and macOS (Xcode 15.4)  
    [✓] Chrome - develop for the web  
    [✓] Android Studio (version 2024.1,1)  
    [✓] VS Code (version 1.90.2)  
    [✓] Network resources  
      
    • No issues found!
You may proceed with clonnong the project and making project up and running you may follow the following steps

-   **Navigate to the Project Directory:**
    -   Once the cloning process is complete, navigate into the project directory: `cd <project_directory>`
    -   Replace `<project_directory>` with the name of the directory created during cloning.
-   **Check Flutter Dependencies:**
    -   Ensure that the Flutter dependencies are up to date. Run: `flutter pub get`

-   **Open in IDE:**
    -   Open the project in your preferred IDE or code editor (e.g., VS Code, Android Studio).

-   **Run the Project:**
    -   Connect an emulator/device or use an existing one that is running.
    -   Run the Flutter project using:  `flutter run`
    -   This command builds and deploys the Flutter project on your connected device or emulator.

-   **Verify Setup:**
    -   Once the project builds successfully, you should see the app running on your emulator/device.


##
## Features of The Application

### 1. Responsive UI

This application has fully responsive user interface, ensuring a seamless experience across a wide range of devices, from smartphones and tablets.

- #### *Task Listing Screen*
| Web | Tablet | Mobile |
|--|--|--|
| ![Screenshot_1720529777](https://github.com/user-attachments/assets/b3152745-25e4-40f9-a4fa-afd66a2722ee) |  ![Screenshot_1720529762](https://github.com/Danish-Git/expense_manager/assets/79436114/1bfb8ec3-9eb0-4bd2-bcfe-26e95819f264)  |  ![Screenshot_1727429493](https://github.com/user-attachments/assets/0864e3b6-5d41-4687-bd8c-3434ad3da368)  |





- #### *Task Filter Screen*
| Web | Tablet | Mobile |
|--|--|--|
| ![Screenshot_1720529777](https://github.com/user-attachments/assets/71519b2e-c984-4ae4-840b-c4594bf37216) |  ![Screenshot_1720529762](https://github.com/Danish-Git/expense_manager/assets/79436114/1bfb8ec3-9eb0-4bd2-bcfe-26e95819f264)  |  ![Screenshot_1727429505](https://github.com/user-attachments/assets/6ba98a7e-7096-435a-a680-ea61f9fd238a)  |




- #### *Task Detail Screen*
| Web | Tablet | Mobile |
|--|--|--|
| ![Screenshot_1720529777](https://github.com/user-attachments/assets/2a09c45d-ac11-426b-9e64-80217e78c3d2) |  ![Screenshot_1720529762](https://github.com/Danish-Git/expense_manager/assets/79436114/1bfb8ec3-9eb0-4bd2-bcfe-26e95819f264)  |  
![Screenshot_1727429549](https://github.com/user-attachments/assets/173ccddf-9956-493e-8404-8e838743c642)  |



- #### *Add / Edit Tasks Form*
| Web | Tablet | Mobile |
|--|--|--|
| ![Screenshot_1720526239](https://github.com/user-attachments/assets/c8a2e5a0-5704-45dd-9437-c8e631cf24ff) | ![Screenshot_1720526463](https://github.com/Danish-Git/expense_manager/assets/79436114/e290a5fe-d088-466e-9c3e-2c218e84c7de) | ![Screenshot_1727429519](https://github.com/user-attachments/assets/833ceda8-d000-4a63-a13d-ae41dd9c1989) |

<img width="1191" alt="Screenshot 2024-09-27 at 3 09 43 PM" src="https://github.com/user-attachments/assets/c8a2e5a0-5704-45dd-9437-c8e631cf24ff">











# 🏥 **AI-Powered Healthcare Platform**

## 📋 **MedXpress iOS App**


Welcome to the ** MedXpress ** iOS application! This app is developed using UIKit and incorporates advanced technologies and features to deliver a smooth and interactive user experience.

## 🚀 Features

- **Custom UI Components**: Custom buttons, views, and animations designed with UIKit.
- **Advanced Networking**: Powered by Alamofire for efficient networking and API management.
- **Pagination**: Dynamic loading of content using `UITableView` with pagination.
- **MVC Architecture**: Utilized MVC design pattern for better separation of concerns, making the app scalable and maintainable.
- **Concurrency**: Optimized performance with multithreading using GCD and `OperationQueue`.
- **Dynamic UI Updates**: Flexible UI with Auto Layout that adapts to various screen sizes and orientations.
- **Offline Support**: Cache and offline data persistence using CoreData.
- **Voice Call**: Integrated voice call with doctors
- **Voice AI**: Voice AI which helps patients get medical consultation using AI.

## 🛠️ Technologies Used

- **UIKit**: Core UI framework used for creating and managing the app’s interface.
- **Alamofire**: For HTTP networking and handling API requests.
- **CoreData**: Used for local data storage.
- **GCD & OperationQueue**: For handling concurrent tasks and improving performance.
- **Auto Layout**: Adaptive UI that works across multiple devices and screen sizes.
- **WebRCT**: For voice call integration
- **WebSocket**: For real-time communication and data updates.

## 📱 Screenshots

![Architecture Diagram](images/App_Screen_1.jpg)
![Architecture Diagram](images/App_Screen_2.jpg)
![Architecture Diagram](images/App_Screen_3.jpg)

_Add more screenshots as needed to showcase your app interface and functionality._

## 📖 Getting Started

### Prerequisites

- Xcode 12 or later
- iOS 13.0 or later

### Installation

1. Clone this repository:
    ```bash
    https://github.com/aslon1213/pta_medxpress.git
    ```
2. Open the folder "app" and go to the folder "MedXpress"  
2. Open the `.xcodeproj` file in Xcode.
3. Wait until Xcode finish loading packages
4. Run the app on your simulator or connected device.

## 🧑‍💻 Code Structure

- **MVC**: The project follows the MVC design pattern for better code organization.
- **Networking**: API requests are handled using Alamofire.
- **View**: Each screen is managed by a view controller, responsible for handling view logic.
- **Model**: The data models used throughout the app.
- **Controller**: Handles business logic and prepares data for the view.

## Pic2Plate AI: An Open-Source Project to Explore Gemini Pro Vision with Flutter

Pic2Plate AI is an open-source Flutter project designed to showcase the capabilities of Google's Gemini Pro Vision model. This project allows users to take a picture of their ingredients and receive recipe suggestions based on the identified items. 

This project serves as a valuable learning resource for developers interested in:

* **Gemini Pro Vision:** This powerful model from Google AI can analyze images and generate creative text formats, like poems, code, scripts, musical pieces, email, letters, etc. 
* **Flutter:** This popular cross-platform framework allows you to build beautiful and performant mobile apps with a single codebase.
* **Flutter state management:** This code base could help you learn how to manage state in a Flutter app using bloc package and a clean code architecture.


### Project Highlights:

* **Image recognition:** Users can upload or take a picture of their ingredients.
* **Recipe generation:** Gemini Pro Vision analyzes the image and generates recipe suggestions in markdown format.
* **Customization:** Users can specify the number of people they are cooking for, maximum cooking time, and any dietary restrictions.
* **Secure API key management:** The project demonstrates how to use the flutter_dotenv package to securely store and access your Gemini API key.

### Getting Started:

1. **Clone the repository:** 
﻿
```git clone https://github.com/your-username/pic_2_plate_ai.git```
﻿
`
2. **Install Flutter:** Follow the instructions on the official Flutter website: https://flutter.dev/docs/get-started/install
3. **Set up your Gemini API key:** 
    * Create a `.env` file in the project's root directory.
    * Add the following line to the `.env` file, replacing `YOUR_API_KEY` with your actual Gemini API key: ```PALM_API_KEY=YOUR_API_KEY```

4. **Install dependencies:** Run the following command in the project directory:
```flutter pub get```

5. **Run the app:** Run the following command to launch the app on your connected device or emulator:
```flutter run```


### Learn More:

For a detailed explanation of the project's functionality and implementation, please refer to the accompanying [Medium post](https://alfredobs97.medium.com/pic2plate-crea-aplicaciones-con-ia-con-flutter-y-gemini-e414b4cf8c3e)

This project provides a starting point for exploring the exciting possibilities of Gemini Pro Vision and Flutter. Feel free to experiment, customize, and contribute to the project!
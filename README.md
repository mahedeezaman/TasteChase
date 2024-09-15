# CurrencyConverter
Taste Chase is a native iOS application dedicated to dessert lovers. Designed with simplicity and ease of use in mind, the app allows users to explore a wide variety of dessert recipes. By integrating with the TheMealDB API, Taste Chase offers a comprehensive and engaging way to discover, view, and enjoy sweet treats from around the world.

With Taste Chase, you can:

```
-> Browse through a diverse list of desserts.
-> Access detailed information on each recipe, including instructions and ingredients.
-> Explore new recipes and revisit old recipes with ease.
```

The app is crafted to deliver a smooth and enjoyable user experience, making it a perfect companion for anyone looking to satisfy their sweet tooth or get inspired in the kitchen.


# Requirements to run the project
In the whole app, ```no third party library is used```. to run the project,
1. Go to the project directory
2. Open the .xcodeproj file and run the project on any device having iOS 15+

# Architecure
For design patterns, ```MVVM``` has been used, and ```SOLID architecture``` would be necessary to create scope for future requirements.

# API Endpoints
The app uses the following API endpoints:

1. Dessert List
```
URL: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
Description: Fetches a list of dessert recipes.
```
2. Meal Details

```
URL: https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
Description: Fetches details of a specific dessert recipe by its ID.
```

# Solution overview
For this project, I wanted to show my skills/knowledge set of different approaches. So I used 
```
-> async/await in API calls
-> generic classes to reuse code. 
-> maintained SOLID, clean architecture. So adding new feature wont break the code
-> For the design pattern, MVVM is followed.
```

Following one approach throughout the whole app is good practice, but as this project is a reference for my knowledge set, I wanted to use all of them. Here are the details - 

1. For Model - As this is a simple project, all the data model is very simple.

2. For View - For the color combination, I used (https://coolors.co/palette/012a4a-013a63-01497c-014f86-2a6f97-2c7da0-468faf-61a5c2-89c2d9-a9d6e5) this link. Also, used the CeraPro font family for the whole project. Created custom view modifiers and view extensions to keep the code clean. t

3. For ViewModel -  Implemented using @ObservableObject @EnvironmentObject @StateObject. Kept it simple. Didn't feel the necessity to implement Combine here

4. For NetworkServices - It is responsible for API communications. I created this a generic method for code re-usability

It took around ```3 working days (24 hours)``` for me to complete this project. App supports ```iOS15+ with iPhone (Portrait), iPad(Portrait)```.

# App workflow overview
When the app comes into the foreground, the ViewModel requests meal list data from the NetworkServices. During this data retrieval, a progress ring is displayed, preventing user interaction until the data has been fully loaded. Once the ViewModel has received the data, it is injected into the view for display.

One challenge faced was managing image loading efficiently. To address this, images are fetched as table cells appear on screen. When a cell becomes visible, the app makes an API call to retrieve the image. Conversely, if a cell disappears, any ongoing image-fetching tasks are halted. This ensures that only the images for currently visible cells are loaded, optimizing performance and resource usage.

Additionally, when a cell is selected to view the detailed recipe, data is transferred from the HomeView to the RecipeView. If the image was not previously loaded in the HomeView, the RecipeView will call the API to reload the image. The RecipeView also features a small window where a YouTube video is embedded, providing users with a video tutorial on how to create the recipe.

In this setup, the view's primary responsibility is to display the list of data. All validation and business logic are managed by the ViewModel, maintaining a clear separation of concerns between the view and the underlying logic.


<img width="564" alt="Screenshot 2024-09-15 at 3 43 27 PM" src="https://github.com/user-attachments/assets/fd7f8212-5b87-49ea-9e46-05b2ff593922">
<img width="564" alt="Screenshot 2024-09-15 at 3 43 31 PM" src="https://github.com/user-attachments/assets/5ecf08d6-baeb-4861-a31d-54d8ed886a7e">
<img width="564" alt="Screenshot 2024-09-15 at 3 43 40 PM" src="https://github.com/user-attachments/assets/609c6f00-9f1e-43fe-8751-289199c6941c">
<img width="764" alt="Screenshot 2024-09-15 at 3 44 17 PM" src="https://github.com/user-attachments/assets/a8fc2505-b470-44e8-ba42-9900066f06d1">
<img width="764" alt="Screenshot 2024-09-15 at 3 44 21 PM" src="https://github.com/user-attachments/assets/db49e0fd-4cf0-464a-90d7-f3aab7536c78">

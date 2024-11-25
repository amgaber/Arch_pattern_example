# Arch_pattern_example ->  Rick and Morty API TableView with details

## Version

1.0

## Build and Runtime Requirements
+ Xcode 16.0 or later
+ iOS 16.0 or later
+ OS X v15.10 or later

## Configuring the Project
    
    To make that UI of project doesn't depend on storyboards or XIBs files: 
    1. We removed Main Storyboard & any refrence to it
    2. We removed SceneDelegate refrences
    3. We launched the project from AppDelegate using UIWINDOW 


## About Project

Project is a  sample code project for iOS and OS X. In this sample, the tableView contains the list of characters with there different parameters, and each row can be selected to show details Screen for that item. 


## Written in Swift and SwiftUI

This sample is written in both  Swift and SwiftUI.That version contain both UIKIT and SwiftUI. UIkit is used for viewController , which contains tableView that shows SwiftUI cellView and SwiftUI Filter view which contains filter buttons. 
    And DetailsViewController which contains SWIFTUI detailView.    


## Application Architecture 

 1. The  project is implemented using Model-ViewModel-View (MVVM) architecture pattern.
    - Model (Item) has necessary data for list Items (Characters)
        ->  RickAndMortyCharacter: Represents a single Rick and Morty character, with properties like id, name, status, species, gender, origin, location, image, and episode.
            RickAndMortyAPIResponse: Encapsulates the paginated response from the Rick and Morty API, including the list of characters and pagination information (e.g., page, pages, and total).
            RickAndMortyNetworkService: Handles network requests to the Rick and Morty API, including pagination logic.
        
    - View is responsible for displaying views, which where UITableViews, UIHostingTableViewCell,TableViewHelper and swiftUI views(cellView, FilterButtonsView, ImageUI) 
        -> RickAndMortyListView: Represents the UI component that displays the list of characters. It observes the ViewModel's output properties to update its UI accordingly.
            RickAndMortyCharacterView: Represents the UI component for a single character. It binds to a RickAndMortyCharacter object from the ViewModel.
     
    -  ViewModel is formatting Data for the view and encapsulate business logic, ex. ( TaskListViewModel manages the list of items and provides data for each cell via individual TaskViewModel, which connect Item model to UI)
        -> RickAndMortyListViewModel: Manages the state of the character list, including the list of characters, pagination state (loading, error, success), and current page number. It exposes observable properties for the View to bind to.
            RickAndMortyListViewModelInput: Defines input actions for the ViewModel, such as loadInitialData, loadMoreData, and refreshData.
            RickAndMortyListViewModelOutput: Defines output events emitted by the ViewModel, such as updatedCharacterList, loadingStateChanged, and errorOccurred.

    - ViewController (ViewController and DetailsViewController), they contain the hosted UIs and call viewModel to fire actions and control navigations.
    
    2. The NetworkService handles asynchronous network requests, using URLSession to call api services using required URLs & parsing json data to the required Model.
    
    3. Embedding SwiftUI views in UIKit View Controllers ->  While SwiftUI and UIKit are distinct frameworks, you can seamlessly integrate SwiftUI views into your UIKit view controllers using UIHostingController.
    
    4.  Communication: You can pass data between the SwiftUI view and the UIKit view controller using delegates techniques or closure.
    
    5.  - NetworkService and TaskListViewModel code by using Swift's async/await and Task for handling asynchronous operations more elegantly. This approach makes the code cleaner, avoids callback pyramids, and integrates better with modern Swift.
            
            Why Use async/await?
            * Readability: Linear flow in code makes it easier to read and maintain.
            * Error Handling: try/catch works naturally with async/await.
            * Concurrency: Leverages Swift’s structured concurrency to avoid callback hell.
    
    6. Update network Service and ViewModel  with pagination and filter parameters, to apply pagination using "nextPage" from api data and filter list with "Status" parametrs. 
    
    7. Dependency Injection is used to pass models or view models to view controllers during initialization for clear data flow
    
## Key Points
    
    - Performance Considerations: While this approach offers flexibility, be mindful of performance implications, especially for large datasets. Consider techniques like cell reuse and optimization of SwiftUI views.
    - UIHostingController: This class is essential for bridging SwiftUI and UIKit.
    - Layout Constraints: Ensure the SwiftUI view fills the entire cell content view using Auto Layout constraints or programmatic layout.
    - Data Passing: Pass the necessary data to the SwiftUI view using its initializer or properties.


## Project Challenges

    The challenges encountered in Project is:
    -  To decide which type of listing to use , and we decide to use TableView as we just need listing without any hard techniques

    - To decide if use storyboards or create tableview programatically,I decided with deleting storyboards and set uikit views programatically.
    
    - To decide which type of binding to use between ViewModel and Views and view Controllers , I decided to use closures techniques 



## Unit Tests

Project has unit tests written for the TableviewList in ViewController. 
    - To run the unit tests, select (either the  iOS or OS X) scheme in the Scheme menu. Then hold the Run button down and select the "Test" option, or press Command+u to run the tests.


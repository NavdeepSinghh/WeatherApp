# WeatherApp
A demo app displaying current weather using the darksky web api. The UI is made using interface builder.

## Build and Runtime Requirements
Xcode 8.0 or later iOS 9.0 or later OS X v10.12 or later

## Configuring the Project
Please clone the project in your local machine and open with the latest version of Xcode. Build and run the project after selecting a device from the device inspector.

##  About NestDemoDomain
Written using Swift 3.0. The app accesses dark sky api to fetch current weather and display it to the user in realtime. 

## Unit Tests
Unit tests are written to test asynchronous code (creating the request to be sent to the apimanager) and Helper code which processed date data. Mocking the response from the api manager and processing json data.
### Code Coverage :
Approx 70%

### Steps to Execute tests:
Please follow instructions inside the code comments and inside test targets. Please make sure that the code module to be tested is included in the test target memberships.

### Design Goal:
Design consideration : The like button is next to description and not on top of the property image. 
Design goal is to mimimise dependencies between controllers and models. Fetch, filter and model data asynchronously and populate the view on the main queue and make use of protocol oriented principles of the swift language to maintain decent level of decoupling within the application logic.

Repo Owner
Navdeep Singh

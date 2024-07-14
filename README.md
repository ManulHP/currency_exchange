# Developer Guide

## About this project
This project is a currency converter app developed using Flutter. Users can input an amount with the relevant currency type and select the target currency for conversion. Once the conversion is complete, the data is automatically saved locally.

The app follows the clean architecture design pattern, utilizing BLoC for state management. The feature folder is divided into three subfolders: presentation, data, and domain. The presentation layer encompasses the UI elements and state management. The domain layer contains the business logic of the application, and the data layer is responsible for fetching data from the internet.

This project utilizes the ExchangeRate-API for currency conversion. You can generate your own API key by visiting the ExchangeRate-API website and adding it to an environment file or placing the API key value in utils/api_endpoint.dart.

## Setup
1. Flutter version 3.19.2 and above
2. If Enviroment variables are used then edit the configuration file or else run it normally 
3. To create a API-KEY visit [exchangerate-api](https://www.exchangerate-api.com/)

## Running the project
1. Clone the reposiotry (main branch)
2. Open the project using android studio or vs code
3. If using environment variables, edit the main configuration accordingly; otherwise, run the project normally.
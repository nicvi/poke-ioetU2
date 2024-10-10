
# Pokémon App

## Overview

The Pokémon App is a mobile application designed for Pokémon fans, enabling users to capture photos of Pokémon and view them alongside Pokémon profiles. Users can fetch Pokémon data from the PokeAPI, view details about each Pokémon, and manage their personal Pokémon images.

## Features

- **Splash Screen**: A beautiful splash screen displayed while the app initializes.
- **Fetch Pokémon Data**: The app fetches 20 Pokémon from the [PokeAPI](https://pokeapi.co/) and maps the relevant data to a Pokémon model.
- **Main Page**: Displays fetched Pokémon in a custom card format within a ListView. A button allows users to load 20 more Pokémon from the API.
- **Pokémon Details Page**: When a Pokémon card is tapped, users are directed to a detailed page showing the Pokémon's image, basic statistics, and a button to take a photo.
- **Image Capture**: Users can take a photo of their Pokémon, which will be displayed the next time the details page is opened.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (e.g., Android Studio, VS Code)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/pokemon-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd pokemon-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. **Splash Screen**: Launch the app to see the splash screen.
2. **Fetching Pokémon**: The app will automatically fetch 20 Pokémon from the PokeAPI.
3. **Main Page**: Scroll through the list of Pokémon displayed in custom cards. Tap the button to load 20 more Pokémon.
4. **Viewing Details**: Tap on a Pokémon card to view its details, including a picture and basic stats.
5. **Taking Photos**: Press the photo button to capture an image of the Pokémon. This image will be displayed the next time you access the details page.


# PlanIt

PlanIt is an iOS app I built for UNC AppTeam's bootcamp final project. It uses SwiftUI, MapKit, and the TripAdvisor Content API to let you search places, view details, and put together an itinerary on a map.

<img width="275" height="500" alt="image" src="https://github.com/user-attachments/assets/0cbf74e3-3df1-4271-a237-ff074f8c9f1a" /> <img width="275" height="500" alt="image" src="https://github.com/user-attachments/assets/3e5088ba-c691-4c7c-8ee6-c97569a957d4" /> <img width="275" height="500" alt="image" src="https://github.com/user-attachments/assets/063be4f5-b45f-4bd9-8d01-ad66c9c5a957" />

## Features

- Interactive map that shows planner items as pins using MapKit
- Search via TripAdvisor's API by query and category, with a button to add results straight to the planner
- Details view for each location with name, address, rating, hours, description, and photos, plus a button to add the location to the planner with coordinates
- Tabbed layout with Home for the editable planner list and Search for the API-powered search view

## Challenges

- Getting the TripAdvisor API key to work with IP restrictions was frustrating, and I want to look into how to expand usage
- Async/await state in SwiftUI was harder to manage than expected while fetching data
- TripAdvisor's search only does keyword matching, so relevance and context aren't great
- Mapping API results into `plannerItem` with coordinates and optional fields took some work
- Making SwiftUI layouts (scroll views, bottom sheets, tab views) feel consistent took a few passes

## Future additions

- More time ranges to pick from
- Reviews, nearby attractions, and restaurants for richer planning, or possibly switching to Google Maps
- Offline caching for planner items and details
- Draggable pins, route visualization, and clustering for multiple items
- Nicer styling, animations, and accessibility
- Export itineraries as text, PDF, or a shareable link

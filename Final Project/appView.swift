//
//  maps.swift
//  Final Project
//
//  Created by aakesh y on 11/30/25.
//

import MapKit
import SwiftUI


struct MapView: View {
    @State private var isSheetPresented = true
    @State private var plannerList: [plannerItem] = []
    
    var body: some View {
        let defaultCoordinate = CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558)
        ZStack {
            Map(interactionModes: .all) {
                ForEach(plannerList) { location in
                    
                    if let coordinate = location.coordinate {
                        Marker(location.event.name ?? "Event", coordinate: coordinate)
                    
                    }
                }
            }
            .ignoresSafeArea()
            
            .sheet(isPresented: $isSheetPresented) {
                TabView {
                    HomePage(plannerList: $plannerList)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    APIView(plannerList: $plannerList)
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    //                Tab("Home", systemImage: "house") {
                    //                    HomePage(plannerList: $plannerList)
                    //                }
                    //                Tab("Search", systemImage: "magnifyingglass") {
                    //                    APIView(plannerList: $plannerList)
                    //                }
                }
                .presentationDetents([.height(250), .large])
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled)
                
                
            }
        }
        
        
    }
}
    


#Preview {
    MapView()
}

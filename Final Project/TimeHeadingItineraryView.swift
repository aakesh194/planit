//
//  TimeHeadingItineraryView.swift
//  Final Project
//
//  Created by aakesh y on 11/18/25.
//


import SwiftUI

struct ModernItineraryView: View {
    @State private var dayPlan: [ItineraryItem] = [
        ItineraryItem(time: "9:00 AM", name: "Breakfast at Cafe"),
        ItineraryItem(time: "10:30 AM", name: "Visit Museum"),
        ItineraryItem(time: "1:00 PM", name: "Lunch at Restaurant")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(dayPlan) { item in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.time)
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(item.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        // modern translucent card effect
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Day 1 Itinerary")
    }
}

struct ItineraryItem: Identifiable {
    let id = UUID()
    let time: String
    let name: String
}

#Preview {
    ModernItineraryView()
}

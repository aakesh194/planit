//
//  HomePage.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//


//
//  main.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//

struct plannerItem: Identifiable {
    var id: UUID = UUID()
    let time: String
    let event: String
}



import SwiftUI

struct HomePage: View {
    var tripTitle: String
    @State private var itemTime = "9AM"
    @State private var plannerList: [plannerItem] = []
    
    var body: some View {
        NavigationStack {
            ForEach(plannerList) { item in
                List {
                    Section {
                        Text(item.event)
                        
                    } header: {
                        Text(item.time)
                            .fontWeight(.semibold)
                    }
                }
            }
            Text("")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        plannerList.append(plannerItem(time: itemTime, event: tripTitle))
                        
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .frame(width: 35, height: 35)
                        
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .clipShape(Circle())
                    }
                }
            }
            .navigationTitle(tripTitle)
        }
        
    }
}


#Preview {
    HomePage(tripTitle: "br")
}

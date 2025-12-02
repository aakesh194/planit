//
//  HomePage.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//
import MapKit

struct plannerItem: Identifiable {
    var id: UUID = UUID()
    var time: String
    var event: Location
    var coordinate: CLLocationCoordinate2D? = nil
}



import SwiftUI
import BottomSheet

struct HomePage: View {
    @State private var addItem: Bool = false
    @State private var time: String = ""
    @State private var name: String = ""
    @Binding var plannerList: [plannerItem]
    
    
    
    
    var body: some View{
        NavigationStack {
            
            List($plannerList, editActions: .move) { $item in
                NavigationStack {
                    Text(item.time)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(item.event.name ?? "bruh")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                // navigationTitle("Trip")
            }
            
            
            
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        addItem = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .frame(width: 35, height: 35)
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .clipShape(Circle())
                            .padding(.top)
                            .padding(.horizontal)
                    }
                    
                    EditButton()
                        .padding()
                }
            }
        }

        
        
        
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarTrailing) {
        //                Button {
        //                    addItem = true
        //                } label: {
        //                    Image(systemName: "plus")
        //                        .bold()
        //                        .frame(width: 35, height: 35)
        //
        //                        .background(Color.blue)
        //                        .foregroundStyle(Color.white)
        //                        .clipShape(Circle())
        //                }
        //            }
        
        
        .sheet(isPresented: $addItem) {
            // TODO: Add remaining binding
            VStack {
                TextField("Time", text: $time)
                    .padding()
                TextField("Name", text: $name)
                    .padding()
                
                Button {
                    plannerList.append(plannerItem(time: time, event: Location(
                        location_id: nil,
                        name: name,
                        address_obj: nil,
                        description: nil,
                        web_url: nil,
                        email: nil,
                        phone: nil,
                        rating: nil,
                        rating_image_url: nil,
                        hours: nil,
                        latitude: nil,
                        longitude: nil
                    )))
                    
                    addItem = false
                    print(plannerList)
                }
                label: {
                    Text("Enter")
                }
            }
        }
    }
    
}
                



#Preview {
   //HomePage(plannerList: plannerList)
}

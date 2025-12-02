//
//  api.swift
//  Final Project
//
//  Created by aakesh y on 11/13/25.
//

import Foundation
import SwiftUI

func SearchService(searchQuery: String) async throws -> [Location] {
    let url = URL(string: "https://api.content.tripadvisor.com/api/v1/location/search?key=\(APIKey)&searchQuery=\(searchQuery)")!
        
    let (data, _) = try await URLSession.shared.data(from: url)
    print(String(decoding: data, as: UTF8.self))
    let decoded = try JSONDecoder().decode(Search.self, from: data)

    return decoded.data
        
}


struct APIView: View {
    @State private var searchQuery = ""
    @State private var searchResult: [Location]? = nil
    @Binding var plannerList: [plannerItem]

    
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        Spacer()
                        TextField("Search", text: $searchQuery)
                        Button("Enter") {
                            Task {
                                await getSearches()
                            }
                        }
                        .bold()
                        .font(.system(size: 20))
                        Spacer()
                        
                    }
                    .padding()
                }
                List {
                    Section {
                        if let searchResult = searchResult {
                            ForEach(searchResult, id: \.location_id) { result in
                                VStack {
                                    NavigationLink {
                                        detailsView(location: result.location_id ?? "No ID", plannerList: $plannerList)
                                        
                                    }
                                    label: {
                                        VStack (alignment: .leading) {
                                            Text(result.name ?? "No ID")
                                                .bold()
                                            Text(result.address_obj?.address_string ?? "No Address")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    
}
    
    func getSearches() async {
        do {
            let searches = try await SearchService(searchQuery: searchQuery)
            searchResult = searches
            print(searches)
        }
        catch {
            print(error)
        }
    }
}


#Preview {
    //APIView(plannerList: )
}

//
//  related.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//
import SwiftUI
import SVGView

func DetailsService(locationID: String) async throws -> Location {
    let url = URL(string: "https://api.content.tripadvisor.com/api/v1/location/\(locationID)/details?key=\(APIKey)")!
        
    let (data, _) = try await URLSession.shared.data(from: url)
    print(String(decoding: data, as: UTF8.self))
    let decoded = try JSONDecoder().decode(Location.self, from: data)

    return decoded
}

func ImageService(locationID: String) async throws -> ImageSearch {
    let url = URL(string: "https://api.content.tripadvisor.com/api/v1/location/\(locationID)/photos?key=\(APIKey)")!
        
    let (data, _) = try await URLSession.shared.data(from: url)
    print(String(decoding: data, as: UTF8.self))
    let decoded = try JSONDecoder().decode(ImageSearch.self, from: data)

    return decoded
}

struct detailsView: View {
    let location: String
    @State private var searchResult: Location? = nil
    @State private var imageResult: ImageSearch? = nil
    
    var body: some View {

            VStack (alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let imageResult = imageResult {
                        ForEach(imageResult.data, id: \.id) { result in
                            AsyncImage(url: URL(string: result.images?.small.url ?? ""))
                                .scaledToFit()
                                .frame(width: 150, height: 200)
                            
                        }
                    }
                }
                .padding(.bottom)
            }
        

            Text(searchResult?.name ?? "No Name")
                .bold()
                //.frame(width: 300)
                //.padding(.horizontal, -175)
                .font(.title)
                .padding(2)
                
            Text(searchResult?.address_obj?.address_string ?? "Unknown Address")
                //.frame(width: 200)
                .padding(.bottom, 10)
                //.padding(.horizontal, -175)
            //Text("\(searchResult?.address_obj?.street1 ?? ""), \(searchResult?.address_obj?.city ?? "")")
            HStack {
                Text(searchResult?.rating ?? "No ratings yet")
                    .bold()
                
                if let urlString = searchResult?.rating_image_url,
                   let url = URL(string: urlString) {
                    SVGView(contentsOf: url)
                        .frame(width: 100, height: 20)
                }
            }
            //.padding(.horizontal, -175)
            .padding(.bottom, 10)
            
            VStack (alignment: .leading) {
                if let days = searchResult?.hours?.weekday_text {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                    }
                }
            }
            .padding(.vertical, 10)
           // .padding(.horizontal, -175)

            Spacer()
            Text(searchResult?.description ?? "")
                .font(.caption)
            Spacer()
        }
        .padding(.horizontal, 20)
        
            .onAppear {
                Task {
                    await getSearches()
                    await getImages()
                }
            }
    }
        
    
    func getSearches() async {
        do {
            let searches = try await DetailsService(locationID: location)
            searchResult = searches
            print(searches)

        }
        catch {
            print(error)
        }
    }
    
    func getImages() async {
        do {
            let searches = try await ImageService(locationID: location)
            imageResult = searches
            print(searches)
        }
        catch {
            print(error)
        }
    }
}

#Preview {
    detailsView(location: "460221")
}

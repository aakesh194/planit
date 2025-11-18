//
//  Location.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//

struct Location: Codable {
    let location_id: String?
    let name: String?
    let address_obj: Address?
    let description: String?
    let web_url: String?
    let email: String?
    let phone: String?
    let rating: String?
    let rating_image_url: String?
    let hours: Hours?
}

struct Hours: Codable {
    let weekday_text: [String]?
}


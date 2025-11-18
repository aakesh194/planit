//
//  Photos.swift
//  Final Project
//
//  Created by aakesh y on 11/17/25.
//

struct Photo: Codable {
    let id: Int
    let images: Images?
}

struct Images: Codable {
    let small: ImageURL
}

struct ImageURL: Codable {
    let url: String
}

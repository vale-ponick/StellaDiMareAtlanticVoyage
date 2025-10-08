//
//  mapPoint.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// Задача: Создать структуру для хранения координат с форматированным выводом

struct MapPoint {
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinatesString: String {
        return "\(String(format: "%.2f", latitude))°, \(String(format: "%.2f", longitude))°"
    }
}

let startPoint = MapPoint(
    name: "Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия",
    latitude: -25.45,
    longitude: -48.35
)

print("📍 \(startPoint.name)")
print("Координаты: \(startPoint.coordinatesString)")




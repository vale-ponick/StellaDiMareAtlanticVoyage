//
//  GeoFormatters.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// ЗАДАЧА: Форматирование координат для читаемого вывода

func formatCoordinate(_ coordinate: Double, isLatitude: Bool) -> String {
    let direction = isLatitude ?
        (coordinate >= 0 ? "с.ш." : "ю.ш.") :
        (coordinate >= 0 ? "в.д." : "з.д.")
    
    let absoluteValue = abs(coordinate)
    return "\(String(format: "%.2f", absoluteValue))° \(direction)"
}

func formatPointInfo(_ point: MapPoint) -> String {
    let lat = formatCoordinate(point.latitude, isLatitude: true)
    let lon = formatCoordinate(point.longitude, isLatitude: false)
    return "\(point.name): \(lat), \(lon)"
}

// ПРИМЕР ИСПОЛЬЗОВАНИЯ:

let point = MapPoint(name: "Бразилия", latitude: -25.45, longitude: -48.35)
let formatted = formatPointInfo(point)

print("📍 Форматированные координаты:")
print(formatted)

//
//  distanceCalculator.swift.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// страница блокнота: Маршрут через Атлантику

// ЗАДАЧА: Создать маршрут Бразилия-Франция 

func distanceBetween(_ point1: MapPoint, _ point2: MapPoint) -> Double {
    let earthRadius = 6371.0
    
    let lat1 = point1.latitude * .pi / 180
    let lon1 = point1.longitude * .pi / 180
    let lat2 = point2.latitude * .pi / 180
    let lon2 = point2.longitude * .pi / 180
    
    let dLat = lat2 - lat1
    let dLon = lon2 - lon1
    
    let a = sin(dLat/2) * sin(dLat/2) +
            cos(lat1) * cos(lat2) *
            sin(dLon/2) * sin(dLon/2)
    let c = 2 * atan2(sqrt(a), sqrt(1-a))
    
    return earthRadius * c
}

let point1 = MapPoint(name: "Точка A", latitude: -25.45, longitude: -48.35)
let point2 = MapPoint(name: "Точка B", latitude: -23.50, longitude: -48.35)

let distance = distanceBetween(point1, point2)
print("📏 Расстояние: \(String(format: "%.0f", distance)) км")

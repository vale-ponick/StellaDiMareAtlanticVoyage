//
//  displayRouteDistances.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation
// Функция для вывода расстояний между точками
func printRouteDistances(_ route: [MapPoint]) {
    print("📏 РАССТОЯНИЯ МЕЖДУ ТОЧКАМИ:")
    
    var totalDistance = 0.0
    for i in 0..<route.count - 1 {
        let distance = distanceBetween(route[i], route[i + 1])
        totalDistance += distance
        print("\(i + 1) → \(i + 2): \(String(format: "%.0f", distance)) км")
    }
    
    print("📊 СУММАРНОЕ РАССТОЯНИЕ: \(String(format: "%.0f", totalDistance)) км")
}

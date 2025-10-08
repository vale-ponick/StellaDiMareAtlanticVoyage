//
//  routeAnalisis.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

func analyzeRoute() {
    for (index, point) in route.enumerated() {
        print("\(index + 1). \(point.name) - \(point.latitude), \(point.longitude)") // Добавлена закрывающая скобка
    }

    for i in 0..<route.count - 1 {
        let distance = distanceBetween(route[i], route[i + 1]) // Убраны point1:, point2:
        print("\(i + 1) → \(i + 2): \(Int(distance)) км")
    }

    var totalDistance = 0.0
    for i in 0..<route.count - 1 {
        totalDistance += distanceBetween(route[i], route[i + 1]) // Убраны point1:, point2:
    }
    print("Всего: \(Int(totalDistance)) км")
}

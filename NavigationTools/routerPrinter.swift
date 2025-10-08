//
//  routerPrinter.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// Функция для вывода всех точек маршрута
func printRoute(_ route: [MapPoint], title: String = "ТОЧКИ МАРШРУТА") {
    print("🗺️ \(title):")
   
    for (index, point) in route.enumerated() {
        print("\(index + 1). \(point.name)")
        print("   Координаты: \(point.coordinatesString)")
        if index < route.count - 1 {
            print()
        }
    }
}

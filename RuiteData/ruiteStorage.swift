//
//  ruiteStorage.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// RouteStorage.swift
import Foundation

// ЗАДАЧА: Хранение данных маршрута Бразилия-Африка

struct Route {
    let name: String
    let points: [MapPoint]
    
    func display() {
        print("🗺️ \(name):")
        for (index, point) in points.enumerated() {
            print("\(index + 1). \(point.name)")
            print("   Координаты: \(point.latitude), \(point.longitude)")
        }
    }
}

// ЗАДАЧА: Хранение данных маршрута Бразилия-Африка
let atlanticRoute = Route(
    name: "Маршрут через Атлантику",
    points: [
        MapPoint(name: "Вилла near Куритибы", latitude: -25.45, longitude: -48.35),
        MapPoint(name: "Поворот на север", latitude: -32.65, longitude: -48.35),
        MapPoint(name: "Near тропика Козерога", latitude: -24.4, longitude: -48.35),
        MapPoint(name: "Северное полушарие", latitude: 27.79, longitude: -48.35),
        MapPoint(name: "Подход к Африке", latitude: 28.54, longitude: -12.52),
        MapPoint(name: "Порт Дахла", latitude: 23.70, longitude: -15.93)
    ]
)

// Главная функция
func main() {
    atlanticRoute.display()
}

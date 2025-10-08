//
//  main.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// ПРОЕКТ-БЛОКНОТ
// скопируй код из нужных файлов || используй CompleteBrazilToFrance.swift

/* 📁 NauticalNotebook/
 ├── 📄 Main.swift (пустой)
 ├── 📁 Examples/
 │   └── 📄 CompleteBrazilFrance.swift
 ├── 📄 MapPoint.swift
 ├── 📄 NavigationCalculator.swift
 ├── 📄 DistanceCalculator.swift
 ├── 📄 BrazilToFranceRoute.swift
 ├── 📄 RoutePrinter.swift
 ├── 📄 DistancePrinter.swift
 ├── 📄 RouteStatistics.swift
 ├── 📄 FuelCalculator.swift
 ├── 📄 TimeCalculator.swift
 └── 📄 SegmentTimeCalculator.swift */

struct MapPoint {
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinatesString: String {
        return "\(String(format: "%.2f", latitude))°, \(String(format: "%.2f", longitude))°"
    }
}

func calculateNewPoint(from start: MapPoint, distanceKm: Double, courseDegrees: Double, name: String) -> MapPoint {
    let earthRadiusKm = 6371.0
    
    let distanceRadians = distanceKm / earthRadiusKm
    let courseRadians = courseDegrees * .pi / 180.0
    
    let startLatRad = start.latitude * .pi / 180.0
    let startLonRad = start.longitude * .pi / 180.0
    
    let newLatRad = asin(
        sin(startLatRad) * cos(distanceRadians) +
        cos(startLatRad) * sin(distanceRadians) * cos(courseRadians)
    )
    
    let newLonRad = startLonRad + atan2(
        sin(courseRadians) * sin(distanceRadians) * cos(startLatRad),
        cos(distanceRadians) - sin(startLatRad) * sin(newLatRad)
    )
    
    let newLat = newLatRad * 180.0 / .pi
    let newLon = newLonRad * 180.0 / .pi
    
    return MapPoint(name: name, latitude: newLat, longitude: newLon)
}

// Создаем стартовую точку
let startPoint = MapPoint(
    name: "Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия",
    latitude: -25.45,
    longitude: -48.35
)

// Рассчитываем точки маршрута
let point2 = calculateNewPoint(
    from: startPoint,
    distanceKm: 800,
    courseDegrees: 180,
    name: "Южная Атлантика"
)

let point3 = calculateNewPoint(
    from: point2,
    distanceKm: 80 * 14,
    courseDegrees: 0,
    name: "Возле тропика Козерога"
)

let point4 = calculateNewPoint(
    from: point3,
    distanceKm: 70 * 80,
    courseDegrees: 0,
    name: "Северная Атлантика - переход в Сев.полушарие"
)

let point5 = calculateNewPoint(
    from: point4,
    distanceKm: 3500,
    courseDegrees: 80,
    name: "Южное Марокко - 200 км севернее Мыса Бланко"
)

let point6 = MapPoint(
    name: "Африканское побережье, порт Дахла",
    latitude: 23.70,
    longitude: -15.93
)

let point7 = MapPoint(
    name: "Франция, пустынная бухта в Бретани",
    latitude: 48.70,
    longitude: -3.98
)

// Создаем маршрут
let route = [startPoint, point2, point3, point4, point5, point6, point7]

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

// ВЫВОД МАРШРУТА
print("🗺️ ПОЛНЫЙ МАРШРУТ БРАЗИЛИЯ-ФРАНЦИЯ")

for (index, point) in route.enumerated() {
    print("\(index + 1). \(point.name) - \(point.coordinatesString)")
}

// РАССТОЯНИЯ
print("📏 РАССТОЯНИЯ МЕЖДУ ТОЧКАМИ")

var totalDistance = 0.0
for i in 0..<route.count - 1 {
    let distance = distanceBetween(route[i], route[i + 1])
    totalDistance += distance
    print("\(i + 1) → \(i + 2): \(String(format: "%.0f", distance)) км")
}

print("\n📊 СУММАРНОЕ РАССТОЯНИЕ: \(String(format: "%.0f", totalDistance)) км")

// СТАТИСТИКА
print("📊 СТАТИСТИКА МАРШРУТА")

print("Всего точек: \(route.count)")
print("Старт: \(route.first!.name)")
print("Финиш: \(route.last!.name)")

if let southernmost = route.min(by: { $0.latitude < $1.latitude }) {
    print("Самая южная точка: \(southernmost.name) (\(String(format: "%.2f", southernmost.latitude))°)")
}
if let northernmost = route.max(by: { $0.latitude < $1.latitude }) {
    print("Самая северная точка: \(northernmost.name) (\(String(format: "%.2f", northernmost.latitude))°)")
}

// РАСЧЕТЫ ТОПЛИВА И ВРЕМЕНИ
print("⛽ РАСЧЕТ ТОПЛИВА И ВРЕМЕНИ")

let averageSpeedKmh = 80.0
let fuelConsumptionPerHour = 25.0
let fuelPricePerLiter = 1.2

let totalHours = totalDistance / averageSpeedKmh
let totalLiters = totalHours * fuelConsumptionPerHour
let totalCost = totalLiters * fuelPricePerLiter
let days = Int(totalHours) / 24
let hours = Int(totalHours) % 24

print("Расход топлива: \(String(format: "%.0f", totalLiters)) литров")
print("Стоимость топлива: \(String(format: "%.0f", totalCost)) у.е.")
print("Общее время: \(String(format: "%.1f", totalHours)) часов")
print("Это: \(days) дней \(hours) часов")

// ВРЕМЯ ПО ОТРЕЗКАМ
print("⏱️ ВРЕМЯ ПО ОТРЕЗКАМ")

for i in 0..<route.count - 1 {
    let distance = distanceBetween(route[i], route[i + 1])
    let hours = distance / 80.0
    print("\(i + 1). \(route[i].name) → \(route[i + 1].name)")
    print("   Расстояние: \(String(format: "%.0f", distance)) км")
    print("   Время: \(String(format: "%.1f", hours)) часов")
}

//
//  completeBrazilToFrance.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.


//  Examples/CompleteBrazilFrance.swift
//  ПОЛНЫЙ ПРИМЕР: Маршрут Бразилия-Франция
//  Скопируй этот код в main.swift для запуска

import Foundation

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
/* 🗺️ ПОЛНЫЙ МАРШРУТ БРАЗИЛИЯ-ФРАНЦИЯ
 1. Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия - -25.45°, -48.35°
 2. Южная Атлантика - -32.64°, -48.35°
 3. Возле тропика Козерога - -22.57°, -48.35°
 4. Северная Атлантика - переход в Сев.полушарие - 27.79°, -48.35°
 5. Южное Марокко - 200 км севернее Мыса Бланко - 28.54°, -12.52°
 6. Африканское побережье, порт Дахла - 23.70°, -15.93°
 7. Франция, пустынная бухта в Бретани - 48.70°, -3.98°
 📏 РАССТОЯНИЯ МЕЖДУ ТОЧКАМИ
 1 → 2: 800 км
 2 → 3: 1120 км
 3 → 4: 5600 км
 4 → 5: 3500 км
 5 → 6: 637 км
 6 → 7: 2971 км

 📊 СУММАРНОЕ РАССТОЯНИЕ: 14628 км
 📊 СТАТИСТИКА МАРШРУТА
 Всего точек: 7
 Старт: Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия
 Финиш: Франция, пустынная бухта в Бретани
 Самая южная точка: Южная Атлантика (-32.64°)
 Самая северная точка: Франция, пустынная бухта в Бретани (48.70°)
 ⛽ РАСЧЕТ ТОПЛИВА И ВРЕМЕНИ
 Расход топлива: 4571 литров
 Стоимость топлива: 5486 у.е.
 Общее время: 182.9 часов
 Это: 7 дней 14 часов
 ⏱️ ВРЕМЯ ПО ОТРЕЗКАМ
 1. Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия → Южная Атлантика
    Расстояние: 800 км
    Время: 10.0 часов
 2. Южная Атлантика → Возле тропика Козерога
    Расстояние: 1120 км
    Время: 14.0 часов
 3. Возле тропика Козерога → Северная Атлантика - переход в Сев.полушарие
    Расстояние: 5600 км
    Время: 70.0 часов
 4. Северная Атлантика - переход в Сев.полушарие → Южное Марокко - 200 км севернее Мыса Бланко
    Расстояние: 3500 км
    Время: 43.7 часов
 5. Южное Марокко - 200 км севернее Мыса Бланко → Африканское побережье, порт Дахла
    Расстояние: 637 км
    Время: 8.0 часов
 6. Африканское побережье, порт Дахла → Франция, пустынная бухта в Бретани
    Расстояние: 2971 км
    Время: 37.1 часов*/

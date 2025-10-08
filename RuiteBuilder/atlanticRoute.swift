//
//  atlanticRoute.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// страница блокнота: Построение маршрута

// ЗАДАЧА: Построить маршрут Бразилия-Франция 

print("🧱 ПОСТРОЕНИЕ МАРШРУТА БРАЗИЛИЯ-ФРАНЦИЯ")

// 1. Создаем стартовую точку
let startPoint = MapPoint(
    name: "Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия",
    latitude: -25.45,
    longitude: -48.35
)

print("📍 Точка 1: \(startPoint.name)")
print("   Координаты: \(startPoint.coordinatesString)")

// 2. РАСЧИТЫВАЕМ point2 (800 км на юг)
let point2 = calculateNewPoint(
    from: startPoint,
    distanceKm: 800,
    courseDegrees: 180,
    name: "Южная Атлантика"
)

print("📍 Точка 2: \(point2.name)")
print("   Координаты: \(point2.coordinatesString)")

// 3. РАСЧИТЫВАЕМ point3 (1120 км на север)
let point3 = calculateNewPoint(
    from: point2,
    distanceKm: 80 * 14,
    courseDegrees: 0,
    name: "Возле тропика Козерога"
)

print("📍 Точка 3: \(point3.name)")
print("   Координаты: \(point3.coordinatesString)")

// ПРОВЕРКА: Сравнение с тропиком Козерога
let tropicOfCapricorn = -23.5
let difference = abs(point3.latitude - tropicOfCapricorn)
print("   📍 Отклонение от тропика Козерога: \(String(format: "%.1f", difference))°")

// 4. РАСЧИТЫВАЕМ point4 (5600 км на север)
let point4 = calculateNewPoint(
    from: point3,
    distanceKm: 70 * 80,
    courseDegrees: 0,
    name: "Северная Атлантика - переход в Сев.полушарие"
)

print("📍 Точка 4: \(point4.name)")
print("   Координаты: \(point4.coordinatesString)")

// 5. РАСЧИТЫВАЕМ point5 (3500 км на восток)
let point5 = calculateNewPoint(
    from: point4,
    distanceKm: 3500,
    courseDegrees: 80,
    name: "Южное Марокко - 200 км севернее Мыса Бланко"
)

print("📍 Точка 5: \(point5.name)")
print("   Координаты: \(point5.coordinatesString)")

// 6. СОЗДАЕМ point6 (порт Дахла)
let point6 = MapPoint(
    name: "Африканское побережье, порт Дахла",
    latitude: 23.70,
    longitude: -15.93
)

print("📍 Точка 6: \(point6.name)")
print("   Координаты: \(point6.coordinatesString)")

// 7. СОЗДАЕМ point7 (Бретань)
let point7 = MapPoint(
    name: "Франция, пустынная бухта в Бретани",
    latitude: 48.70,
    longitude: -3.98
)

print("📍 Точка 7: \(point7.name)")
print("   Координаты: \(point7.coordinatesString)")

// ФИНАЛЬНЫЙ МАРШРУТ
let route: [MapPoint] = [
    startPoint, point2, point3, point4, point5, point6, point7
]

print("\n✅ МАРШРУТ ПОСТРОЕН!")
print("   Всего точек: \(route.count)")
print("   Старт: \(route.first!.name)")
print("   Финиш: \(route.last!.name)")

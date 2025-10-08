//
//  сoordinateCalculator.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

// страница блокнота: Калькулятор координат

// ЗАДАЧА: Рассчитать новую точку по расстоянию и курсу
// РЕШЕНИЕ: Функция calculateNewPoint с использованием сферической геометрии



//  NavigationCalculator.swift
//  Математические расчеты навигации

import Foundation

// Расчет новой точки по расстоянию и курсу
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

// Расчет расстояния между точками
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



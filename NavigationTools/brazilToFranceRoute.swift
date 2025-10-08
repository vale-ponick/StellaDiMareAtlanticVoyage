//
//  brazilToFranceRoute.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

//  BrazilToFranceRoute.swift
//  Данные маршрута Бразилия-Франция

func createBrazilToFranceRoute() -> [MapPoint] {
    let startPoint = MapPoint(
        name: "Вилла возле г.Куритибы,побережье залива Паранагуа, Бразилия",
        latitude: -25.45,
        longitude: -48.35
    )

    let point2 = calculateNewPoint( // // Рассчитанные точки (математически)
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

    let point6 = MapPoint( // // Реальные точки (жестко заданные)
        name: "Африканское побережье, порт Дахла",
        latitude: 23.70,
        longitude: -15.93
    )

    let point7 = MapPoint(
        name: "Франция, пустынная бухта в Бретани",
        latitude: 48.70,
        longitude: -3.98
    )
    
    return [startPoint, point2, point3, point4, point5, point6, point7]
}

// let route = createBrazilToFranceRoute()

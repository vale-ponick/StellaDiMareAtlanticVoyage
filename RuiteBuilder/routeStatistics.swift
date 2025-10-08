//
//  routeStatistics.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation
//  Статистика маршрута

func printRouteStatistics(_ route: [MapPoint]) {
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
}

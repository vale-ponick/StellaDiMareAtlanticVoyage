//
//  fuelCalculator.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.

//  Расчет топлива и времени

import Foundation

func calculateFuelAndTime(for route: [MapPoint]) {
    let averageSpeedKmh = 80.0
    let fuelConsumptionPerHour = 25.0
    let fuelPricePerLiter = 1.2
    
    var totalDistance = 0.0
    for i in 0..<route.count - 1 {
        totalDistance += distanceBetween(route[i], route[i + 1])
    }
    
    let totalHours = totalDistance / averageSpeedKmh
    let totalLiters = totalHours * fuelConsumptionPerHour
    let totalCost = totalLiters * fuelPricePerLiter
    let days = Int(totalHours) / 24
    let hours = Int(totalHours) % 24
    
    print("⛽ РАСЧЕТ ТОПЛИВА И ВРЕМЕНИ")
    print("Расход топлива: \(String(format: "%.0f", totalLiters)) литров")
    print("Стоимость топлива: \(String(format: "%.0f", totalCost)) у.е.")
    print("Общее время: \(String(format: "%.1f", totalHours)) часов")
    print("Это: \(days) дней \(hours) часов")
}

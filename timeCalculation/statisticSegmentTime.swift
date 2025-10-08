//
//  statisticSegmentTime.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//

import Foundation

func printSegmentTimes(_ route: [MapPoint]) {
    print("⏱️ ВРЕМЯ ПО ОТРЕЗКАМ")
    
    for i in 0..<route.count - 1 {
        let distance = distanceBetween(route[i], route[i + 1])
        let hours = distance / 80.0
        print("\(i + 1). \(route[i].name) → \(route[i + 1].name)")
        print("   Расстояние: \(String(format: "%.0f", distance)) км")
        print("   Время: \(String(format: "%.1f", hours)) часов")
    }
}

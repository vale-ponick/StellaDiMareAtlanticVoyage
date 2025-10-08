//
//  nauticalConverter.swift
//  NauticalCalcProject
//
//  Created by Валерия Пономарева on 08.10.2025.
//
import Foundation

// ЗАДАЧА: Конвертер морских миль в километры

func nauticalMilesToKm(nauticalMiles: Double) -> Double {
    return nauticalMiles * 1.852
}

func kmToNauticalMiles(km: Double) -> Double {
    return km / 1.852
}

// ПРИМЕР ИСПОЛЬЗОВАНИЯ:
let miles = 100.0
let kilometers = nauticalMilesToKm(nauticalMiles: miles)

print("🌊 Конвертация морских миль:")
print("\(miles) морских миль = \(String(format: "%.1f", kilometers)) км")

let kmBack = kmToNauticalMiles(km: kilometers)
print("Обратно: \(String(format: "%.1f", kilometers)) км = \(String(format: "%.1f", kmBack)) морских миль")

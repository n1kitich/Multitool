//
//  Double + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

public enum RoundingPrecision {
    case ones
    case tenths
    case hundredths
    case thousands
}

public func preciseRound(_ value: Double, precision: RoundingPrecision = .ones) -> Double {
    switch precision {
    case .ones:
        return round(value)
    case .tenths:
        return round(value * 10) / 10.0
    case .hundredths:
        return round(value * 100) / 100.0
    case .thousands:
        return round(value * 1000) / 1000.0
    }
}

public func preciseRound(_ value: Double, precisionDouble: Double = 10) -> Double {
    return round(value * precisionDouble) / precisionDouble
}

//
//  MotionSensor.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import Foundation

enum MotionSensor: String {
    case acceleration = "Acceleration"
    case gyroscope = "Rotation rate"
    case magneticField = "Magnetic field"
    case attitude = "Motion attritude"
    case gravity = "Gravity"
    
    var firstIndicatorName: String {
        switch self {
        case .attitude:
            return "Pitch"
        default:
            return "Axis X"
        }
    }
    
    var secondIndicatorName: String {
        switch self {
        case .attitude:
            return "Roll"
        default:
            return "Axis Y"
        }
    }
    
    var thirdIndicatorName: String {
        switch self {
        case .attitude:
            return "Yaw"
        default:
            return "Axis Z"
        }
    }
}

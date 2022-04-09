//
//  MotionInfoViewCellViewModelType.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import CoreMotion

protocol MotionInfoViewCellViewModelType {
    var motionSensor: MotionSensor { get set }
    var title: String  { get }
    var firstFieldName: String { get }
    var secondFieldName: String  { get }
    var thirdFieldName: String  { get }
}

class MotionInfoViewCellViewModel: MotionInfoViewCellViewModelType {
    private let deviceMotion: CMDeviceMotion?
    var motionSensor: MotionSensor = .acceleration
    
    init(deviceMotion: CMDeviceMotion?) {
        self.deviceMotion = deviceMotion
    }
    
    var title: String {
        return motionSensor.rawValue
    }
    
    var firstFieldName: String {
        return motionSensor.firstIndicatorName
    }
    
    var secondFieldName: String {
        return motionSensor.secondIndicatorName
    }
    
    var thirdFieldName: String {
        return motionSensor.thirdIndicatorName
    }
    
    var firstIndicator: String? {
        guard let deviceMotion = deviceMotion else { return nil}
        switch motionSensor {
        case .acceleration:
            let value = deviceMotion.userAcceleration.x
            return "\(preciseRound(value, precision: .thousands))"
        case .gyroscope:
            let value = deviceMotion.rotationRate.x
            return "\(preciseRound(value, precision: .thousands))"
        case .magneticField:
            let value = deviceMotion.magneticField.field.x
            return "\(preciseRound(value, precision: .thousands))"
        case .attitude:
            let value = deviceMotion.attitude.pitch
            return "\(preciseRound(value, precision: .thousands))"
        case .gravity:
            let value = deviceMotion.gravity.x
            return "\(preciseRound(value, precision: .thousands))"
        }
    }
    
    var secondIndicator: String? {
        guard let deviceMotion = deviceMotion else { return nil}
        switch motionSensor {
        case .acceleration:
            let value = deviceMotion.userAcceleration.y
            return "\(preciseRound(value, precision: .thousands))"
        case .gyroscope:
            let value = deviceMotion.rotationRate.y
            return "\(preciseRound(value, precision: .thousands))"
        case .magneticField:
            let value = deviceMotion.magneticField.field.y
            return "\(preciseRound(value, precision: .thousands))"
        case .attitude:
            let value = deviceMotion.attitude.roll
            return "\(preciseRound(value, precision: .thousands))"
        case .gravity:
            let value = deviceMotion.gravity.z
            return "\(preciseRound(value, precision: .thousands))"
        }
    }
    
    var thirdIndicator: String? {
        guard let deviceMotion = deviceMotion else { return nil}
        switch motionSensor {
        case .acceleration:
            let value = deviceMotion.userAcceleration.z
            return "\(preciseRound(value, precision: .thousands))"
        case .gyroscope:
            let value = deviceMotion.rotationRate.z
            return "\(preciseRound(value, precision: .thousands))"
        case .magneticField:
            let value = deviceMotion.magneticField.field.z
            return "\(preciseRound(value, precision: .thousands))"
        case .attitude:
            let value = deviceMotion.attitude.yaw
            return "\(preciseRound(value, precision: .thousands))"
        case .gravity:
            let value = deviceMotion.gravity.z
            return "\(preciseRound(value, precision: .thousands))"
        }
    }
}


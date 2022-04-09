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
        var value: Double = 0.0
        guard let deviceMotion = deviceMotion else { return "\(value)" }
        
        switch motionSensor {
        case .acceleration:
            value = deviceMotion.userAcceleration.x
        case .gyroscope:
            value = deviceMotion.rotationRate.x
        case .magneticField:
            value = deviceMotion.magneticField.field.x
        case .attitude:
            value = deviceMotion.attitude.pitch
        case .gravity:
            value = deviceMotion.gravity.x
        }
        return "\(preciseRound(value, precisionDouble: 10000))"
    }
    
    var secondIndicator: String? {
        var value: Double = 0.0
        guard let deviceMotion = deviceMotion else { return "\(value)" }
        
        switch motionSensor {
        case .acceleration:
            value = deviceMotion.userAcceleration.y
        case .gyroscope:
            value = deviceMotion.rotationRate.y
        case .magneticField:
            value = deviceMotion.magneticField.field.y
        case .attitude:
            value = deviceMotion.attitude.roll
        case .gravity:
            value = deviceMotion.gravity.z
        }
        return "\(preciseRound(value, precisionDouble: 10000))"
    }
    
    var thirdIndicator: String? {
        var value: Double = 0.0
        guard let deviceMotion = deviceMotion else { return "\(value)" }
        
        switch motionSensor {
        case .acceleration:
            value = deviceMotion.userAcceleration.z
        case .gyroscope:
            value = deviceMotion.rotationRate.z
        case .magneticField:
            value = deviceMotion.magneticField.field.z
        case .attitude:
            value = deviceMotion.attitude.yaw
        case .gravity:
            value = deviceMotion.gravity.z
        }
        return "\(preciseRound(value, precisionDouble: 10000))"
    }
}


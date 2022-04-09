//
//  CMMotionViewModel.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import CoreMotion

protocol CMMotionViewModelType {
    var deviceMotion: CMDeviceMotion? { get set }
    var numberOfRows: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MotionInfoViewCellViewModelType?
}

class CMMotionViewModel: CMMotionViewModelType {

    var deviceMotion: CMDeviceMotion?
    
    var numberOfRows: Int {
        return 5
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MotionInfoViewCellViewModelType? {
        let viewModel = MotionInfoViewCellViewModel(deviceMotion: deviceMotion)
        switch indexPath.row {
        case 0:
            viewModel.motionSensor = .acceleration
        case 1:
            viewModel.motionSensor = .gyroscope
        case 2:
            viewModel.motionSensor = .magneticField
        case 3:
            viewModel.motionSensor = .attitude
        default:
            viewModel.motionSensor = .gravity
        }
        return viewModel
    }
}

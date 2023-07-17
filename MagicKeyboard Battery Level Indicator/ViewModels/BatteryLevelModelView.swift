//
//  BatteryLevelModelView.swift
//  MagicKeyboard Battery Level Indicator
//
//  Created by Jordan Henrio on 2023/07/17.
//

import Foundation

class BatteryLevelVewModel: ObservableObject {
    var device: Device
    var batteryLevel: Int
    
    init(_ device: Device) {
        self.device = device

        if self.device.batteryLevel > 75 {
            self.batteryLevel = 100
        } else if self.device.batteryLevel > 50 {
            self.batteryLevel = 75
        } else if self.device.batteryLevel > 25 {
            self.batteryLevel = 50
        } else if self.device.batteryLevel > 18 {
            self.batteryLevel = 25
        } else {
            self.batteryLevel = 0
        }
    }
}

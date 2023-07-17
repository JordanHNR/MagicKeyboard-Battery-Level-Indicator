//
//  MagicKeyboard_Battery_Level_IndicatorApp.swift
//  MagicKeyboard Battery Level Indicator
//
//  Created by Jordan Henrio on 2023/07/17.
//

import SwiftUI

@main
struct Magic_Keyboard_Battery_IndicatorApp: App {
    @StateObject private var batteryLevel = BatteryLevelVewModel(Device(8199))

    var body: some Scene {
        let image_name : String = "battery.\(batteryLevel.batteryLevel)"
        MenuBarExtra("\(batteryLevel.batteryLevel)", systemImage: image_name) {
        }
    }
}

//
//  Device.swift
//  MagicKeyboard Battery Level Indicator
//
//  Created by Jordan Henrio on 2023/07/17.
//

import Foundation

final class Device : ObservableObject {
    var deviceId: Int
    var batteryLevel: Int = -1

    init(_ deviceId: Int) {
        self.deviceId = deviceId
        var serialPortIterator = io_iterator_t()
        var object : io_object_t
        let port: mach_port_t = kIOMainPortDefault
        let matchDict : CFDictionary
        let kernelResult : Int32

        // Look for the specified device in AppleDeviceManagementHIDEventService
        matchDict = IOServiceMatching("AppleDeviceManagementHIDEventService")
        kernelResult = IOServiceGetMatchingServices(port, matchDict, &serialPortIterator)
        if kernelResult == KERN_SUCCESS {
            repeat {
                object = IOIteratorNext(serialPortIterator)
                if object == deviceId, let percent = IORegistryEntryCreateCFProperty(object, "BatteryPercent" as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? Int {
                    self.batteryLevel = percent
                    }
                    IOObjectRelease(object)
            } while object != 0
        }
        IOObjectRelease(serialPortIterator)
    }
}

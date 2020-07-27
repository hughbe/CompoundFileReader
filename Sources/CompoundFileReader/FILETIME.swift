//
//  FILETIME.swift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 20/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import Foundation

public struct FILETIME: CustomStringConvertible {
    public let dwLowDateTime: UInt32
    public let dwHighDateTime: UInt32
    
    public var rawValue: UInt64 {
        return (UInt64(dwHighDateTime) << 32) + UInt64(dwLowDateTime)
    }
    
    public var date: Date {
        let windowsTicks: UInt64 = 10000000
        let secondsToUnixEpoch: UInt64 = 11644473600
        
        let rawValue = self.rawValue
        let seconds = rawValue / windowsTicks
        let unixTimestamp = seconds - secondsToUnixEpoch
        return Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    }
    
    public var description: String {
        return String(rawValue)
    }
}

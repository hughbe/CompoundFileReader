//
//  DataStream+FILETIME.swift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 24/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import DataStream

internal extension DataStream {
    mutating func readFILETIME() throws -> FILETIME {
        let low = try read(endianess: .littleEndian) as UInt32
        let high = try read(endianess: .littleEndian) as UInt32
        return FILETIME(dwLowDateTime: low, dwHighDateTime: high)
    }
}

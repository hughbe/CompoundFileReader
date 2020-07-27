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
        let low = try readUInt32()
        let high = try readUInt32()
        return FILETIME(dwLowDateTime: low, dwHighDateTime: high)
    }
}

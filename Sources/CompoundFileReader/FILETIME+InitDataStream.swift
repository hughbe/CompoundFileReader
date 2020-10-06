//
//  FILETIME+InitDataStream.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import WindowsDataTypes

internal extension FILETIME {
    init(dataStream: inout DataStream) throws {
        let dwLowDateTime: UInt32 = try dataStream.read(endianess: .littleEndian)
        let dwHighDateTime: UInt32 = try dataStream.read(endianess: .littleEndian)
        self.init(dwLowDateTime: dwLowDateTime, dwHighDateTime: dwHighDateTime)
    }
}

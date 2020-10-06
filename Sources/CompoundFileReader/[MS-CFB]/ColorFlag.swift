//
//  ColorFlag.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

/// Color Flag (1 byte): This field MUST be 0x00 (red) or 0x01 (black). All other values are not valid.
internal enum ColorFlag: UInt8 {
    /// red 0x00
    case red = 0x00
    
    /// black 0x01
    case black = 0x01
}

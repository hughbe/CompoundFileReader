
import XCTest
import CryptoKit
@testable import CompoundFileReader

final class CompoundFileReaderTests: XCTestCase {
    func testConstructor() throws {
        do {
            /* hughbe */
            let file = try CompoundFile(data: try getData(name: "VBA Project", fileExtension: "pps"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000240, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("PowerPoint Document", storage.children["PowerPoint Document"]!.name)
                XCTAssertEqual(0x000000000000A297, storage.children["PowerPoint Document"]!.count)
                XCTAssertEqual([0xA3, 0x4B, 0x87, 0xE2, 0x29, 0x01, 0x8B, 0xEF, 0xC5, 0x12, 0x04, 0xB5, 0xA5, 0x8F, 0x7D, 0xE3, 0xE3, 0xC8, 0x8C, 0xEF, 0xFF, 0x22, 0x08, 0xCA, 0x6A, 0x56, 0xF7, 0xF1, 0x96, 0xEF, 0xD9, 0x50], [UInt8](SHA256.hash(data: storage.children["PowerPoint Document"]!.data)))
                do {
                    var storage = storage.children["PowerPoint Document"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Current User", storage.children["Current User"]!.name)
                XCTAssertEqual(0x0000000000000020, storage.children["Current User"]!.count)
                XCTAssertEqual([0x5C, 0x79, 0x94, 0xAF, 0x67, 0xAF, 0x6C, 0x91, 0x9E, 0x04, 0x37, 0x89, 0xB0, 0x5D, 0x14, 0x52, 0x6A, 0xD7, 0x61, 0x13, 0xD3, 0xB5, 0x7D, 0x10, 0x12, 0x8C, 0x0B, 0xC9, 0x59, 0xD3, 0xD6, 0x27], [UInt8](SHA256.hash(data: storage.children["Current User"]!.data)))
                do {
                    var storage = storage.children["Current User"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x000000000000AA88, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xC8, 0xFE, 0x32, 0x5E, 0x07, 0xE0, 0x89, 0xF0, 0xE7, 0x27, 0x55, 0x2C, 0x54, 0x55, 0xA6, 0x85, 0x7B, 0xD4, 0xC3, 0xF6, 0xBF, 0x9E, 0xE9, 0xFA, 0x90, 0x71, 0x0F, 0x2A, 0x24, 0x97, 0x42, 0x0A], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001CC, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x3C, 0xA6, 0x28, 0x06, 0x1A, 0x87, 0x47, 0xCC, 0xF8, 0x23, 0x48, 0x67, 0x8D, 0x0C, 0xFB, 0xB4, 0xA3, 0x1B, 0xC8, 0x46, 0x1D, 0xA0, 0xAD, 0x68, 0x6E, 0xB6, 0x2C, 0x26, 0x62, 0x44, 0x04, 0x92], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* hughbe */
            let file = try CompoundFile(data: try getData(name: "custom", fileExtension: "msg"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000012FC0, file.rootStorage.count)
            XCTAssertEqual([0x15, 0x06, 0x9B, 0xF4, 0x6C, 0xE1, 0x84, 0x51, 0xC2, 0x65, 0x2E, 0xEF, 0xDB, 0x81, 0xA6, 0x77, 0x20, 0xC0, 0x9F, 0xF5, 0x9D, 0xC3, 0x6F, 0xC0, 0x63, 0x24, 0x04, 0x94, 0x95, 0xED, 0xFB, 0x44], [UInt8](SHA256.hash(data: file.rootStorage.data)))
            do {
                var storage = file.rootStorage
                XCTAssertEqual(74, storage.children.count)
                XCTAssertEqual("__substg1.0_80110102", storage.children["__substg1.0_80110102"]!.name)
                XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_80110102"]!.count)
                XCTAssertEqual([0x7E, 0x82, 0x6B, 0x50, 0x6E, 0x5A, 0x36, 0x35, 0x0A, 0x7A, 0x60, 0x7C, 0x62, 0x37, 0x87, 0xB5, 0x7A, 0x3D, 0x5D, 0xDF, 0x89, 0x78, 0x63, 0x6E, 0x20, 0xFF, 0x34, 0xF4, 0x53, 0x6C, 0xD6, 0x91], [UInt8](SHA256.hash(data: storage.children["__substg1.0_80110102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_80110102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8010001F", storage.children["__substg1.0_8010001F"]!.name)
                XCTAssertEqual(0x000000000000000E, storage.children["__substg1.0_8010001F"]!.count)
                XCTAssertEqual([0x83, 0xF6, 0xEB, 0xD1, 0xE6, 0x5B, 0x2B, 0x01, 0x24, 0xC0, 0xD6, 0x6A, 0x83, 0x73, 0xCE, 0x39, 0x28, 0x19, 0xE1, 0xA4, 0xCE, 0xA9, 0xB8, 0x4C, 0x70, 0xF6, 0x7C, 0x73, 0xFA, 0xB1, 0x67, 0x0B], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8010001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8010001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_800D0102", storage.children["__substg1.0_800D0102"]!.name)
                XCTAssertEqual(0x0000000000000210, storage.children["__substg1.0_800D0102"]!.count)
                XCTAssertEqual([0xA0, 0x35, 0x7E, 0x1F, 0xFC, 0xBA, 0xED, 0x17, 0x65, 0x37, 0x1B, 0x47, 0x74, 0x74, 0xC0, 0xCE, 0x6E, 0xDE, 0x86, 0xA2, 0x49, 0x76, 0x49, 0x85, 0x67, 0x54, 0xEA, 0x54, 0xD3, 0x3F, 0xDF, 0xAA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_800D0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_800D0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8008101F-00000000", storage.children["__substg1.0_8008101F-00000000"]!.name)
                XCTAssertEqual(0x0000000000000020, storage.children["__substg1.0_8008101F-00000000"]!.count)
                XCTAssertEqual([0xEA, 0x38, 0xBB, 0xFA, 0x05, 0x0B, 0xA3, 0xF9, 0xFB, 0x01, 0x0D, 0xFC, 0x99, 0x97, 0xB6, 0x3C, 0xF5, 0xBB, 0x86, 0xA6, 0xBE, 0xA9, 0xE0, 0x9C, 0x79, 0x15, 0x9A, 0xF6, 0x9D, 0x9D, 0x56, 0x26], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8008101F-00000000"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8008101F-00000000"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8008101F", storage.children["__substg1.0_8008101F"]!.name)
                XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_8008101F"]!.count)
                XCTAssertEqual([0x8D, 0x71, 0xB3, 0xFA, 0xAB, 0x82, 0x01, 0x45, 0x9A, 0xD3, 0x7E, 0xF4, 0x99, 0xBE, 0xB3, 0x36, 0xBA, 0x88, 0xBD, 0xCF, 0xA0, 0xF5, 0x1E, 0xE6, 0xF0, 0xA4, 0x6E, 0xC3, 0x19, 0x2D, 0x75, 0x0A], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8008101F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8008101F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8006001F", storage.children["__substg1.0_8006001F"]!.name)
                XCTAssertEqual(0x0000000000000028, storage.children["__substg1.0_8006001F"]!.count)
                XCTAssertEqual([0x8F, 0xF9, 0xEF, 0x62, 0x69, 0xCB, 0x02, 0x35, 0x04, 0x5B, 0x4D, 0x6E, 0x7D, 0x6D, 0x13, 0x07, 0x97, 0x7B, 0x39, 0x35, 0xF7, 0x5F, 0x85, 0x22, 0xB1, 0xB9, 0x79, 0x76, 0x4D, 0xEA, 0x0C, 0xA7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8006001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8006001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8005001F", storage.children["__substg1.0_8005001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_8005001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8005001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8005001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_8002001F", storage.children["__substg1.0_8002001F"]!.name)
                XCTAssertEqual(0x00000000000000B2, storage.children["__substg1.0_8002001F"]!.count)
                XCTAssertEqual([0xE7, 0x67, 0x63, 0x41, 0x36, 0xE6, 0x66, 0xD7, 0x38, 0x53, 0xB7, 0xD6, 0x8E, 0x2A, 0xE8, 0x33, 0xA4, 0x60, 0x80, 0xD7, 0x14, 0x5A, 0xA1, 0xD9, 0xBE, 0xE1, 0x82, 0xE4, 0x66, 0x06, 0x96, 0xA9], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8002001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_8002001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_680E001F", storage.children["__substg1.0_680E001F"]!.name)
                XCTAssertEqual(0x0000000000000028, storage.children["__substg1.0_680E001F"]!.count)
                XCTAssertEqual([0x8F, 0xF9, 0xEF, 0x62, 0x69, 0xCB, 0x02, 0x35, 0x04, 0x5B, 0x4D, 0x6E, 0x7D, 0x6D, 0x13, 0x07, 0x97, 0x7B, 0x39, 0x35, 0xF7, 0x5F, 0x85, 0x22, 0xB1, 0xB9, 0x79, 0x76, 0x4D, 0xEA, 0x0C, 0xA7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_680E001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_680E001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_680D001F", storage.children["__substg1.0_680D001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_680D001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_680D001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_680D001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_65E30102", storage.children["__substg1.0_65E30102"]!.name)
                XCTAssertEqual(0x0000000000000027, storage.children["__substg1.0_65E30102"]!.count)
                XCTAssertEqual([0x73, 0xB3, 0x5A, 0xF2, 0x55, 0x7E, 0x07, 0x28, 0xD8, 0x5D, 0x4E, 0x6E, 0x55, 0x27, 0x54, 0x9E, 0xB3, 0x87, 0x80, 0x0B, 0x73, 0x6C, 0x6B, 0xCF, 0x35, 0xE5, 0x8F, 0xCC, 0x19, 0xC0, 0x8E, 0xB5], [UInt8](SHA256.hash(data: storage.children["__substg1.0_65E30102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_65E30102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_65E20102", storage.children["__substg1.0_65E20102"]!.name)
                XCTAssertEqual(0x0000000000000014, storage.children["__substg1.0_65E20102"]!.count)
                XCTAssertEqual([0xA2, 0x9E, 0x74, 0x37, 0xC5, 0x99, 0xAD, 0xD7, 0x74, 0x7F, 0x9F, 0x78, 0x98, 0x31, 0xAC, 0xFC, 0xB1, 0x53, 0x85, 0x4F, 0x22, 0x8F, 0xBF, 0x63, 0x08, 0x85, 0x57, 0x8D, 0x2F, 0x9D, 0x82, 0x20], [UInt8](SHA256.hash(data: storage.children["__substg1.0_65E20102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_65E20102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_3FFA001F", storage.children["__substg1.0_3FFA001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_3FFA001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3FFA001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_3FFA001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_300B0102", storage.children["__substg1.0_300B0102"]!.name)
                XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_300B0102"]!.count)
                XCTAssertEqual([0x84, 0x66, 0x1A, 0x60, 0x26, 0x1B, 0xAC, 0xE1, 0xE2, 0x60, 0x67, 0x84, 0x94, 0x78, 0x00, 0xE8, 0x56, 0x6A, 0x99, 0xAC, 0x00, 0x46, 0xDD, 0xA1, 0x6E, 0xC6, 0x0A, 0xE1, 0xBC, 0x21, 0x69, 0x15], [UInt8](SHA256.hash(data: storage.children["__substg1.0_300B0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_300B0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_1035001F", storage.children["__substg1.0_1035001F"]!.name)
                XCTAssertEqual(0x00000000000000FE, storage.children["__substg1.0_1035001F"]!.count)
                XCTAssertEqual([0xB1, 0xF0, 0xEE, 0x27, 0xF7, 0x09, 0x12, 0xE2, 0x80, 0x0C, 0xB5, 0x1B, 0xC1, 0x05, 0xDE, 0xF5, 0xAF, 0x1A, 0xBF, 0xD7, 0xB5, 0x8A, 0xCA, 0x36, 0xD8, 0xDC, 0x07, 0x89, 0x81, 0x37, 0x5B, 0x35], [UInt8](SHA256.hash(data: storage.children["__substg1.0_1035001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_1035001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_10090102", storage.children["__substg1.0_10090102"]!.name)
                XCTAssertEqual(0x00000000000022B5, storage.children["__substg1.0_10090102"]!.count)
                XCTAssertEqual([0xB6, 0x65, 0x60, 0xD1, 0x53, 0xF3, 0xE2, 0x46, 0x00, 0x0E, 0xE6, 0xCC, 0xC8, 0xD7, 0x34, 0x1E, 0x00, 0x98, 0x14, 0x4B, 0xA0, 0x6C, 0x51, 0xA6, 0x4B, 0xD6, 0xDD, 0x83, 0x98, 0x1D, 0xA3, 0x8B], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10090102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_10090102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_1000001F", storage.children["__substg1.0_1000001F"]!.name)
                XCTAssertEqual(0x00000000000005E4, storage.children["__substg1.0_1000001F"]!.count)
                XCTAssertEqual([0xDE, 0x9F, 0x4F, 0x0F, 0xA5, 0xC2, 0xF5, 0xC4, 0xB5, 0x01, 0xE6, 0x19, 0xEC, 0xE7, 0xE4, 0x49, 0x84, 0x9A, 0x19, 0xF7, 0x70, 0xE2, 0x2C, 0x4F, 0xAB, 0x5E, 0xEF, 0x9D, 0xFD, 0xC8, 0x8E, 0x24], [UInt8](SHA256.hash(data: storage.children["__substg1.0_1000001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_1000001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E29001F", storage.children["__substg1.0_0E29001F"]!.name)
                XCTAssertEqual(0x0000000000000068, storage.children["__substg1.0_0E29001F"]!.count)
                XCTAssertEqual([0x5F, 0xCF, 0x5B, 0x0D, 0xB3, 0x0C, 0xCC, 0xA8, 0x97, 0x8C, 0xE1, 0x65, 0x31, 0xB6, 0x7E, 0x9C, 0x5F, 0xB1, 0x3B, 0xE6, 0x95, 0xC8, 0x25, 0x65, 0xDB, 0xA7, 0x51, 0xD6, 0x34, 0x1E, 0xA9, 0xBC], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E29001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E29001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E28001F", storage.children["__substg1.0_0E28001F"]!.name)
                XCTAssertEqual(0x0000000000000068, storage.children["__substg1.0_0E28001F"]!.count)
                XCTAssertEqual([0x5F, 0xCF, 0x5B, 0x0D, 0xB3, 0x0C, 0xCC, 0xA8, 0x97, 0x8C, 0xE1, 0x65, 0x31, 0xB6, 0x7E, 0x9C, 0x5F, 0xB1, 0x3B, 0xE6, 0x95, 0xC8, 0x25, 0x65, 0xDB, 0xA7, 0x51, 0xD6, 0x34, 0x1E, 0xA9, 0xBC], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E28001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E28001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E1D001F", storage.children["__substg1.0_0E1D001F"]!.name)
                XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0E1D001F"]!.count)
                XCTAssertEqual([0x13, 0xAB, 0x06, 0xC0, 0x72, 0xD0, 0xA1, 0xDE, 0xB7, 0xA9, 0xB7, 0xB6, 0xC9, 0xA2, 0x1A, 0x91, 0x0E, 0x96, 0x55, 0xA2, 0x5D, 0x66, 0xDB, 0xBE, 0xED, 0xE2, 0x48, 0x06, 0xC3, 0x44, 0xDE, 0x11], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E1D001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E1D001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E04001F", storage.children["__substg1.0_0E04001F"]!.name)
                XCTAssertEqual(0x0000000000000030, storage.children["__substg1.0_0E04001F"]!.count)
                XCTAssertEqual([0xF3, 0x65, 0x56, 0x3E, 0x27, 0x04, 0x2F, 0x24, 0xF9, 0xD5, 0x53, 0x7A, 0x87, 0x1C, 0x39, 0xBC, 0x91, 0xEC, 0x2B, 0xD8, 0x85, 0x31, 0x36, 0x9D, 0x75, 0x20, 0xEE, 0xBD, 0x8F, 0x34, 0x2A, 0x00], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E04001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E04001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E03001F", storage.children["__substg1.0_0E03001F"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_0E03001F"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E03001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E03001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0E02001F", storage.children["__substg1.0_0E02001F"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_0E02001F"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E02001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0E02001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0C1F001F", storage.children["__substg1.0_0C1F001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0C1F001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1F001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0C1F001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0C1E001F", storage.children["__substg1.0_0C1E001F"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0C1E001F"]!.count)
                XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1E001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0C1E001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0C1D0102", storage.children["__substg1.0_0C1D0102"]!.name)
                XCTAssertEqual(0x000000000000001A, storage.children["__substg1.0_0C1D0102"]!.count)
                XCTAssertEqual([0x9B, 0xFF, 0x0F, 0xAD, 0x21, 0x4B, 0xD7, 0x8B, 0x63, 0x76, 0xFF, 0xDB, 0xB5, 0x37, 0x2E, 0x6E, 0x4F, 0x00, 0xC4, 0x20, 0x74, 0x1C, 0x2C, 0x5B, 0x0E, 0x3E, 0xDA, 0xE3, 0x7C, 0xB4, 0x9B, 0xF7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1D0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0C1D0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0C1A001F", storage.children["__substg1.0_0C1A001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0C1A001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1A001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0C1A001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0C190102", storage.children["__substg1.0_0C190102"]!.name)
                XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_0C190102"]!.count)
                XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C190102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0C190102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0084101F-00000000", storage.children["__substg1.0_0084101F-00000000"]!.name)
                XCTAssertEqual(0x000000000000002C, storage.children["__substg1.0_0084101F-00000000"]!.count)
                XCTAssertEqual([0xC7, 0xCA, 0xDB, 0x9A, 0x64, 0x5F, 0xB4, 0x8C, 0x06, 0x07, 0xB3, 0x8F, 0x7B, 0xE3, 0xE4, 0xF4, 0xCB, 0x3D, 0x8C, 0xA6, 0x01, 0x53, 0x72, 0xE0, 0x9F, 0x68, 0xFA, 0xF9, 0xD5, 0x61, 0xB0, 0xDF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0084101F-00000000"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0084101F-00000000"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0084101F", storage.children["__substg1.0_0084101F"]!.name)
                XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0084101F"]!.count)
                XCTAssertEqual([0x32, 0x43, 0x4D, 0xC5, 0xB0, 0xF7, 0x2C, 0x9B, 0x86, 0x3C, 0x24, 0xDA, 0xA5, 0xD4, 0xE7, 0x9B, 0x9C, 0x43, 0xBD, 0x73, 0xB3, 0x8C, 0x46, 0x9F, 0xB6, 0x5F, 0xD1, 0x3D, 0x99, 0x6B, 0x7B, 0x32], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0084101F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0084101F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0083101F-00000000", storage.children["__substg1.0_0083101F-00000000"]!.name)
                XCTAssertEqual(0x000000000000002C, storage.children["__substg1.0_0083101F-00000000"]!.count)
                XCTAssertEqual([0xC7, 0xCA, 0xDB, 0x9A, 0x64, 0x5F, 0xB4, 0x8C, 0x06, 0x07, 0xB3, 0x8F, 0x7B, 0xE3, 0xE4, 0xF4, 0xCB, 0x3D, 0x8C, 0xA6, 0x01, 0x53, 0x72, 0xE0, 0x9F, 0x68, 0xFA, 0xF9, 0xD5, 0x61, 0xB0, 0xDF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0083101F-00000000"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0083101F-00000000"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0083101F", storage.children["__substg1.0_0083101F"]!.name)
                XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0083101F"]!.count)
                XCTAssertEqual([0x32, 0x43, 0x4D, 0xC5, 0xB0, 0xF7, 0x2C, 0x9B, 0x86, 0x3C, 0x24, 0xDA, 0xA5, 0xD4, 0xE7, 0x9B, 0x9C, 0x43, 0xBD, 0x73, 0xB3, 0x8C, 0x46, 0x9F, 0xB6, 0x5F, 0xD1, 0x3D, 0x99, 0x6B, 0x7B, 0x32], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0083101F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0083101F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_007F0102", storage.children["__substg1.0_007F0102"]!.name)
                XCTAssertEqual(0x000000000000008D, storage.children["__substg1.0_007F0102"]!.count)
                XCTAssertEqual([0x1C, 0x6A, 0x3E, 0x10, 0xF5, 0xA9, 0x86, 0xB8, 0x61, 0x43, 0x75, 0x3D, 0x87, 0xC5, 0xBD, 0x7C, 0xCC, 0x57, 0xA9, 0xE2, 0xAC, 0xC4, 0x30, 0x0B, 0xE3, 0xAB, 0x0D, 0xC8, 0x8A, 0xC6, 0xF0, 0x5E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_007F0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_007F0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_007D001F", storage.children["__substg1.0_007D001F"]!.name)
                XCTAssertEqual(0x000000000000099E, storage.children["__substg1.0_007D001F"]!.count)
                XCTAssertEqual([0xF4, 0x97, 0xB1, 0x1D, 0x93, 0xD5, 0x02, 0x4F, 0x3D, 0xE2, 0xAE, 0xCD, 0xE0, 0xB7, 0xF4, 0xCA, 0xA8, 0x78, 0x44, 0x07, 0x54, 0xD3, 0x5A, 0xCC, 0x42, 0x5A, 0xC2, 0xD9, 0x6C, 0x00, 0x61, 0x50], [UInt8](SHA256.hash(data: storage.children["__substg1.0_007D001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_007D001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0078001F", storage.children["__substg1.0_0078001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0078001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0078001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0078001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0077001F", storage.children["__substg1.0_0077001F"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0077001F"]!.count)
                XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0077001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0077001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0076001F", storage.children["__substg1.0_0076001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0076001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0076001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0076001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0075001F", storage.children["__substg1.0_0075001F"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0075001F"]!.count)
                XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0075001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0075001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00710102", storage.children["__substg1.0_00710102"]!.name)
                XCTAssertEqual(0x0000000000000016, storage.children["__substg1.0_00710102"]!.count)
                XCTAssertEqual([0xB5, 0xE8, 0x98, 0xF3, 0x31, 0x30, 0xC6, 0x39, 0xA4, 0xBB, 0x44, 0xA3, 0x80, 0x80, 0x2C, 0xA8, 0x67, 0x30, 0x58, 0x05, 0x66, 0x1E, 0xE9, 0x71, 0x4A, 0x81, 0x2B, 0x9D, 0xAD, 0x86, 0xED, 0xCA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00710102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00710102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0070001F", storage.children["__substg1.0_0070001F"]!.name)
                XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0070001F"]!.count)
                XCTAssertEqual([0x13, 0xAB, 0x06, 0xC0, 0x72, 0xD0, 0xA1, 0xDE, 0xB7, 0xA9, 0xB7, 0xB6, 0xC9, 0xA2, 0x1A, 0x91, 0x0E, 0x96, 0x55, 0xA2, 0x5D, 0x66, 0xDB, 0xBE, 0xED, 0xE2, 0x48, 0x06, 0xC3, 0x44, 0xDE, 0x11], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0070001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0070001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0065001F", storage.children["__substg1.0_0065001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0065001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0065001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0065001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0064001F", storage.children["__substg1.0_0064001F"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0064001F"]!.count)
                XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0064001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0064001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00520102", storage.children["__substg1.0_00520102"]!.name)
                XCTAssertEqual(0x000000000000001B, storage.children["__substg1.0_00520102"]!.count)
                XCTAssertEqual([0xBA, 0xD1, 0x23, 0x97, 0x3E, 0x3C, 0xDF, 0xBC, 0xAC, 0x16, 0x91, 0xB6, 0xD5, 0xD1, 0xFC, 0x8C, 0x40, 0x77, 0x3C, 0x6D, 0x5E, 0x5D, 0x2A, 0x0B, 0x83, 0x46, 0x6C, 0xB7, 0xD1, 0xC5, 0x40, 0xCA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00520102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00520102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00510102", storage.children["__substg1.0_00510102"]!.name)
                XCTAssertEqual(0x000000000000001B, storage.children["__substg1.0_00510102"]!.count)
                XCTAssertEqual([0xBA, 0xD1, 0x23, 0x97, 0x3E, 0x3C, 0xDF, 0xBC, 0xAC, 0x16, 0x91, 0xB6, 0xD5, 0xD1, 0xFC, 0x8C, 0x40, 0x77, 0x3C, 0x6D, 0x5E, 0x5D, 0x2A, 0x0B, 0x83, 0x46, 0x6C, 0xB7, 0xD1, 0xC5, 0x40, 0xCA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00510102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00510102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0050001F", storage.children["__substg1.0_0050001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0050001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0050001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0050001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_004F0102", storage.children["__substg1.0_004F0102"]!.name)
                XCTAssertEqual(0x0000000000000088, storage.children["__substg1.0_004F0102"]!.count)
                XCTAssertEqual([0x2D, 0x83, 0x20, 0x32, 0x67, 0x4E, 0xEF, 0x09, 0x8F, 0xA5, 0x41, 0x95, 0xA7, 0xD4, 0x9C, 0xA9, 0xDA, 0xF7, 0x0E, 0x97, 0x66, 0x1E, 0xF2, 0xCE, 0xCA, 0x94, 0x16, 0x88, 0xCB, 0x2F, 0x28, 0x15], [UInt8](SHA256.hash(data: storage.children["__substg1.0_004F0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_004F0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00460102", storage.children["__substg1.0_00460102"]!.name)
                XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_00460102"]!.count)
                XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00460102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00460102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0044001F", storage.children["__substg1.0_0044001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0044001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0044001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0044001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00430102", storage.children["__substg1.0_00430102"]!.name)
                XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_00430102"]!.count)
                XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00430102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00430102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0042001F", storage.children["__substg1.0_0042001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0042001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0042001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0042001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00410102", storage.children["__substg1.0_00410102"]!.name)
                XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_00410102"]!.count)
                XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00410102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00410102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0040001F", storage.children["__substg1.0_0040001F"]!.name)
                XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0040001F"]!.count)
                XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0040001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0040001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_003F0102", storage.children["__substg1.0_003F0102"]!.name)
                XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_003F0102"]!.count)
                XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003F0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_003F0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_003D001F", storage.children["__substg1.0_003D001F"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_003D001F"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003D001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_003D001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_003B0102", storage.children["__substg1.0_003B0102"]!.name)
                XCTAssertEqual(0x000000000000001A, storage.children["__substg1.0_003B0102"]!.count)
                XCTAssertEqual([0x9B, 0xFF, 0x0F, 0xAD, 0x21, 0x4B, 0xD7, 0x8B, 0x63, 0x76, 0xFF, 0xDB, 0xB5, 0x37, 0x2E, 0x6E, 0x4F, 0x00, 0xC4, 0x20, 0x74, 0x1C, 0x2C, 0x5B, 0x0E, 0x3E, 0xDA, 0xE3, 0x7C, 0xB4, 0x9B, 0xF7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003B0102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_003B0102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_0037001F", storage.children["__substg1.0_0037001F"]!.name)
                XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0037001F"]!.count)
                XCTAssertEqual([0x13, 0xAB, 0x06, 0xC0, 0x72, 0xD0, 0xA1, 0xDE, 0xB7, 0xA9, 0xB7, 0xB6, 0xC9, 0xA2, 0x1A, 0x91, 0x0E, 0x96, 0x55, 0xA2, 0x5D, 0x66, 0xDB, 0xBE, 0xED, 0xE2, 0x48, 0x06, 0xC3, 0x44, 0xDE, 0x11], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0037001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_0037001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_00310102", storage.children["__substg1.0_00310102"]!.name)
                XCTAssertEqual(0x0000000000000064, storage.children["__substg1.0_00310102"]!.count)
                XCTAssertEqual([0x57, 0x73, 0x32, 0x62, 0x9B, 0xE9, 0x50, 0x72, 0x39, 0xCF, 0x2C, 0x13, 0x59, 0x39, 0x33, 0x9C, 0xC3, 0x9E, 0xEF, 0x03, 0x85, 0xAB, 0x87, 0x2C, 0x85, 0x26, 0x1A, 0xC9, 0x02, 0x61, 0x80, 0x0E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00310102"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_00310102"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__substg1.0_001A001F", storage.children["__substg1.0_001A001F"]!.name)
                XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_001A001F"]!.count)
                XCTAssertEqual([0xD3, 0x45, 0x6C, 0xA7, 0x3D, 0x47, 0xE6, 0xBB, 0xCA, 0x73, 0x30, 0x86, 0x21, 0x1A, 0x84, 0x68, 0x64, 0xB7, 0x13, 0xB3, 0x24, 0x0A, 0x75, 0xD0, 0x2F, 0x8B, 0x76, 0x05, 0xD8, 0x4D, 0x27, 0xA3], [UInt8](SHA256.hash(data: storage.children["__substg1.0_001A001F"]!.data)))
                do {
                    var storage = storage.children["__substg1.0_001A001F"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__recip_version1.0_#00000000", storage.children["__recip_version1.0_#00000000"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__recip_version1.0_#00000000"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__recip_version1.0_#00000000"]!.data)))
                do {
                    var storage = storage.children["__recip_version1.0_#00000000"]!
                    XCTAssertEqual(7, storage.children.count)
                    XCTAssertEqual("__substg1.0_300B0102", storage.children["__substg1.0_300B0102"]!.name)
                    XCTAssertEqual(0x000000000000001C, storage.children["__substg1.0_300B0102"]!.count)
                    XCTAssertEqual([0xA0, 0x64, 0xB9, 0xFB, 0xCB, 0xF0, 0x00, 0x2C, 0xED, 0x84, 0xB3, 0x58, 0x5B, 0xF2, 0xD7, 0x25, 0xB6, 0x4E, 0x6C, 0x56, 0xA6, 0xC5, 0xD8, 0x1D, 0xCD, 0x33, 0xE6, 0xAB, 0x69, 0xA6, 0x3C, 0xCE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_300B0102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_300B0102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3003001F", storage.children["__substg1.0_3003001F"]!.name)
                    XCTAssertEqual(0x000000000000002E, storage.children["__substg1.0_3003001F"]!.count)
                    XCTAssertEqual([0xA3, 0x04, 0x4B, 0xB4, 0x0B, 0x6C, 0xF2, 0x84, 0xC4, 0xA3, 0xA5, 0xD8, 0x87, 0x15, 0xC3, 0x66, 0xC2, 0xA3, 0x96, 0x26, 0x72, 0x62, 0x79, 0x02, 0x66, 0x91, 0x06, 0x0E, 0x0B, 0xB5, 0x8F, 0xCF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3002001F", storage.children["__substg1.0_3002001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3002001F"]!.count)
                    XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3002001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3002001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x000000000000002E, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0xA3, 0x04, 0x4B, 0xB4, 0x0B, 0x6C, 0xF2, 0x84, 0xC4, 0xA3, 0xA5, 0xD8, 0x87, 0x15, 0xC3, 0x66, 0xC2, 0xA3, 0x96, 0x26, 0x72, 0x62, 0x79, 0x02, 0x66, 0x91, 0x06, 0x0E, 0x0B, 0xB5, 0x8F, 0xCF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FFF0102", storage.children["__substg1.0_0FFF0102"]!.name)
                    XCTAssertEqual(0x0000000000000082, storage.children["__substg1.0_0FFF0102"]!.count)
                    XCTAssertEqual([0x25, 0xDC, 0x37, 0xE2, 0x0F, 0x11, 0x8C, 0xF7, 0xD2, 0x2F, 0x8A, 0x70, 0xFE, 0x86, 0x43, 0xA6, 0xFD, 0x11, 0x69, 0xF7, 0xD2, 0xEF, 0x17, 0x95, 0x2A, 0x9B, 0xEE, 0xFF, 0x5B, 0xD8, 0x7A, 0x94], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FFF0102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FFF0102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF60102", storage.children["__substg1.0_0FF60102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF60102"]!.count)
                    XCTAssertEqual([0x5A, 0x9C, 0x55, 0x5B, 0x08, 0xD8, 0x16, 0x38, 0xB0, 0xDA, 0x79, 0x41, 0x0E, 0xA7, 0xEB, 0xE9, 0xE7, 0x9F, 0x8B, 0x3F, 0x36, 0x46, 0x9F, 0xDC, 0x4E, 0xFB, 0xB4, 0x8A, 0x7C, 0x13, 0x96, 0x17], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF60102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF60102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x0000000000000088, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0xD8, 0xD5, 0x17, 0x76, 0x1A, 0xCD, 0x48, 0x01, 0xC4, 0x5C, 0xCC, 0x9B, 0x20, 0xEC, 0xB1, 0x14, 0xA4, 0xA0, 0xFC, 0xEF, 0x40, 0xBD, 0x38, 0xCE, 0xB8, 0xFD, 0x58, 0xB6, 0xFE, 0x8B, 0xC0, 0x26], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                XCTAssertEqual(0x00000000000005F0, storage.children["__properties_version1.0"]!.count)
                XCTAssertEqual([0xB3, 0x7D, 0x58, 0xE6, 0xB8, 0x41, 0x00, 0xBB, 0x3B, 0xB6, 0x8F, 0xD3, 0x8C, 0x22, 0x48, 0xA3, 0x5B, 0xB7, 0xD4, 0xE7, 0xE0, 0xD5, 0xCD, 0x34, 0x9D, 0xD2, 0xF9, 0x9C, 0xA2, 0xE8, 0x0F, 0xE4], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                do {
                    var storage = storage.children["__properties_version1.0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("__nameid_version1.0", storage.children["__nameid_version1.0"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__nameid_version1.0"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__nameid_version1.0"]!.data)))
                do {
                    var storage = storage.children["__nameid_version1.0"]!
                    XCTAssertEqual(15, storage.children.count)
                    XCTAssertEqual("__substg1.0_101B0102", storage.children["__substg1.0_101B0102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_101B0102"]!.count)
                    XCTAssertEqual([0x74, 0x62, 0x42, 0xB0, 0xD5, 0x71, 0xB8, 0x8B, 0xE8, 0xEC, 0x90, 0x88, 0x90, 0x77, 0x1A, 0x89, 0x03, 0x4A, 0x52, 0x6D, 0x69, 0xE1, 0x7C, 0x11, 0x00, 0xEC, 0x4F, 0x2E, 0x2C, 0x09, 0x92, 0x42], [UInt8](SHA256.hash(data: storage.children["__substg1.0_101B0102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_101B0102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10190102", storage.children["__substg1.0_10190102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_10190102"]!.count)
                    XCTAssertEqual([0x3D, 0x1F, 0xF7, 0x0B, 0x3F, 0x5B, 0x68, 0xC2, 0x6D, 0x87, 0xD7, 0xBC, 0x29, 0x86, 0x27, 0xA7, 0x5A, 0x38, 0x88, 0xDE, 0x2D, 0xF6, 0xC7, 0xE1, 0x29, 0x4E, 0xA7, 0x35, 0x46, 0x95, 0x22, 0x64], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10190102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10190102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10180102", storage.children["__substg1.0_10180102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_10180102"]!.count)
                    XCTAssertEqual([0xE9, 0x62, 0x3D, 0x43, 0x27, 0xCE, 0xEF, 0xF8, 0x38, 0x3D, 0x33, 0x47, 0x43, 0x84, 0xEE, 0xDE, 0x36, 0x9C, 0xA2, 0xFA, 0x66, 0x05, 0x76, 0xBE, 0x89, 0xF2, 0x96, 0x71, 0xA9, 0x25, 0xAE, 0x0D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10180102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10180102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10150102", storage.children["__substg1.0_10150102"]!.name)
                    XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_10150102"]!.count)
                    XCTAssertEqual([0xB7, 0x79, 0x55, 0xA1, 0x5D, 0x62, 0x4A, 0x70, 0x2F, 0xE3, 0x50, 0x7E, 0x19, 0x16, 0xC7, 0xB2, 0xE5, 0x91, 0x7A, 0xF0, 0xAA, 0xF3, 0xF4, 0xA8, 0x5B, 0xFF, 0xE6, 0x08, 0xD4, 0x30, 0x57, 0x1C], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10150102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10150102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10140102", storage.children["__substg1.0_10140102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_10140102"]!.count)
                    XCTAssertEqual([0x2A, 0x12, 0xD2, 0x77, 0xEA, 0x43, 0xC1, 0xE1, 0x56, 0x85, 0x8C, 0x2C, 0xBE, 0x76, 0xAB, 0x4E, 0x9F, 0x2C, 0x72, 0xE8, 0x4C, 0x16, 0x95, 0xEB, 0xAD, 0xF0, 0xD7, 0xC1, 0x51, 0xC9, 0x75, 0x8D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10140102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10140102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10120102", storage.children["__substg1.0_10120102"]!.name)
                    XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_10120102"]!.count)
                    XCTAssertEqual([0x93, 0x27, 0xC8, 0x06, 0xFD, 0x1D, 0x61, 0xB9, 0xD0, 0xDF, 0xB7, 0xDF, 0xBC, 0xED, 0x92, 0x14, 0x41, 0x1C, 0x08, 0xB5, 0xE8, 0x9D, 0x3D, 0xE2, 0x12, 0x06, 0x5F, 0xE1, 0x46, 0xDB, 0xCB, 0x26], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10120102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10120102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10110102", storage.children["__substg1.0_10110102"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_10110102"]!.count)
                    XCTAssertEqual([0x4B, 0x06, 0xC0, 0x0B, 0xBE, 0x9B, 0x08, 0xD8, 0x35, 0x3E, 0x78, 0xB7, 0x21, 0xA1, 0xA8, 0x65, 0x18, 0xAF, 0x8F, 0xDE, 0x3D, 0x30, 0xB3, 0x30, 0x15, 0xB0, 0x98, 0x7B, 0xEA, 0x27, 0x25, 0xB0], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10110102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10110102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_100A0102", storage.children["__substg1.0_100A0102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_100A0102"]!.count)
                    XCTAssertEqual([0xB9, 0xC9, 0x96, 0xE5, 0x1D, 0x54, 0x07, 0xE4, 0xEC, 0x17, 0x8B, 0xB9, 0x61, 0x20, 0xC7, 0x8C, 0xB4, 0x7E, 0xB3, 0x75, 0xAD, 0x63, 0xBD, 0x62, 0x0E, 0x7F, 0x50, 0xBD, 0x3D, 0x48, 0x7A, 0xF7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_100A0102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_100A0102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10090102", storage.children["__substg1.0_10090102"]!.name)
                    XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_10090102"]!.count)
                    XCTAssertEqual([0x7C, 0x45, 0xB8, 0x6B, 0x3F, 0x47, 0xCD, 0x0F, 0xD8, 0xC7, 0x87, 0x3F, 0x9E, 0xDA, 0x1E, 0xFD, 0x3B, 0x6F, 0xAE, 0xE2, 0x60, 0x51, 0x58, 0x58, 0x12, 0x58, 0x57, 0x51, 0x66, 0x68, 0x42, 0xC2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10060102", storage.children["__substg1.0_10060102"]!.name)
                    XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_10060102"]!.count)
                    XCTAssertEqual([0xD4, 0xD7, 0x90, 0x37, 0xCB, 0xB1, 0x71, 0x87, 0xE9, 0x32, 0x77, 0xC2, 0x51, 0x8B, 0xF4, 0xE4, 0x9B, 0x3B, 0x9A, 0x2D, 0x79, 0x75, 0xA7, 0xCD, 0x3B, 0x27, 0xA8, 0x6D, 0x3E, 0x8A, 0x48, 0xE1], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10060102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10060102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10020102", storage.children["__substg1.0_10020102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_10020102"]!.count)
                    XCTAssertEqual([0xF9, 0xCC, 0x23, 0x28, 0x9C, 0xAB, 0x2F, 0x30, 0xB5, 0xD0, 0x8B, 0xD9, 0x73, 0x75, 0x42, 0x3B, 0x53, 0xF0, 0x86, 0x53, 0xF7, 0xFB, 0x9A, 0x25, 0xCF, 0x7D, 0x2D, 0x98, 0xC1, 0x17, 0x93, 0xDC], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_10010102", storage.children["__substg1.0_10010102"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_10010102"]!.count)
                    XCTAssertEqual([0x62, 0xDE, 0x74, 0x67, 0x32, 0xF0, 0x83, 0xA9, 0x24, 0xD6, 0x9E, 0xB2, 0x77, 0x0A, 0xD8, 0xEF, 0xB0, 0x92, 0xCF, 0xAA, 0xC4, 0xBB, 0x32, 0x4F, 0xD6, 0x9B, 0xDB, 0x77, 0xD1, 0xD2, 0xD5, 0x2C], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_10010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_00040102", storage.children["__substg1.0_00040102"]!.name)
                    XCTAssertEqual(0x0000000000000124, storage.children["__substg1.0_00040102"]!.count)
                    XCTAssertEqual([0x69, 0xC9, 0x96, 0x15, 0x26, 0x11, 0xB5, 0xA5, 0x97, 0x78, 0x6E, 0xFD, 0xAF, 0x58, 0xEA, 0x1F, 0x52, 0x2C, 0x76, 0x63, 0x7C, 0x3A, 0x8F, 0x89, 0x78, 0x66, 0xB4, 0xFC, 0x88, 0xAE, 0x96, 0x7F], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00040102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_00040102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_00030102", storage.children["__substg1.0_00030102"]!.name)
                    XCTAssertEqual(0x0000000000000090, storage.children["__substg1.0_00030102"]!.count)
                    XCTAssertEqual([0xC8, 0xEE, 0xC5, 0xB8, 0x45, 0xFD, 0xF3, 0x29, 0x36, 0xF5, 0x4D, 0x11, 0x8F, 0xDE, 0xB9, 0xC9, 0xC7, 0x1C, 0x53, 0x0B, 0x18, 0xF9, 0x69, 0x12, 0x63, 0xD1, 0x95, 0xA3, 0x2A, 0x92, 0xB8, 0xC8], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00030102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_00030102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_00020102", storage.children["__substg1.0_00020102"]!.name)
                    XCTAssertEqual(0x0000000000000040, storage.children["__substg1.0_00020102"]!.count)
                    XCTAssertEqual([0x00, 0xBA, 0x89, 0x7D, 0x54, 0xF3, 0xDF, 0xA5, 0x0D, 0x64, 0x9A, 0x78, 0xA5, 0xB6, 0x11, 0x15, 0xAE, 0xCB, 0x6D, 0xB4, 0x1A, 0xF6, 0x30, 0xD4, 0xE4, 0x5D, 0x92, 0xCF, 0xC6, 0x1E, 0xFE, 0x57], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_00020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#0000000C", storage.children["__attach_version1.0_#0000000C"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#0000000C"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#0000000C"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#0000000C"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_371A001F", storage.children["__substg1.0_371A001F"]!.name)
                    XCTAssertEqual(0x0000000000000016, storage.children["__substg1.0_371A001F"]!.count)
                    XCTAssertEqual([0xC4, 0xA9, 0x75, 0x07, 0x56, 0xAD, 0xF0, 0x7A, 0x0D, 0x07, 0x08, 0x07, 0x56, 0x1B, 0xB4, 0x29, 0x2E, 0x32, 0xE8, 0xBB, 0x52, 0xE5, 0xF1, 0x8B, 0x33, 0x7F, 0xAA, 0x60, 0xF0, 0x4F, 0xC6, 0xEF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_371A001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_371A001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3719001F", storage.children["__substg1.0_3719001F"]!.name)
                    XCTAssertEqual(0x0000000000000040, storage.children["__substg1.0_3719001F"]!.count)
                    XCTAssertEqual([0xBF, 0x2E, 0xEA, 0x7A, 0x6A, 0x1B, 0x1D, 0x3F, 0x09, 0xA2, 0x9B, 0xE3, 0xE9, 0x78, 0x07, 0x68, 0xDE, 0x27, 0x85, 0x50, 0xA1, 0x9C, 0xFE, 0xC2, 0x94, 0xB1, 0x71, 0xCE, 0xE9, 0x53, 0x92, 0x23], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3719001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3719001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x5E, 0x90, 0x73, 0xDA, 0xB3, 0xAA, 0x63, 0x8A, 0x6B, 0x24, 0x62, 0x53, 0x40, 0x0E, 0x18, 0x76, 0x06, 0x7A, 0x02, 0x98, 0x3F, 0xCC, 0xA1, 0x2A, 0x54, 0x29, 0x9B, 0x31, 0x49, 0x2E, 0x7F, 0x11], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000044, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0xF4, 0xC1, 0xC1, 0xC8, 0x90, 0x65, 0x4D, 0x4E, 0x1B, 0x88, 0xB6, 0x98, 0x74, 0x0C, 0x4E, 0xC6, 0x76, 0x04, 0x62, 0xEA, 0x95, 0x9F, 0x16, 0x4B, 0xD6, 0x47, 0x28, 0x91, 0x7D, 0x6C, 0xE5, 0xB9], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0xF6, 0xB6, 0xEE, 0xD1, 0xA5, 0xC3, 0xE0, 0x9F, 0x49, 0x7E, 0xA3, 0x4A, 0x3E, 0xEB, 0xED, 0x05, 0xC1, 0x27, 0xD1, 0xFF, 0xA3, 0xA0, 0xFF, 0x9F, 0xF4, 0x2B, 0xE1, 0xCC, 0x68, 0xE6, 0x07, 0x00], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x000000000000029C, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x2E, 0x30, 0xC8, 0x9E, 0xA2, 0x63, 0x22, 0x40, 0x74, 0xE8, 0x86, 0x0D, 0xCB, 0x1B, 0x6E, 0x1E, 0x14, 0x4E, 0x8E, 0x0C, 0xB9, 0x0E, 0x77, 0x45, 0x6E, 0x31, 0x79, 0x4F, 0xF6, 0x1A, 0x1D, 0xAA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000044, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0xF4, 0xC1, 0xC1, 0xC8, 0x90, 0x65, 0x4D, 0x4E, 0x1B, 0x88, 0xB6, 0x98, 0x74, 0x0C, 0x4E, 0xC6, 0x76, 0x04, 0x62, 0xEA, 0x95, 0x9F, 0x16, 0x4B, 0xD6, 0x47, 0x28, 0x91, 0x7D, 0x6C, 0xE5, 0xB9], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x42, 0xF4, 0xAE, 0xB8, 0x1C, 0x1E, 0xF8, 0x1F, 0x77, 0x1F, 0x3D, 0xE8, 0xAB, 0xCA, 0x9D, 0xCF, 0x66, 0x90, 0x1C, 0x57, 0x55, 0x30, 0xE7, 0x67, 0x2E, 0x4B, 0x11, 0x46, 0x47, 0x4A, 0xE6, 0x50], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x86, 0xF1, 0x77, 0xCD, 0x21, 0x61, 0x03, 0xB8, 0x9E, 0x63, 0x3D, 0x0B, 0x2C, 0xBB, 0x4C, 0x4D, 0xC7, 0x5A, 0x95, 0xE7, 0x14, 0xBC, 0x33, 0x9F, 0x38, 0xC7, 0x81, 0x10, 0xD3, 0x2E, 0xD3, 0x0D], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#0000000B", storage.children["__attach_version1.0_#0000000B"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#0000000B"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#0000000B"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#0000000B"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0xC3, 0x72, 0x8C, 0xA6, 0x98, 0xCD, 0x5A, 0x81, 0x42, 0x2C, 0xDB, 0x46, 0x2C, 0x67, 0x93, 0x5D, 0xB1, 0x99, 0xCE, 0xDB, 0xCE, 0x88, 0x24, 0x95, 0x1D, 0x5A, 0x54, 0x91, 0xC3, 0xD6, 0x8D, 0x3F], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x24, 0xA7, 0x3E, 0xBF, 0x96, 0x5F, 0x08, 0x91, 0x6C, 0x78, 0xCA, 0xEA, 0xC9, 0x86, 0x32, 0xF6, 0x7A, 0x5E, 0xA7, 0xAD, 0xF0, 0x27, 0xE7, 0x67, 0xBA, 0xB9, 0x5F, 0xB1, 0xDC, 0xD6, 0xB0, 0x41], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x24, 0xA7, 0x3E, 0xBF, 0x96, 0x5F, 0x08, 0x91, 0x6C, 0x78, 0xCA, 0xEA, 0xC9, 0x86, 0x32, 0xF6, 0x7A, 0x5E, 0xA7, 0xAD, 0xF0, 0x27, 0xE7, 0x67, 0xBA, 0xB9, 0x5F, 0xB1, 0xDC, 0xD6, 0xB0, 0x41], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x00000000000003BE, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x20, 0x97, 0x94, 0xDC, 0xD5, 0xA0, 0x91, 0xD2, 0xC5, 0xFC, 0x16, 0x25, 0x57, 0x2D, 0x9C, 0xAE, 0x02, 0x54, 0xF0, 0xF0, 0x5A, 0xD7, 0x39, 0x9C, 0x8F, 0xDD, 0xBF, 0xAB, 0x65, 0x3C, 0x0D, 0x53], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x24, 0xA7, 0x3E, 0xBF, 0x96, 0x5F, 0x08, 0x91, 0x6C, 0x78, 0xCA, 0xEA, 0xC9, 0x86, 0x32, 0xF6, 0x7A, 0x5E, 0xA7, 0xAD, 0xF0, 0x27, 0xE7, 0x67, 0xBA, 0xB9, 0x5F, 0xB1, 0xDC, 0xD6, 0xB0, 0x41], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0xCB, 0x30, 0xE9, 0x18, 0x17, 0x23, 0x91, 0x09, 0xFF, 0xD0, 0xA5, 0x87, 0x00, 0x46, 0xE1, 0x28, 0xF0, 0x46, 0x19, 0xDA, 0x80, 0xC7, 0x62, 0x4D, 0x92, 0x11, 0x62, 0xFD, 0xFE, 0x51, 0x4F, 0x76], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0xAB, 0x59, 0xF9, 0x88, 0x87, 0x11, 0x38, 0x20, 0x68, 0xBC, 0xC8, 0x9C, 0x5D, 0xC3, 0xE6, 0x6B, 0xC5, 0xE4, 0x2B, 0x86, 0x82, 0xDB, 0xF0, 0x3A, 0x84, 0xC7, 0x9C, 0x35, 0xD6, 0x5C, 0x31, 0xE8], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#0000000A", storage.children["__attach_version1.0_#0000000A"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#0000000A"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#0000000A"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#0000000A"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0xF3, 0xC4, 0x61, 0x83, 0xFD, 0xED, 0xEA, 0xDF, 0x33, 0x13, 0x1D, 0xC8, 0xAE, 0xA2, 0xB4, 0xDF, 0xA2, 0x88, 0x91, 0x7E, 0x09, 0x8C, 0x82, 0x33, 0xF7, 0xEF, 0xBE, 0x62, 0xEA, 0x41, 0x64, 0x7B], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0xA5, 0x17, 0x9D, 0x1A, 0xBE, 0xC5, 0xAC, 0x78, 0x39, 0x9E, 0x47, 0xAB, 0x2B, 0x2C, 0xF6, 0x84, 0xE0, 0xFB, 0xE9, 0x09, 0x44, 0x9D, 0x3A, 0xE8, 0xC5, 0xBF, 0xAD, 0x68, 0x14, 0xCA, 0x26, 0x17], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0xA5, 0x17, 0x9D, 0x1A, 0xBE, 0xC5, 0xAC, 0x78, 0x39, 0x9E, 0x47, 0xAB, 0x2B, 0x2C, 0xF6, 0x84, 0xE0, 0xFB, 0xE9, 0x09, 0x44, 0x9D, 0x3A, 0xE8, 0xC5, 0xBF, 0xAD, 0x68, 0x14, 0xCA, 0x26, 0x17], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x00000000000003B5, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x9E, 0x3D, 0xB6, 0x68, 0xF9, 0x4A, 0x68, 0x11, 0x44, 0x63, 0x68, 0xE7, 0xF7, 0xF7, 0x54, 0x61, 0x95, 0x57, 0x68, 0x39, 0x9B, 0x44, 0xF7, 0x6F, 0x19, 0x45, 0x3D, 0x10, 0x31, 0x0A, 0x77, 0xFA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0xA5, 0x17, 0x9D, 0x1A, 0xBE, 0xC5, 0xAC, 0x78, 0x39, 0x9E, 0x47, 0xAB, 0x2B, 0x2C, 0xF6, 0x84, 0xE0, 0xFB, 0xE9, 0x09, 0x44, 0x9D, 0x3A, 0xE8, 0xC5, 0xBF, 0xAD, 0x68, 0x14, 0xCA, 0x26, 0x17], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x07, 0x5D, 0xE2, 0xB9, 0x06, 0xDB, 0xD7, 0x06, 0x6D, 0xA0, 0x08, 0xCA, 0xB7, 0x35, 0xBE, 0xE8, 0x96, 0x37, 0x01, 0x54, 0x60, 0x35, 0x79, 0xA5, 0x01, 0x22, 0xF9, 0xB8, 0x85, 0x45, 0xBD, 0x45], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x6C, 0xF8, 0xA5, 0xAA, 0xEF, 0x79, 0xCE, 0xBA, 0x97, 0x5B, 0xF9, 0xC8, 0x59, 0x9E, 0xC4, 0x55, 0x9D, 0xA9, 0xFE, 0x16, 0x7B, 0x42, 0x6C, 0xF0, 0xBA, 0xB4, 0xDF, 0xBF, 0x24, 0x8D, 0x35, 0x28], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000009", storage.children["__attach_version1.0_#00000009"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000009"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000009"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000009"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0xEB, 0x27, 0xB6, 0x3F, 0xD2, 0x10, 0x19, 0x59, 0xD4, 0x16, 0x14, 0x8B, 0xEC, 0x4B, 0xA1, 0xA7, 0x54, 0x68, 0xDF, 0x3F, 0xB6, 0x69, 0xC6, 0x73, 0x56, 0xC3, 0xA6, 0x9C, 0x3E, 0xBB, 0xA1, 0xD4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x3F, 0x53, 0x56, 0x50, 0x40, 0xAE, 0x9D, 0x11, 0x49, 0x20, 0x22, 0x76, 0xE8, 0x26, 0xB4, 0x5E, 0x25, 0xB8, 0x3E, 0x55, 0x64, 0x44, 0x26, 0xAE, 0x0B, 0xDC, 0x10, 0x3D, 0xD7, 0x49, 0x0A, 0xF4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x3F, 0x53, 0x56, 0x50, 0x40, 0xAE, 0x9D, 0x11, 0x49, 0x20, 0x22, 0x76, 0xE8, 0x26, 0xB4, 0x5E, 0x25, 0xB8, 0x3E, 0x55, 0x64, 0x44, 0x26, 0xAE, 0x0B, 0xDC, 0x10, 0x3D, 0xD7, 0x49, 0x0A, 0xF4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x000000000000037C, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x9A, 0x7A, 0x0E, 0x64, 0x27, 0x08, 0x96, 0xD2, 0xAB, 0x00, 0xFA, 0x24, 0x82, 0x15, 0xEC, 0x4E, 0xCA, 0x91, 0x22, 0xA1, 0xAC, 0x00, 0xF4, 0xDF, 0x16, 0x02, 0x18, 0xF0, 0x3F, 0x5F, 0x72, 0xD6], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x3F, 0x53, 0x56, 0x50, 0x40, 0xAE, 0x9D, 0x11, 0x49, 0x20, 0x22, 0x76, 0xE8, 0x26, 0xB4, 0x5E, 0x25, 0xB8, 0x3E, 0x55, 0x64, 0x44, 0x26, 0xAE, 0x0B, 0xDC, 0x10, 0x3D, 0xD7, 0x49, 0x0A, 0xF4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x9F, 0x07, 0x6B, 0x7E, 0xB7, 0xFD, 0xC0, 0x31, 0x1C, 0xD3, 0x20, 0x8C, 0xDB, 0xBE, 0xBB, 0xF8, 0x01, 0x4D, 0xD3, 0xA0, 0x5E, 0x35, 0x19, 0x1C, 0x96, 0x94, 0x7B, 0x35, 0x8A, 0x36, 0x2B, 0x40], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x9D, 0xD1, 0xED, 0xAA, 0x62, 0xDB, 0xFC, 0x6F, 0x79, 0x4F, 0x1D, 0x57, 0x93, 0x1E, 0x5A, 0xCD, 0xA3, 0x0E, 0x7F, 0xDB, 0x9C, 0xD5, 0x26, 0xE6, 0xA5, 0xFA, 0x95, 0x03, 0x36, 0x0B, 0xB0, 0xFA], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000008", storage.children["__attach_version1.0_#00000008"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000008"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000008"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000008"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x4F, 0x8F, 0x19, 0x49, 0xF7, 0x20, 0xE5, 0x3E, 0x61, 0x43, 0xC9, 0x04, 0xFB, 0x9A, 0x8F, 0xB7, 0x9F, 0x47, 0x69, 0x19, 0x5C, 0x7D, 0x30, 0xEA, 0x72, 0xEC, 0xE2, 0xDF, 0x7F, 0xCB, 0xFA, 0x05], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x1F, 0x49, 0xDD, 0xC7, 0x69, 0x18, 0x32, 0x94, 0xFB, 0xD3, 0xAB, 0x49, 0x5A, 0xE9, 0x8A, 0x7A, 0x77, 0x55, 0xF7, 0x22, 0x9E, 0x38, 0x94, 0xD5, 0x56, 0xA9, 0xA8, 0x8A, 0x41, 0x32, 0x1D, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x1F, 0x49, 0xDD, 0xC7, 0x69, 0x18, 0x32, 0x94, 0xFB, 0xD3, 0xAB, 0x49, 0x5A, 0xE9, 0x8A, 0x7A, 0x77, 0x55, 0xF7, 0x22, 0x9E, 0x38, 0x94, 0xD5, 0x56, 0xA9, 0xA8, 0x8A, 0x41, 0x32, 0x1D, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000034, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0xF9, 0x37, 0x1C, 0x5B, 0x2B, 0x6B, 0x6D, 0x87, 0x5A, 0xAC, 0xA0, 0xA0, 0xEF, 0x47, 0x3E, 0xB4, 0x3F, 0xEF, 0xFA, 0x6B, 0x79, 0xD4, 0x85, 0xB8, 0x2F, 0xBA, 0xE3, 0xCD, 0xEE, 0xFB, 0xB7, 0x61], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x1F, 0x49, 0xDD, 0xC7, 0x69, 0x18, 0x32, 0x94, 0xFB, 0xD3, 0xAB, 0x49, 0x5A, 0xE9, 0x8A, 0x7A, 0x77, 0x55, 0xF7, 0x22, 0x9E, 0x38, 0x94, 0xD5, 0x56, 0xA9, 0xA8, 0x8A, 0x41, 0x32, 0x1D, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0xDC, 0x76, 0x56, 0x60, 0xB0, 0x6E, 0xE0, 0x3D, 0xD1, 0x6F, 0xD7, 0xCA, 0x5B, 0x95, 0x7E, 0x8C, 0x80, 0x51, 0x61, 0xAC, 0x2C, 0x4A, 0xF2, 0x8C, 0x5A, 0x10, 0x0A, 0xB2, 0xAB, 0x43, 0x2C, 0xA1], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x51, 0x59, 0x4A, 0xB6, 0x86, 0x35, 0x4D, 0xDB, 0x82, 0x05, 0xA1, 0x63, 0xF0, 0xE9, 0xEA, 0x46, 0xE5, 0x20, 0x50, 0x84, 0x90, 0x78, 0x84, 0xD7, 0xB8, 0x02, 0x41, 0x24, 0x23, 0xAE, 0x5B, 0x29], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000007", storage.children["__attach_version1.0_#00000007"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000007"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000007"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000007"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x8F, 0xAC, 0x52, 0xE0, 0x5F, 0x46, 0x07, 0x37, 0x3A, 0x65, 0x68, 0xDC, 0xD5, 0x41, 0x80, 0x62, 0xE0, 0xC1, 0x9D, 0x26, 0xA4, 0x6C, 0x0C, 0x70, 0x38, 0xEC, 0x48, 0x73, 0x29, 0x60, 0xE4, 0xE0], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x6B, 0xC6, 0xCB, 0xCB, 0xB1, 0x6B, 0x27, 0x45, 0x52, 0xB7, 0x7B, 0x0D, 0x7D, 0x62, 0x43, 0x51, 0x59, 0x48, 0xD5, 0xC9, 0x68, 0x42, 0x4D, 0x26, 0x35, 0x65, 0xAC, 0x49, 0xDB, 0xEE, 0x7D, 0xEE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x6B, 0xC6, 0xCB, 0xCB, 0xB1, 0x6B, 0x27, 0x45, 0x52, 0xB7, 0x7B, 0x0D, 0x7D, 0x62, 0x43, 0x51, 0x59, 0x48, 0xD5, 0xC9, 0x68, 0x42, 0x4D, 0x26, 0x35, 0x65, 0xAC, 0x49, 0xDB, 0xEE, 0x7D, 0xEE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000046, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x6A, 0xB8, 0xFA, 0x51, 0xF9, 0x08, 0x83, 0xE2, 0x7B, 0xBC, 0xB0, 0xB9, 0x0C, 0xE7, 0x41, 0x2F, 0x67, 0x95, 0x6B, 0xCC, 0x1D, 0x55, 0x30, 0xE8, 0xA1, 0xBC, 0xDC, 0x2E, 0xF8, 0x33, 0xEA, 0xF5], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x6B, 0xC6, 0xCB, 0xCB, 0xB1, 0x6B, 0x27, 0x45, 0x52, 0xB7, 0x7B, 0x0D, 0x7D, 0x62, 0x43, 0x51, 0x59, 0x48, 0xD5, 0xC9, 0x68, 0x42, 0x4D, 0x26, 0x35, 0x65, 0xAC, 0x49, 0xDB, 0xEE, 0x7D, 0xEE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0xE8, 0x61, 0x3F, 0x5A, 0x5B, 0xC9, 0xF9, 0xFE, 0xED, 0xA3, 0x2A, 0x8E, 0x7C, 0x80, 0xB6, 0x9D, 0xD4, 0x87, 0x8E, 0x47, 0xB6, 0xA9, 0x17, 0x23, 0xFB, 0x15, 0xEB, 0x84, 0x23, 0x6B, 0x6A, 0x2B], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0xA7, 0x57, 0x73, 0x85, 0xC4, 0x2B, 0x2E, 0xDD, 0xFD, 0xED, 0x06, 0x82, 0xD6, 0xD8, 0x93, 0xF0, 0xEE, 0xEC, 0xF9, 0xB1, 0x88, 0x8B, 0x6D, 0xCE, 0x72, 0xDC, 0x94, 0x0F, 0xF9, 0xEB, 0x05, 0xC7], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000006", storage.children["__attach_version1.0_#00000006"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000006"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000006"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000006"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0xB4, 0x9A, 0xEA, 0xCD, 0x65, 0x5B, 0x53, 0x9B, 0x3A, 0x71, 0x7D, 0xA9, 0xD4, 0x16, 0x7A, 0x4E, 0xAD, 0xD2, 0xCE, 0x33, 0x66, 0x93, 0x13, 0x20, 0xE3, 0x3A, 0x2B, 0x1B, 0x0E, 0x90, 0xCE, 0xF9], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x66, 0x56, 0x08, 0xBC, 0x41, 0x11, 0xBE, 0xE1, 0x6A, 0xBE, 0x45, 0x32, 0x22, 0x0F, 0x0F, 0x96, 0x15, 0x12, 0x3B, 0xEE, 0xC4, 0xEC, 0x83, 0x60, 0x02, 0x55, 0x40, 0xCE, 0x1A, 0x49, 0x23, 0x60], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x66, 0x56, 0x08, 0xBC, 0x41, 0x11, 0xBE, 0xE1, 0x6A, 0xBE, 0x45, 0x32, 0x22, 0x0F, 0x0F, 0x96, 0x15, 0x12, 0x3B, 0xEE, 0xC4, 0xEC, 0x83, 0x60, 0x02, 0x55, 0x40, 0xCE, 0x1A, 0x49, 0x23, 0x60], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000041, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0xD3, 0x33, 0xEA, 0x5E, 0x58, 0x43, 0x42, 0x1B, 0x36, 0xC3, 0x4E, 0xD4, 0x88, 0xC4, 0xC0, 0xD2, 0x05, 0xE4, 0x7D, 0x68, 0x2C, 0x69, 0xEC, 0x28, 0x58, 0x38, 0x46, 0xF9, 0x86, 0x1F, 0xC5, 0x75], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x66, 0x56, 0x08, 0xBC, 0x41, 0x11, 0xBE, 0xE1, 0x6A, 0xBE, 0x45, 0x32, 0x22, 0x0F, 0x0F, 0x96, 0x15, 0x12, 0x3B, 0xEE, 0xC4, 0xEC, 0x83, 0x60, 0x02, 0x55, 0x40, 0xCE, 0x1A, 0x49, 0x23, 0x60], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x7A, 0xA8, 0xCA, 0x4A, 0x02, 0x50, 0x6D, 0xA9, 0x13, 0x3D, 0x8F, 0x88, 0x96, 0x78, 0xB7, 0x6F, 0x71, 0x6C, 0xE4, 0x5D, 0x02, 0xE2, 0x2F, 0xDB, 0x7B, 0x70, 0xA1, 0x5E, 0x56, 0xA0, 0xEF, 0xF8], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x7F, 0xCA, 0x76, 0xF9, 0xCC, 0xF3, 0xEB, 0x10, 0xA6, 0x6A, 0x57, 0x51, 0x28, 0x03, 0x4A, 0x4F, 0xB9, 0x3D, 0xF8, 0x5A, 0x46, 0xF3, 0x38, 0xE5, 0xFB, 0x02, 0xE4, 0x66, 0x60, 0x0F, 0x27, 0x2C], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000005", storage.children["__attach_version1.0_#00000005"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000005"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000005"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000005"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0xB3, 0xDB, 0xDC, 0xF6, 0xC2, 0xB8, 0xAF, 0xC3, 0x94, 0xD4, 0xCF, 0x49, 0xE1, 0xFC, 0x2A, 0x39, 0xED, 0xDB, 0x2F, 0x61, 0x3C, 0x7D, 0x59, 0xA8, 0x9A, 0xE5, 0xBF, 0x23, 0xA5, 0x38, 0x4C, 0xC3], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x4C, 0x33, 0x28, 0xAF, 0xE1, 0x60, 0xB3, 0xB0, 0x8F, 0x12, 0x79, 0x84, 0x3E, 0x06, 0xFE, 0xB0, 0xAC, 0xED, 0xAB, 0x44, 0x94, 0x6C, 0x3E, 0xBD, 0x13, 0x65, 0x8B, 0x68, 0x16, 0xEF, 0xBB, 0xC4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x4C, 0x33, 0x28, 0xAF, 0xE1, 0x60, 0xB3, 0xB0, 0x8F, 0x12, 0x79, 0x84, 0x3E, 0x06, 0xFE, 0xB0, 0xAC, 0xED, 0xAB, 0x44, 0x94, 0x6C, 0x3E, 0xBD, 0x13, 0x65, 0x8B, 0x68, 0x16, 0xEF, 0xBB, 0xC4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000034, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x54, 0xD8, 0x29, 0xD6, 0x67, 0xCE, 0xC2, 0xBB, 0x3D, 0xD5, 0x1E, 0x82, 0xAE, 0x42, 0x89, 0x28, 0x2D, 0x11, 0xC2, 0xF4, 0x29, 0x73, 0xC6, 0x57, 0x93, 0xC4, 0x8C, 0x6E, 0x65, 0x32, 0xAA, 0xF3], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x4C, 0x33, 0x28, 0xAF, 0xE1, 0x60, 0xB3, 0xB0, 0x8F, 0x12, 0x79, 0x84, 0x3E, 0x06, 0xFE, 0xB0, 0xAC, 0xED, 0xAB, 0x44, 0x94, 0x6C, 0x3E, 0xBD, 0x13, 0x65, 0x8B, 0x68, 0x16, 0xEF, 0xBB, 0xC4], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x25, 0x94, 0xB6, 0xA9, 0x2E, 0xBF, 0xB1, 0xC3, 0x31, 0x2D, 0xEB, 0x7D, 0x01, 0xC0, 0x15, 0xFB, 0x95, 0xE9, 0xFB, 0xE9, 0xBD, 0x7B, 0xC6, 0xB5, 0x27, 0xAF, 0x07, 0x81, 0x3E, 0xC7, 0xB9, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x7F, 0xB1, 0x54, 0x4D, 0x6A, 0x66, 0x76, 0x44, 0xE5, 0xB3, 0xE8, 0xB1, 0xAB, 0xA9, 0x9F, 0xAC, 0x52, 0xCA, 0x5F, 0x51, 0xA0, 0x4B, 0xB6, 0x4B, 0x05, 0xE2, 0xC3, 0x4E, 0x98, 0x45, 0xE7, 0x47], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000004", storage.children["__attach_version1.0_#00000004"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000004"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000004"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000004"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x37, 0xB3, 0x8F, 0x47, 0x1C, 0x8A, 0x31, 0x72, 0xB4, 0x97, 0x0A, 0xD2, 0xEB, 0x3C, 0x18, 0x2B, 0x3D, 0xE5, 0xF2, 0x2B, 0xB6, 0x8A, 0x39, 0x44, 0x3E, 0x53, 0x4E, 0x62, 0xE6, 0x57, 0xA4, 0x3F], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0xA6, 0xB0, 0x37, 0xFE, 0xFD, 0x3E, 0x41, 0xC5, 0xF4, 0x9E, 0x03, 0x27, 0x1C, 0x3A, 0xEC, 0x4B, 0xA8, 0x53, 0x27, 0x08, 0xEA, 0xB9, 0xEA, 0x8E, 0x51, 0xB3, 0xB2, 0x93, 0xA4, 0x58, 0xE0, 0xE2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0xA6, 0xB0, 0x37, 0xFE, 0xFD, 0x3E, 0x41, 0xC5, 0xF4, 0x9E, 0x03, 0x27, 0x1C, 0x3A, 0xEC, 0x4B, 0xA8, 0x53, 0x27, 0x08, 0xEA, 0xB9, 0xEA, 0x8E, 0x51, 0xB3, 0xB2, 0x93, 0xA4, 0x58, 0xE0, 0xE2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000046, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x1C, 0x65, 0x7A, 0xFB, 0x22, 0xD6, 0x91, 0xBE, 0x88, 0x26, 0x49, 0x1F, 0xB4, 0x1D, 0x18, 0x39, 0x16, 0xB6, 0xDA, 0x44, 0x95, 0x20, 0x3C, 0x0C, 0x33, 0xDB, 0x7A, 0xB3, 0x47, 0x3A, 0x90, 0x21], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0xA6, 0xB0, 0x37, 0xFE, 0xFD, 0x3E, 0x41, 0xC5, 0xF4, 0x9E, 0x03, 0x27, 0x1C, 0x3A, 0xEC, 0x4B, 0xA8, 0x53, 0x27, 0x08, 0xEA, 0xB9, 0xEA, 0x8E, 0x51, 0xB3, 0xB2, 0x93, 0xA4, 0x58, 0xE0, 0xE2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0xFB, 0x5E, 0x51, 0x24, 0x25, 0xFC, 0x94, 0x49, 0x31, 0x6E, 0xC9, 0x59, 0x69, 0xEB, 0xE7, 0x1E, 0x2D, 0x57, 0x6D, 0xBA, 0xB8, 0x33, 0xD6, 0x1E, 0x2A, 0x5B, 0x93, 0x30, 0xFD, 0x70, 0xEE, 0x02], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x9F, 0xEB, 0xB0, 0x25, 0x6A, 0x08, 0x1E, 0xAE, 0xEA, 0xEC, 0x03, 0x0E, 0xD4, 0x2D, 0xF2, 0x77, 0xED, 0xCE, 0xE7, 0xCB, 0xEF, 0x89, 0x05, 0x1E, 0xAC, 0x39, 0xD8, 0x94, 0x3A, 0x7B, 0x54, 0x19], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000003", storage.children["__attach_version1.0_#00000003"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000003"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000003"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000003"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x05, 0x86, 0xAD, 0x28, 0x8A, 0xC9, 0x84, 0xF0, 0x45, 0x37, 0x90, 0xE6, 0x8E, 0x7F, 0x53, 0x99, 0x4E, 0x2C, 0x71, 0x23, 0xFC, 0x02, 0xE9, 0x54, 0xFF, 0x2D, 0xB1, 0xC7, 0x5E, 0x6B, 0xBE, 0x6A], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x01, 0xF6, 0x3F, 0x77, 0x8A, 0x2D, 0x91, 0xC0, 0xBF, 0xE5, 0x5F, 0x09, 0x60, 0x48, 0x1C, 0xD7, 0x6F, 0xAA, 0x59, 0xD5, 0xF1, 0xF3, 0x43, 0xB7, 0xF5, 0x85, 0x79, 0xF8, 0x7F, 0x2C, 0xC3, 0x96], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x01, 0xF6, 0x3F, 0x77, 0x8A, 0x2D, 0x91, 0xC0, 0xBF, 0xE5, 0x5F, 0x09, 0x60, 0x48, 0x1C, 0xD7, 0x6F, 0xAA, 0x59, 0xD5, 0xF1, 0xF3, 0x43, 0xB7, 0xF5, 0x85, 0x79, 0xF8, 0x7F, 0x2C, 0xC3, 0x96], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000041, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x1A, 0x89, 0x3A, 0xD1, 0x19, 0x0C, 0x56, 0xB5, 0xFF, 0x8B, 0x40, 0xA2, 0xD9, 0x0C, 0x5D, 0x27, 0x97, 0xFC, 0x6B, 0x7B, 0x21, 0x6B, 0x92, 0x92, 0x9E, 0xFC, 0xE2, 0x04, 0x18, 0xBE, 0x48, 0x71], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x01, 0xF6, 0x3F, 0x77, 0x8A, 0x2D, 0x91, 0xC0, 0xBF, 0xE5, 0x5F, 0x09, 0x60, 0x48, 0x1C, 0xD7, 0x6F, 0xAA, 0x59, 0xD5, 0xF1, 0xF3, 0x43, 0xB7, 0xF5, 0x85, 0x79, 0xF8, 0x7F, 0x2C, 0xC3, 0x96], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x9D, 0x9F, 0x29, 0x05, 0x27, 0xA6, 0xBE, 0x62, 0x6A, 0x8F, 0x59, 0x85, 0xB2, 0x6E, 0x19, 0xB2, 0x37, 0xB4, 0x48, 0x72, 0xB0, 0x36, 0x31, 0x81, 0x1D, 0xF4, 0x41, 0x6F, 0xC1, 0x71, 0x31, 0x78], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0xCE, 0x57, 0x4D, 0xF1, 0x01, 0x70, 0x7E, 0x32, 0xB0, 0x73, 0xBB, 0x00, 0xC5, 0x8D, 0xD8, 0xCB, 0x15, 0xD9, 0x81, 0x5F, 0x61, 0x73, 0x73, 0x61, 0xA6, 0x74, 0x54, 0xE9, 0x3E, 0xA9, 0x58, 0xE4], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000002", storage.children["__attach_version1.0_#00000002"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000002"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000002"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000002"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x20, 0x99, 0xA5, 0x1B, 0xA8, 0xA0, 0x13, 0xCD, 0x81, 0x4F, 0x81, 0xF9, 0x46, 0x59, 0xE2, 0xED, 0x04, 0x77, 0x5B, 0xEA, 0xC1, 0xF5, 0x0E, 0xE8, 0x56, 0xBA, 0xE4, 0x5C, 0x54, 0xAA, 0x84, 0xB7], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0x54, 0x65, 0xB7, 0xDD, 0x9B, 0x26, 0xE0, 0x2B, 0x67, 0xB9, 0x7D, 0xF6, 0xA6, 0x4C, 0x6C, 0x81, 0x4B, 0xF8, 0x7D, 0xD3, 0x98, 0x30, 0x28, 0x0B, 0x92, 0x98, 0x7B, 0x75, 0x86, 0x94, 0x1B, 0x2D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0xE6, 0x8B, 0x92, 0x52, 0x74, 0xD6, 0xF4, 0xC3, 0x21, 0xE0, 0x07, 0x89, 0x6C, 0x67, 0xD4, 0x14, 0x17, 0x10, 0xA5, 0x46, 0x0E, 0x9B, 0x19, 0xC1, 0x79, 0xAC, 0x9E, 0xFA, 0x75, 0xAD, 0xB3, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0xE6, 0x8B, 0x92, 0x52, 0x74, 0xD6, 0xF4, 0xC3, 0x21, 0xE0, 0x07, 0x89, 0x6C, 0x67, 0xD4, 0x14, 0x17, 0x10, 0xA5, 0x46, 0x0E, 0x9B, 0x19, 0xC1, 0x79, 0xAC, 0x9E, 0xFA, 0x75, 0xAD, 0xB3, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x64, 0xFA, 0xE1, 0x0F, 0xBD, 0x81, 0x50, 0x28, 0x2D, 0x2D, 0xA4, 0x11, 0x65, 0xAE, 0x20, 0xBE, 0xE8, 0xB5, 0x20, 0x9C, 0xF7, 0x80, 0x3B, 0xEF, 0x54, 0x7B, 0xE7, 0x39, 0xE2, 0x59, 0xD0, 0x43], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x0000000000000041, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x10, 0x1D, 0x33, 0x30, 0x5D, 0x44, 0x2E, 0xC1, 0xC0, 0x72, 0x8C, 0x70, 0x02, 0x88, 0xD6, 0xA9, 0xD0, 0x9E, 0x07, 0xFB, 0x73, 0xF2, 0x5B, 0x19, 0x46, 0xD0, 0x31, 0x21, 0x1A, 0x92, 0xC3, 0x82], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0xE6, 0x8B, 0x92, 0x52, 0x74, 0xD6, 0xF4, 0xC3, 0x21, 0xE0, 0x07, 0x89, 0x6C, 0x67, 0xD4, 0x14, 0x17, 0x10, 0xA5, 0x46, 0x0E, 0x9B, 0x19, 0xC1, 0x79, 0xAC, 0x9E, 0xFA, 0x75, 0xAD, 0xB3, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x26, 0xB2, 0x5D, 0x45, 0x75, 0x97, 0xA7, 0xB0, 0x46, 0x3F, 0x96, 0x20, 0xF6, 0x66, 0xDD, 0x10, 0xAA, 0x2C, 0x43, 0x73, 0xA5, 0x05, 0x96, 0x7C, 0x7C, 0x8D, 0x70, 0x92, 0x2A, 0x2D, 0x6E, 0xCE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x36, 0x45, 0x9B, 0x9A, 0x89, 0x7B, 0x8D, 0x5B, 0x95, 0x5D, 0xD0, 0x39, 0x8D, 0xB0, 0x6A, 0xBE, 0x84, 0x52, 0x7F, 0x0C, 0x58, 0x79, 0x02, 0x42, 0x56, 0x68, 0x11, 0x46, 0x3D, 0x80, 0x96, 0x2E], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000001", storage.children["__attach_version1.0_#00000001"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000001"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000001"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000001"]!
                    XCTAssertEqual(12, storage.children.count)
                    XCTAssertEqual("__substg1.0_8003001F", storage.children["__substg1.0_8003001F"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_8003001F"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8003001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_8003001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3712001F"]!.count)
                    XCTAssertEqual([0x23, 0xA7, 0x9C, 0x9B, 0x99, 0x89, 0x4E, 0x56, 0xC9, 0xBA, 0x13, 0x1F, 0xED, 0x32, 0x81, 0x7B, 0x84, 0x5C, 0x25, 0xEB, 0x06, 0xE2, 0xB4, 0x24, 0x1C, 0xD3, 0x1A, 0xC2, 0x52, 0x5A, 0xC0, 0x7A], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3712001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_370E001F", storage.children["__substg1.0_370E001F"]!.name)
                    XCTAssertEqual(0x0000000000000012, storage.children["__substg1.0_370E001F"]!.count)
                    XCTAssertEqual([0xE6, 0x1D, 0xE1, 0x3C, 0xF2, 0x9F, 0x0E, 0x26, 0x56, 0xFF, 0xA5, 0x83, 0xC6, 0xDA, 0x8E, 0xC9, 0x41, 0xD9, 0x7A, 0x58, 0x71, 0xFD, 0x03, 0xFD, 0x7B, 0x4A, 0x79, 0xCE, 0xC1, 0x5D, 0xBB, 0x1E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_370E001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_370E001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0x85, 0x15, 0xA3, 0xD7, 0x56, 0xF3, 0x8A, 0x9C, 0x6D, 0x3E, 0x17, 0xC5, 0x83, 0xFB, 0xA6, 0x80, 0x98, 0x6B, 0x54, 0xD5, 0x42, 0x8B, 0x6A, 0x42, 0x92, 0xA0, 0x6B, 0xBD, 0x96, 0x6F, 0x95, 0xAD], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3707001F", storage.children["__substg1.0_3707001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3707001F"]!.count)
                    XCTAssertEqual([0x29, 0x27, 0x49, 0xCC, 0xEF, 0xD8, 0x7A, 0xB5, 0xBD, 0xF5, 0x21, 0x10, 0xA5, 0x0C, 0xDE, 0x08, 0x4E, 0xFC, 0x1C, 0xF0, 0x99, 0xC4, 0x1C, 0x72, 0x4E, 0x35, 0xD4, 0x4B, 0x99, 0xBA, 0x49, 0x31], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3707001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3707001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0x29, 0x27, 0x49, 0xCC, 0xEF, 0xD8, 0x7A, 0xB5, 0xBD, 0xF5, 0x21, 0x10, 0xA5, 0x0C, 0xDE, 0x08, 0x4E, 0xFC, 0x1C, 0xF0, 0x99, 0xC4, 0x1C, 0x72, 0x4E, 0x35, 0xD4, 0x4B, 0x99, 0xBA, 0x49, 0x31], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3703001F", storage.children["__substg1.0_3703001F"]!.name)
                    XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3703001F"]!.count)
                    XCTAssertEqual([0x85, 0x53, 0xD5, 0xB3, 0x41, 0xE1, 0x07, 0x5A, 0xB3, 0x96, 0x12, 0xDF, 0x6F, 0x9B, 0x58, 0xB0, 0xAC, 0x7D, 0x70, 0x2D, 0x60, 0x88, 0xB5, 0xAF, 0x44, 0x3D, 0x3D, 0xC5, 0x13, 0xBB, 0x30, 0x3B], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3703001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3703001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37010102", storage.children["__substg1.0_37010102"]!.name)
                    XCTAssertEqual(0x000000000000577C, storage.children["__substg1.0_37010102"]!.count)
                    XCTAssertEqual([0x89, 0x1D, 0x76, 0xE6, 0x76, 0xDA, 0x09, 0xA2, 0x41, 0x10, 0xE5, 0x27, 0xAC, 0xF5, 0xE5, 0x97, 0x3D, 0x22, 0xCE, 0x14, 0xDF, 0xA9, 0x92, 0x83, 0x2E, 0x1B, 0x42, 0x3E, 0xDF, 0x6B, 0x9A, 0x5D], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37010102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37010102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x29, 0x27, 0x49, 0xCC, 0xEF, 0xD8, 0x7A, 0xB5, 0xBD, 0xF5, 0x21, 0x10, 0xA5, 0x0C, 0xDE, 0x08, 0x4E, 0xFC, 0x1C, 0xF0, 0x99, 0xC4, 0x1C, 0x72, 0x4E, 0x35, 0xD4, 0x4B, 0x99, 0xBA, 0x49, 0x31], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0x67, 0xAB, 0xDD, 0x72, 0x10, 0x24, 0xF0, 0xFF, 0x4E, 0x0B, 0x3F, 0x4C, 0x2F, 0xC1, 0x3B, 0xC5, 0xBA, 0xD4, 0x2D, 0x0B, 0x78, 0x51, 0xD4, 0x56, 0xD8, 0x8D, 0x20, 0x3D, 0x15, 0xAA, 0xA4, 0x50], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x00000000000001A8, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x45, 0x02, 0x88, 0x00, 0x3C, 0x64, 0x3B, 0x97, 0x4A, 0x33, 0xB0, 0xD1, 0x12, 0x31, 0x55, 0x4E, 0x88, 0xBE, 0xE6, 0x8E, 0x0C, 0x89, 0xB9, 0x05, 0x50, 0x1D, 0xB2, 0xEE, 0x6A, 0xDF, 0x95, 0xCD], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("__attach_version1.0_#00000000", storage.children["__attach_version1.0_#00000000"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["__attach_version1.0_#00000000"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__attach_version1.0_#00000000"]!.data)))
                do {
                    var storage = storage.children["__attach_version1.0_#00000000"]!
                    XCTAssertEqual(7, storage.children.count)
                    XCTAssertEqual("__substg1.0_37090102", storage.children["__substg1.0_37090102"]!.name)
                    XCTAssertEqual(0x0000000000000DB8, storage.children["__substg1.0_37090102"]!.count)
                    XCTAssertEqual([0xE5, 0xF8, 0x43, 0x42, 0xE4, 0x90, 0x2F, 0x3D, 0x06, 0x5B, 0x1A, 0x88, 0xEB, 0x09, 0x6A, 0xF3, 0xA7, 0x8D, 0x5D, 0x61, 0x50, 0xA6, 0x20, 0x9A, 0xD2, 0x33, 0x52, 0xB5, 0x81, 0x43, 0xC9, 0x61], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37090102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37090102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3704001F", storage.children["__substg1.0_3704001F"]!.name)
                    XCTAssertEqual(0x0000000000000026, storage.children["__substg1.0_3704001F"]!.count)
                    XCTAssertEqual([0xD0, 0xD3, 0x6C, 0xA1, 0xD0, 0xEC, 0x97, 0x08, 0x9C, 0x16, 0x6A, 0x41, 0x47, 0x86, 0x34, 0x83, 0xD7, 0xE2, 0x8C, 0x5F, 0x5C, 0xCC, 0xE8, 0xC7, 0x4A, 0x3E, 0x95, 0x20, 0xC2, 0x8E, 0x50, 0xFF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3704001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3704001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_37020102", storage.children["__substg1.0_37020102"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_37020102"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_37020102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_37020102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_3701000D", storage.children["__substg1.0_3701000D"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_3701000D"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3701000D"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3701000D"]!
                        XCTAssertEqual(40, storage.children.count)
                        XCTAssertEqual("__substg1.0_8002001F", storage.children["__substg1.0_8002001F"]!.name)
                        XCTAssertEqual(0x0000000000000034, storage.children["__substg1.0_8002001F"]!.count)
                        XCTAssertEqual([0xCC, 0x67, 0x6C, 0x51, 0xB2, 0x4C, 0x03, 0x21, 0xEE, 0x1B, 0x87, 0x61, 0x79, 0x05, 0x34, 0xBF, 0x72, 0x70, 0x57, 0xBF, 0x2B, 0xEC, 0x4A, 0x30, 0x35, 0x77, 0x51, 0x98, 0xC6, 0xFA, 0x7F, 0xB8], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8002001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_8002001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_8001001F", storage.children["__substg1.0_8001001F"]!.name)
                        XCTAssertEqual(0x0000000000000020, storage.children["__substg1.0_8001001F"]!.count)
                        XCTAssertEqual([0xB6, 0x0D, 0x46, 0x7C, 0x70, 0x3D, 0xF7, 0x56, 0xA8, 0xD5, 0x16, 0x01, 0x70, 0x07, 0xAC, 0xDF, 0x44, 0xB0, 0x12, 0x10, 0x29, 0xE3, 0xD9, 0xA9, 0x1C, 0xF9, 0x51, 0xB9, 0xE9, 0x36, 0x4A, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_8001001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_8001001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_3FFA001F", storage.children["__substg1.0_3FFA001F"]!.name)
                        XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_3FFA001F"]!.count)
                        XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3FFA001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_3FFA001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_3712001F", storage.children["__substg1.0_3712001F"]!.name)
                        XCTAssertEqual(0x0000000000000052, storage.children["__substg1.0_3712001F"]!.count)
                        XCTAssertEqual([0x13, 0xB0, 0x03, 0x75, 0xF7, 0x52, 0x6C, 0x7E, 0xD8, 0xF1, 0xE3, 0xB8, 0x8F, 0x08, 0x19, 0x80, 0x36, 0x4C, 0xC6, 0xAE, 0x2C, 0x09, 0xBB, 0x82, 0x5D, 0x69, 0x81, 0x79, 0xD1, 0x56, 0x67, 0xCB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3712001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_3712001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_300B0102", storage.children["__substg1.0_300B0102"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_300B0102"]!.count)
                        XCTAssertEqual([0x6D, 0xEF, 0xB8, 0x10, 0x5B, 0x57, 0x50, 0xF7, 0x65, 0xCF, 0x32, 0x98, 0xBB, 0x0F, 0x5C, 0xD1, 0x6A, 0xF3, 0x89, 0x9F, 0x78, 0x9C, 0xF4, 0x08, 0x6C, 0xDF, 0x11, 0x52, 0x9B, 0x24, 0x17, 0x45], [UInt8](SHA256.hash(data: storage.children["__substg1.0_300B0102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_300B0102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_1035001F", storage.children["__substg1.0_1035001F"]!.name)
                        XCTAssertEqual(0x0000000000000094, storage.children["__substg1.0_1035001F"]!.count)
                        XCTAssertEqual([0xF3, 0x89, 0x9D, 0x97, 0x8A, 0x6F, 0x7F, 0xA2, 0x37, 0xD7, 0x2E, 0x82, 0x95, 0x75, 0xFF, 0xD1, 0xC8, 0x52, 0x8A, 0xEB, 0x81, 0x77, 0xF4, 0x43, 0xBA, 0x07, 0xFF, 0xBD, 0x7C, 0xB2, 0x60, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_1035001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_1035001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_10090102", storage.children["__substg1.0_10090102"]!.name)
                        XCTAssertEqual(0x000000000000446A, storage.children["__substg1.0_10090102"]!.count)
                        XCTAssertEqual([0x64, 0x2C, 0xFF, 0x16, 0x63, 0x64, 0x78, 0x39, 0x71, 0x61, 0x76, 0xCA, 0xBD, 0x20, 0xAE, 0xD4, 0xBC, 0x48, 0x4F, 0xDD, 0x5E, 0x64, 0x02, 0xB0, 0x2C, 0x95, 0x4C, 0x0C, 0xE1, 0xC4, 0x3C, 0xD1], [UInt8](SHA256.hash(data: storage.children["__substg1.0_10090102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_10090102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_1000001F", storage.children["__substg1.0_1000001F"]!.name)
                        XCTAssertEqual(0x000000000000138C, storage.children["__substg1.0_1000001F"]!.count)
                        XCTAssertEqual([0xB7, 0x4F, 0x22, 0x26, 0xDF, 0x77, 0x78, 0x48, 0x97, 0x68, 0xB6, 0x4B, 0xC4, 0x91, 0x05, 0xAE, 0xD3, 0x27, 0x46, 0x53, 0x21, 0xC5, 0xDB, 0x3A, 0x4D, 0xBD, 0xFB, 0xCB, 0x2A, 0xFE, 0x16, 0xAA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_1000001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_1000001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0E1D001F", storage.children["__substg1.0_0E1D001F"]!.name)
                        XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0E1D001F"]!.count)
                        XCTAssertEqual([0x2E, 0xB5, 0xEE, 0xC2, 0x0F, 0x8F, 0xD0, 0xD4, 0x5C, 0x6C, 0x3C, 0xA0, 0x43, 0x89, 0x4F, 0xEA, 0xE9, 0xB6, 0x5C, 0xC3, 0xD6, 0x18, 0x62, 0xD2, 0x62, 0xE0, 0x3E, 0x71, 0x19, 0xA1, 0xDA, 0x0E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E1D001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0E1D001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0E04001F", storage.children["__substg1.0_0E04001F"]!.name)
                        XCTAssertEqual(0x000000000000002C, storage.children["__substg1.0_0E04001F"]!.count)
                        XCTAssertEqual([0xC7, 0xCA, 0xDB, 0x9A, 0x64, 0x5F, 0xB4, 0x8C, 0x06, 0x07, 0xB3, 0x8F, 0x7B, 0xE3, 0xE4, 0xF4, 0xCB, 0x3D, 0x8C, 0xA6, 0x01, 0x53, 0x72, 0xE0, 0x9F, 0x68, 0xFA, 0xF9, 0xD5, 0x61, 0xB0, 0xDF], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E04001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0E04001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0E03001F", storage.children["__substg1.0_0E03001F"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_0E03001F"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E03001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0E03001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0E02001F", storage.children["__substg1.0_0E02001F"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_0E02001F"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0E02001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0E02001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0C1F001F", storage.children["__substg1.0_0C1F001F"]!.name)
                        XCTAssertEqual(0x0000000000000026, storage.children["__substg1.0_0C1F001F"]!.count)
                        XCTAssertEqual([0x71, 0x27, 0x3C, 0xE9, 0x28, 0x03, 0xAF, 0x9B, 0x7E, 0x17, 0x2A, 0x44, 0xBD, 0x26, 0x0F, 0xDA, 0xAC, 0xF5, 0x59, 0xD0, 0xD2, 0x1F, 0xB4, 0x5F, 0xC0, 0x52, 0x00, 0x5B, 0x53, 0x2F, 0xAA, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1F001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0C1F001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0C1E001F", storage.children["__substg1.0_0C1E001F"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0C1E001F"]!.count)
                        XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1E001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0C1E001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0C1D0102", storage.children["__substg1.0_0C1D0102"]!.name)
                        XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_0C1D0102"]!.count)
                        XCTAssertEqual([0xCF, 0x16, 0x38, 0x24, 0x15, 0xE9, 0xDD, 0x17, 0x69, 0xE6, 0x87, 0xAE, 0x6C, 0x44, 0x2F, 0x79, 0xC3, 0x58, 0x98, 0xD0, 0x74, 0x7F, 0x52, 0x51, 0xDA, 0x56, 0x71, 0xA7, 0xE8, 0xFF, 0x4D, 0xDB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1D0102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0C1D0102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0C1A001F", storage.children["__substg1.0_0C1A001F"]!.name)
                        XCTAssertEqual(0x0000000000000030, storage.children["__substg1.0_0C1A001F"]!.count)
                        XCTAssertEqual([0xB1, 0xCF, 0x97, 0x89, 0x43, 0x9D, 0xC5, 0x79, 0x7E, 0x97, 0xCB, 0x1D, 0x76, 0xE1, 0xB5, 0x78, 0xF8, 0x0E, 0x19, 0xD9, 0xA9, 0x3B, 0xE7, 0xFE, 0xEE, 0x09, 0x3E, 0x83, 0x6A, 0x8E, 0x94, 0xD2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C1A001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0C1A001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0C190102", storage.children["__substg1.0_0C190102"]!.name)
                        XCTAssertEqual(0x000000000000004A, storage.children["__substg1.0_0C190102"]!.count)
                        XCTAssertEqual([0xAE, 0xF1, 0x6C, 0x69, 0xC8, 0xC4, 0x84, 0x05, 0x82, 0xB8, 0x70, 0x63, 0xB9, 0x6F, 0xD3, 0x56, 0xEB, 0xE1, 0x21, 0xBA, 0x22, 0x75, 0xA9, 0x40, 0x76, 0x64, 0x81, 0x01, 0xA3, 0x69, 0x26, 0x97], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0C190102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0C190102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_007D001F", storage.children["__substg1.0_007D001F"]!.name)
                        XCTAssertEqual(0x0000000000001C64, storage.children["__substg1.0_007D001F"]!.count)
                        XCTAssertEqual([0x00, 0x7F, 0xA1, 0x77, 0x95, 0x2A, 0xA7, 0x65, 0xC1, 0xDA, 0x18, 0xBD, 0x9B, 0xC4, 0x49, 0xD7, 0x23, 0x84, 0x09, 0x34, 0x33, 0x3B, 0x6F, 0xB7, 0x85, 0x1F, 0x70, 0x4E, 0x3D, 0x18, 0x33, 0x33], [UInt8](SHA256.hash(data: storage.children["__substg1.0_007D001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_007D001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0078001F", storage.children["__substg1.0_0078001F"]!.name)
                        XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0078001F"]!.count)
                        XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0078001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0078001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0077001F", storage.children["__substg1.0_0077001F"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0077001F"]!.count)
                        XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0077001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0077001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0076001F", storage.children["__substg1.0_0076001F"]!.name)
                        XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0076001F"]!.count)
                        XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0076001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0076001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0075001F", storage.children["__substg1.0_0075001F"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0075001F"]!.count)
                        XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0075001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0075001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_00710102", storage.children["__substg1.0_00710102"]!.name)
                        XCTAssertEqual(0x0000000000000016, storage.children["__substg1.0_00710102"]!.count)
                        XCTAssertEqual([0xFF, 0x0E, 0xE1, 0x07, 0x69, 0xA7, 0xBB, 0x90, 0xE6, 0x40, 0xEF, 0x32, 0xDD, 0x71, 0x1E, 0x0C, 0x1F, 0x60, 0xAE, 0x3E, 0xC3, 0x50, 0x72, 0xCA, 0x3E, 0xD4, 0xB4, 0x0B, 0x0F, 0xFA, 0x7A, 0xC9], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00710102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_00710102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0070001F", storage.children["__substg1.0_0070001F"]!.name)
                        XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0070001F"]!.count)
                        XCTAssertEqual([0x2E, 0xB5, 0xEE, 0xC2, 0x0F, 0x8F, 0xD0, 0xD4, 0x5C, 0x6C, 0x3C, 0xA0, 0x43, 0x89, 0x4F, 0xEA, 0xE9, 0xB6, 0x5C, 0xC3, 0xD6, 0x18, 0x62, 0xD2, 0x62, 0xE0, 0x3E, 0x71, 0x19, 0xA1, 0xDA, 0x0E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0070001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0070001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0065001F", storage.children["__substg1.0_0065001F"]!.name)
                        XCTAssertEqual(0x0000000000000026, storage.children["__substg1.0_0065001F"]!.count)
                        XCTAssertEqual([0x71, 0x27, 0x3C, 0xE9, 0x28, 0x03, 0xAF, 0x9B, 0x7E, 0x17, 0x2A, 0x44, 0xBD, 0x26, 0x0F, 0xDA, 0xAC, 0xF5, 0x59, 0xD0, 0xD2, 0x1F, 0xB4, 0x5F, 0xC0, 0x52, 0x00, 0x5B, 0x53, 0x2F, 0xAA, 0x63], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0065001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0065001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0064001F", storage.children["__substg1.0_0064001F"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_0064001F"]!.count)
                        XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0064001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0064001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_00520102", storage.children["__substg1.0_00520102"]!.name)
                        XCTAssertEqual(0x000000000000001B, storage.children["__substg1.0_00520102"]!.count)
                        XCTAssertEqual([0xBA, 0xD1, 0x23, 0x97, 0x3E, 0x3C, 0xDF, 0xBC, 0xAC, 0x16, 0x91, 0xB6, 0xD5, 0xD1, 0xFC, 0x8C, 0x40, 0x77, 0x3C, 0x6D, 0x5E, 0x5D, 0x2A, 0x0B, 0x83, 0x46, 0x6C, 0xB7, 0xD1, 0xC5, 0x40, 0xCA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00520102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_00520102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_00510102", storage.children["__substg1.0_00510102"]!.name)
                        XCTAssertEqual(0x000000000000001B, storage.children["__substg1.0_00510102"]!.count)
                        XCTAssertEqual([0xBA, 0xD1, 0x23, 0x97, 0x3E, 0x3C, 0xDF, 0xBC, 0xAC, 0x16, 0x91, 0xB6, 0xD5, 0xD1, 0xFC, 0x8C, 0x40, 0x77, 0x3C, 0x6D, 0x5E, 0x5D, 0x2A, 0x0B, 0x83, 0x46, 0x6C, 0xB7, 0xD1, 0xC5, 0x40, 0xCA], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00510102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_00510102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0044001F", storage.children["__substg1.0_0044001F"]!.name)
                        XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0044001F"]!.count)
                        XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0044001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0044001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_00430102", storage.children["__substg1.0_00430102"]!.name)
                        XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_00430102"]!.count)
                        XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00430102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_00430102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0042001F", storage.children["__substg1.0_0042001F"]!.name)
                        XCTAssertEqual(0x0000000000000030, storage.children["__substg1.0_0042001F"]!.count)
                        XCTAssertEqual([0xB1, 0xCF, 0x97, 0x89, 0x43, 0x9D, 0xC5, 0x79, 0x7E, 0x97, 0xCB, 0x1D, 0x76, 0xE1, 0xB5, 0x78, 0xF8, 0x0E, 0x19, 0xD9, 0xA9, 0x3B, 0xE7, 0xFE, 0xEE, 0x09, 0x3E, 0x83, 0x6A, 0x8E, 0x94, 0xD2], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0042001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0042001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_00410102", storage.children["__substg1.0_00410102"]!.name)
                        XCTAssertEqual(0x000000000000007C, storage.children["__substg1.0_00410102"]!.count)
                        XCTAssertEqual([0xAE, 0x8B, 0x16, 0xB3, 0x50, 0x0C, 0xA3, 0x4C, 0x94, 0x97, 0x55, 0xF3, 0x30, 0xEC, 0xBB, 0x66, 0xC0, 0xF6, 0x36, 0x39, 0x1E, 0xE6, 0x03, 0x9B, 0xB9, 0x49, 0xD1, 0xE1, 0x8A, 0x15, 0x37, 0x61], [UInt8](SHA256.hash(data: storage.children["__substg1.0_00410102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_00410102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0040001F", storage.children["__substg1.0_0040001F"]!.name)
                        XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_0040001F"]!.count)
                        XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0040001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0040001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_003F0102", storage.children["__substg1.0_003F0102"]!.name)
                        XCTAssertEqual(0x000000000000007A, storage.children["__substg1.0_003F0102"]!.count)
                        XCTAssertEqual([0xBE, 0x8B, 0xFA, 0xD7, 0x7B, 0x63, 0x56, 0xB3, 0x90, 0x7E, 0x61, 0x09, 0x94, 0xDF, 0xFE, 0x1F, 0xCC, 0x58, 0x6C, 0xCE, 0x02, 0x99, 0xD1, 0xD3, 0x69, 0x76, 0x95, 0x7F, 0xBA, 0xE8, 0xE9, 0xAE], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003F0102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_003F0102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_003D001F", storage.children["__substg1.0_003D001F"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["__substg1.0_003D001F"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003D001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_003D001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_003B0102", storage.children["__substg1.0_003B0102"]!.name)
                        XCTAssertEqual(0x0000000000000018, storage.children["__substg1.0_003B0102"]!.count)
                        XCTAssertEqual([0xCF, 0x16, 0x38, 0x24, 0x15, 0xE9, 0xDD, 0x17, 0x69, 0xE6, 0x87, 0xAE, 0x6C, 0x44, 0x2F, 0x79, 0xC3, 0x58, 0x98, 0xD0, 0x74, 0x7F, 0x52, 0x51, 0xDA, 0x56, 0x71, 0xA7, 0xE8, 0xFF, 0x4D, 0xDB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_003B0102"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_003B0102"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_0037001F", storage.children["__substg1.0_0037001F"]!.name)
                        XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_0037001F"]!.count)
                        XCTAssertEqual([0x2E, 0xB5, 0xEE, 0xC2, 0x0F, 0x8F, 0xD0, 0xD4, 0x5C, 0x6C, 0x3C, 0xA0, 0x43, 0x89, 0x4F, 0xEA, 0xE9, 0xB6, 0x5C, 0xC3, 0xD6, 0x18, 0x62, 0xD2, 0x62, 0xE0, 0x3E, 0x71, 0x19, 0xA1, 0xDA, 0x0E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0037001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_0037001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__substg1.0_001A001F", storage.children["__substg1.0_001A001F"]!.name)
                        XCTAssertEqual(0x0000000000000010, storage.children["__substg1.0_001A001F"]!.count)
                        XCTAssertEqual([0xD3, 0x45, 0x6C, 0xA7, 0x3D, 0x47, 0xE6, 0xBB, 0xCA, 0x73, 0x30, 0x86, 0x21, 0x1A, 0x84, 0x68, 0x64, 0xB7, 0x13, 0xB3, 0x24, 0x0A, 0x75, 0xD0, 0x2F, 0x8B, 0x76, 0x05, 0xD8, 0x4D, 0x27, 0xA3], [UInt8](SHA256.hash(data: storage.children["__substg1.0_001A001F"]!.data)))
                        do {
                            var storage = storage.children["__substg1.0_001A001F"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("__recip_version1.0_#00000000", storage.children["__recip_version1.0_#00000000"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["__recip_version1.0_#00000000"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["__recip_version1.0_#00000000"]!.data)))
                        do {
                            var storage = storage.children["__recip_version1.0_#00000000"]!
                            XCTAssertEqual(5, storage.children.count)
                            XCTAssertEqual("__substg1.0_3003001F", storage.children["__substg1.0_3003001F"]!.name)
                            XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_3003001F"]!.count)
                            XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3003001F"]!.data)))
                            do {
                                var storage = storage.children["__substg1.0_3003001F"]!
                                XCTAssertEqual(0, storage.children.count)
                            }

                            XCTAssertEqual("__substg1.0_3002001F", storage.children["__substg1.0_3002001F"]!.name)
                            XCTAssertEqual(0x0000000000000008, storage.children["__substg1.0_3002001F"]!.count)
                            XCTAssertEqual([0xC7, 0x9B, 0xCD, 0x93, 0xAB, 0xF3, 0x63, 0x66, 0x43, 0xFB, 0xF0, 0x79, 0xA7, 0xFB, 0x98, 0xF7, 0x97, 0x45, 0xC7, 0x99, 0x6F, 0x18, 0xDC, 0x13, 0xBF, 0x33, 0x47, 0xCA, 0x40, 0x1D, 0xC0, 0x10], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3002001F"]!.data)))
                            do {
                                var storage = storage.children["__substg1.0_3002001F"]!
                                XCTAssertEqual(0, storage.children.count)
                            }

                            XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                            XCTAssertEqual(0x000000000000002A, storage.children["__substg1.0_3001001F"]!.count)
                            XCTAssertEqual([0x31, 0xD6, 0x87, 0x8F, 0xC9, 0x58, 0x9E, 0x7C, 0x74, 0x93, 0x93, 0x47, 0xB7, 0xA4, 0x39, 0xF7, 0x4C, 0xFE, 0xD3, 0xA2, 0x2C, 0x00, 0x7C, 0xED, 0x8A, 0xDD, 0x03, 0x09, 0xE5, 0x80, 0x2D, 0xFB], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                            do {
                                var storage = storage.children["__substg1.0_3001001F"]!
                                XCTAssertEqual(0, storage.children.count)
                            }

                            XCTAssertEqual("__substg1.0_0FF60102", storage.children["__substg1.0_0FF60102"]!.name)
                            XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF60102"]!.count)
                            XCTAssertEqual([0xCF, 0xF9, 0x36, 0x9E, 0x42, 0x71, 0x9D, 0xB6, 0x2B, 0xC0, 0x68, 0x31, 0x66, 0xE9, 0xBB, 0xEA, 0x39, 0x23, 0x22, 0x85, 0xFD, 0x89, 0x99, 0x8C, 0x28, 0x02, 0x87, 0x9A, 0x8C, 0x15, 0x1F, 0xB5], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF60102"]!.data)))
                            do {
                                var storage = storage.children["__substg1.0_0FF60102"]!
                                XCTAssertEqual(0, storage.children.count)
                            }

                            XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                            XCTAssertEqual(0x0000000000000068, storage.children["__properties_version1.0"]!.count)
                            XCTAssertEqual([0x13, 0xFC, 0x79, 0xC0, 0x57, 0xFA, 0xA2, 0x64, 0x4B, 0x3E, 0xBE, 0x94, 0xC7, 0x15, 0x08, 0x6F, 0x56, 0xB6, 0x4D, 0x16, 0x6D, 0xEE, 0x65, 0xAF, 0x55, 0x3A, 0x48, 0x10, 0xA0, 0x84, 0x40, 0x5A], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                            do {
                                var storage = storage.children["__properties_version1.0"]!
                                XCTAssertEqual(0, storage.children.count)
                            }
                        }

                        XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                        XCTAssertEqual(0x0000000000000368, storage.children["__properties_version1.0"]!.count)
                        XCTAssertEqual([0xAA, 0x04, 0x27, 0xBF, 0x40, 0xDD, 0xDD, 0x3F, 0x2D, 0x80, 0xF6, 0xC1, 0xFF, 0xED, 0xCC, 0x21, 0xE1, 0xCA, 0x88, 0xAC, 0x4F, 0xB1, 0x41, 0x89, 0xE2, 0x70, 0xB6, 0xD2, 0xDF, 0xFB, 0xDE, 0x76], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                        do {
                            var storage = storage.children["__properties_version1.0"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("__substg1.0_3001001F", storage.children["__substg1.0_3001001F"]!.name)
                    XCTAssertEqual(0x000000000000003C, storage.children["__substg1.0_3001001F"]!.count)
                    XCTAssertEqual([0x2E, 0xB5, 0xEE, 0xC2, 0x0F, 0x8F, 0xD0, 0xD4, 0x5C, 0x6C, 0x3C, 0xA0, 0x43, 0x89, 0x4F, 0xEA, 0xE9, 0xB6, 0x5C, 0xC3, 0xD6, 0x18, 0x62, 0xD2, 0x62, 0xE0, 0x3E, 0x71, 0x19, 0xA1, 0xDA, 0x0E], [UInt8](SHA256.hash(data: storage.children["__substg1.0_3001001F"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_3001001F"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__substg1.0_0FF90102", storage.children["__substg1.0_0FF90102"]!.name)
                    XCTAssertEqual(0x0000000000000004, storage.children["__substg1.0_0FF90102"]!.count)
                    XCTAssertEqual([0xDF, 0x3F, 0x61, 0x98, 0x04, 0xA9, 0x2F, 0xDB, 0x40, 0x57, 0x19, 0x2D, 0xC4, 0x3D, 0xD7, 0x48, 0xEA, 0x77, 0x8A, 0xDC, 0x52, 0xBC, 0x49, 0x8C, 0xE8, 0x05, 0x24, 0xC0, 0x14, 0xB8, 0x11, 0x19], [UInt8](SHA256.hash(data: storage.children["__substg1.0_0FF90102"]!.data)))
                    do {
                        var storage = storage.children["__substg1.0_0FF90102"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("__properties_version1.0", storage.children["__properties_version1.0"]!.name)
                    XCTAssertEqual(0x0000000000000148, storage.children["__properties_version1.0"]!.count)
                    XCTAssertEqual([0x6D, 0x9E, 0x84, 0x2F, 0x92, 0x27, 0xF4, 0x95, 0x17, 0xC7, 0xC4, 0x4F, 0xDD, 0xD6, 0xE9, 0xE8, 0xA9, 0x4F, 0xD8, 0x28, 0x4C, 0xEE, 0x39, 0xE5, 0xC6, 0xBC, 0x10, 0x51, 0x8A, 0x84, 0x68, 0xF6], [UInt8](SHA256.hash(data: storage.children["__properties_version1.0"]!.data)))
                    do {
                        var storage = storage.children["__properties_version1.0"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }
            }
        }
        do {
            /* hughbe */
            let file = try CompoundFile(data: try getData(name: "sample", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000E00, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(7, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x000000000000B636, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x12, 0x7F, 0x63, 0xE0, 0x7F, 0xAD, 0x64, 0x9C, 0x66, 0x1F, 0x37, 0xF5, 0x7B, 0x1B, 0xBB, 0x90, 0xA1, 0xCC, 0x05, 0x98, 0x06, 0xC8, 0x96, 0x46, 0x83, 0xE9, 0x52, 0x6B, 0x9D, 0xAA, 0xC7, 0x2E], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("ObjectPool", storage.children["ObjectPool"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["ObjectPool"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["ObjectPool"]!.data)))
                do {
                    var storage = storage.children["ObjectPool"]!
                    XCTAssertEqual(2, storage.children.count)
                    XCTAssertEqual("_1079260234", storage.children["_1079260234"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1079260234"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1079260234"]!.data)))
                    do {
                        var storage = storage.children["_1079260234"]!
                        XCTAssertEqual(4, storage.children.count)
                        XCTAssertEqual("Equation Native", storage.children["Equation Native"]!.name)
                        XCTAssertEqual(0x000000000000020C, storage.children["Equation Native"]!.count)
                        XCTAssertEqual([0xBF, 0x9C, 0xB7, 0x17, 0x6D, 0x26, 0xE8, 0x20, 0x4E, 0x82, 0x45, 0x24, 0x83, 0x5B, 0x9E, 0x75, 0xE5, 0x68, 0x90, 0x18, 0x61, 0x13, 0xF9, 0xE8, 0x50, 0xE6, 0xFD, 0x79, 0x2B, 0x9F, 0x44, 0x89], [UInt8](SHA256.hash(data: storage.children["Equation Native"]!.data)))
                        do {
                            var storage = storage.children["Equation Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x11, 0x12, 0xDA, 0x16, 0xEB, 0x08, 0x1D, 0x8D, 0x3D, 0xED, 0xF4, 0xCF, 0xB3, 0x1F, 0xB1, 0x0F, 0x96, 0xD7, 0x13, 0x98, 0x81, 0x36, 0xDA, 0x3D, 0xC0, 0x0E, 0x9F, 0x0C, 0x8D, 0xEF, 0x0E, 0x0E], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x0000000000000066, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0x52, 0x63, 0xA9, 0x2F, 0xB4, 0x46, 0x18, 0x57, 0x87, 0xC1, 0x79, 0x26, 0x39, 0x34, 0xF9, 0xBB, 0x37, 0xE4, 0x20, 0x5C, 0x4B, 0x80, 0x67, 0xD3, 0xC1, 0x47, 0x62, 0x09, 0x16, 0xAE, 0xA7, 0xA0], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("_1079260227", storage.children["_1079260227"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1079260227"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1079260227"]!.data)))
                    do {
                        var storage = storage.children["_1079260227"]!
                        XCTAssertEqual(4, storage.children.count)
                        XCTAssertEqual("Equation Native", storage.children["Equation Native"]!.name)
                        XCTAssertEqual(0x000000000000002C, storage.children["Equation Native"]!.count)
                        XCTAssertEqual([0xBD, 0xEE, 0x52, 0x6C, 0x67, 0x39, 0xB1, 0xD3, 0x7E, 0xE2, 0x7C, 0x7A, 0x2D, 0xAA, 0xD0, 0x64, 0xE3, 0xFD, 0x6B, 0xE9, 0x81, 0xD9, 0x39, 0xA3, 0x28, 0xBE, 0xFF, 0x1F, 0x82, 0x7C, 0x98, 0x4D], [UInt8](SHA256.hash(data: storage.children["Equation Native"]!.data)))
                        do {
                            var storage = storage.children["Equation Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x11, 0x12, 0xDA, 0x16, 0xEB, 0x08, 0x1D, 0x8D, 0x3D, 0xED, 0xF4, 0xCF, 0xB3, 0x1F, 0xB1, 0x0F, 0x96, 0xD7, 0x13, 0x98, 0x81, 0x36, 0xDA, 0x3D, 0xC0, 0x0E, 0x9F, 0x0C, 0x8D, 0xEF, 0x0E, 0x0E], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x0000000000000066, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0x52, 0x63, 0xA9, 0x2F, 0xB4, 0x46, 0x18, 0x57, 0x87, 0xC1, 0x79, 0x26, 0x39, 0x34, 0xF9, 0xBB, 0x37, 0xE4, 0x20, 0x5C, 0x4B, 0x80, 0x67, 0xD3, 0xC1, 0x47, 0x62, 0x09, 0x16, 0xAE, 0xA7, 0xA0], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000003BA2, storage.children["Data"]!.count)
                XCTAssertEqual([0xFD, 0x0D, 0xFB, 0xD2, 0xB1, 0xAF, 0xF8, 0x2A, 0x13, 0x65, 0x3E, 0xD6, 0xEC, 0xA7, 0xF0, 0x26, 0x5C, 0x28, 0xE0, 0x9F, 0x22, 0xED, 0x0A, 0xDC, 0x6D, 0x05, 0xDF, 0x2B, 0x2C, 0x82, 0x95, 0xAE], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000006AEF, storage.children["1Table"]!.count)
                XCTAssertEqual([0x2A, 0xAD, 0x2A, 0xCC, 0x15, 0xD0, 0x32, 0x3A, 0x89, 0x04, 0x70, 0x55, 0xBD, 0xEB, 0x59, 0x18, 0x88, 0xD1, 0x1B, 0x41, 0xAC, 0x98, 0x12, 0xAA, 0x01, 0xEA, 0x7A, 0x75, 0x1C, 0x3F, 0xCB, 0x99], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001D0, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x1E, 0xEF, 0xA1, 0x2F, 0xEE, 0x39, 0x6F, 0x47, 0xC4, 0xA1, 0x06, 0xBF, 0x86, 0x28, 0x73, 0xBE, 0x4A, 0xAD, 0xA6, 0x09, 0x7A, 0x11, 0x1C, 0x29, 0xD3, 0x87, 0x5A, 0xC6, 0x4E, 0x31, 0x16, 0x7D], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000006FC, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x4A, 0xC7, 0x39, 0x21, 0x82, 0xF3, 0x21, 0x06, 0x90, 0xBE, 0x73, 0x95, 0x7E, 0x6F, 0x5C, 0x64, 0xDB, 0x6F, 0x47, 0x9A, 0x38, 0x29, 0x8A, 0x98, 0xA3, 0x9B, 0x98, 0x5D, 0xC7, 0xDD, 0x53, 0xC9], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000006A, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x6F, 0x1E, 0xC7, 0x17, 0xCD, 0x67, 0x1C, 0x4E, 0x65, 0x32, 0x1A, 0x11, 0x29, 0xF6, 0xFE, 0x30, 0x36, 0xE0, 0xEF, 0xFC, 0x4F, 0x87, 0xB3, 0xC7, 0x21, 0x60, 0xEE, 0xED, 0x71, 0x48, 0x37, 0x60], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "1", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000A80, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(5, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x000000000000000C, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0xAD, 0x5D, 0xC1, 0x47, 0x8D, 0xE0, 0x6A, 0x4C, 0x27, 0x28, 0xEA, 0x52, 0x8B, 0xD9, 0x36, 0x1A, 0x4B, 0x94, 0x5E, 0x92, 0xA4, 0x14, 0xBF, 0x4D, 0x18, 0x0C, 0xED, 0xAA, 0xEA, 0xA5, 0xF4, 0xCC], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL2", storage.children["TL2"]!.name)
                XCTAssertEqual(0x000000000000020E, storage.children["TL2"]!.count)
                XCTAssertEqual([0xD0, 0xF8, 0xA1, 0xE0, 0xA0, 0x70, 0x7A, 0xD4, 0x7D, 0x9D, 0xD2, 0x7D, 0xB1, 0xB6, 0x17, 0x48, 0x84, 0x20, 0xB2, 0xA8, 0xFA, 0x7E, 0xBC, 0xC9, 0x04, 0xF2, 0xAA, 0x31, 0x91, 0x4C, 0xCF, 0xE8], [UInt8](SHA256.hash(data: storage.children["TL2"]!.data)))
                do {
                    var storage = storage.children["TL2"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x0000000000000206, storage.children["TL1"]!.count)
                XCTAssertEqual([0xBC, 0xD7, 0xAE, 0x7B, 0x1A, 0x96, 0x6F, 0x89, 0xA3, 0xFE, 0x68, 0x6D, 0x76, 0x21, 0x11, 0x00, 0x04, 0x21, 0xB6, 0x42, 0x70, 0xF1, 0xCE, 0xCE, 0x32, 0x18, 0x27, 0x92, 0x10, 0x8F, 0x63, 0x3F], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x000000000000020E, storage.children["TL0"]!.count)
                XCTAssertEqual([0x9C, 0x14, 0x4D, 0xBD, 0x91, 0x4C, 0xE6, 0x09, 0xF4, 0xCC, 0xF2, 0xCD, 0x8B, 0x97, 0xAD, 0x32, 0xDA, 0x05, 0xE6, 0x5B, 0x86, 0xB4, 0xB7, 0x05, 0x9D, 0x2B, 0x68, 0xE6, 0x7A, 0x35, 0x7A, 0x36], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x0000000000000344, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0x45, 0xFD, 0xC9, 0x3B, 0x3F, 0x79, 0xF8, 0x9D, 0x29, 0xF1, 0xE8, 0x80, 0xCF, 0xE1, 0x5E, 0xA6, 0xE6, 0x10, 0x82, 0x4F, 0xA5, 0x0C, 0x03, 0x3F, 0x46, 0xDC, 0x54, 0x00, 0xC5, 0x1F, 0xED, 0x60], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "2", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000003C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0x01, 0xAC, 0xEC, 0xB5, 0x07, 0xAB, 0xFE, 0x1A, 0x35, 0x4A, 0xA8, 0x06, 0x4F, 0x4A, 0xF5, 0xD3, 0xF1, 0xAC, 0xD0, 0x19, 0xE3, 0x7D, 0xB3, 0xC1, 0x1C, 0x97, 0x52, 0x3B, 0x71, 0xC7, 0x6E, 0x9D], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x00000000000000C0, storage.children["TL1"]!.count)
                XCTAssertEqual([0x2F, 0x51, 0xB5, 0x49, 0x11, 0x41, 0x6F, 0x1E, 0x31, 0x35, 0xA2, 0x52, 0x59, 0x4C, 0x6C, 0x1F, 0x23, 0x03, 0x7D, 0x83, 0x66, 0xD2, 0xD3, 0xB5, 0x6B, 0xD7, 0xA2, 0x6E, 0x9D, 0xF5, 0x77, 0x72], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x00000000000000F0, storage.children["TL0"]!.count)
                XCTAssertEqual([0x14, 0x0E, 0xF2, 0xBD, 0x22, 0x9C, 0x6F, 0x94, 0x4B, 0x33, 0x4C, 0xF9, 0xE3, 0xDA, 0xB5, 0x91, 0x91, 0xCE, 0x84, 0x48, 0xDC, 0xF4, 0x2E, 0xCE, 0x38, 0x54, 0x14, 0x01, 0x1C, 0xB6, 0x2D, 0x3B], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x00000000000001BC, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0x4E, 0xFD, 0x17, 0xBB, 0x45, 0xDB, 0x2E, 0xF6, 0x4E, 0xCC, 0xE2, 0x7F, 0x4E, 0xDB, 0xD3, 0x37, 0x81, 0xEA, 0x19, 0xEF, 0xE6, 0x79, 0xD1, 0xE4, 0x6A, 0xC8, 0xC1, 0x1C, 0x5F, 0x25, 0x83, 0xBC], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "unicode", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000380, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x0000000000000008, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0x01, 0xAC, 0xEC, 0xB5, 0x07, 0xAB, 0xFE, 0x1A, 0x35, 0x4A, 0xA8, 0x06, 0x4F, 0x4A, 0xF5, 0xD3, 0xF1, 0xAC, 0xD0, 0x19, 0xE3, 0x7D, 0xB3, 0xC1, 0x1C, 0x97, 0x52, 0x3B, 0x71, 0xC7, 0x6E, 0x9D], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x00000000000000A0, storage.children["TL1"]!.count)
                XCTAssertEqual([0xEC, 0xDE, 0x44, 0x7C, 0xF3, 0x2B, 0xB9, 0x12, 0xC8, 0x37, 0x9D, 0xA7, 0xFF, 0x13, 0x5C, 0x33, 0x7D, 0x92, 0xC3, 0x9B, 0x68, 0xAD, 0x84, 0x2C, 0xBE, 0x71, 0xD3, 0x49, 0x10, 0xA1, 0x06, 0x5C], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x00000000000000BE, storage.children["TL0"]!.count)
                XCTAssertEqual([0xF4, 0xC9, 0xA6, 0x17, 0xD4, 0x5C, 0xB1, 0x58, 0x99, 0xEC, 0x51, 0x91, 0xCA, 0xFA, 0x27, 0x16, 0x2A, 0x11, 0x41, 0x56, 0x4F, 0x56, 0xA1, 0xF0, 0xED, 0x2F, 0xF6, 0x54, 0xE7, 0x71, 0xBA, 0x31], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x0000000000000198, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0x5C, 0xBF, 0x3E, 0xF0, 0x84, 0x1A, 0x9C, 0x3C, 0xDF, 0x08, 0xAB, 0xDC, 0x0B, 0x20, 0x26, 0x80, 0xBA, 0x5D, 0xFB, 0xDF, 0xA9, 0x10, 0x09, 0xBE, 0x0B, 0xC5, 0x5F, 0xC7, 0xBB, 0xE4, 0x08, 0x95], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "{B85C5677-E8BC-11E4-825B-10604B7CB9F0}", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000880, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(5, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x000000000000000C, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0xAD, 0x5D, 0xC1, 0x47, 0x8D, 0xE0, 0x6A, 0x4C, 0x27, 0x28, 0xEA, 0x52, 0x8B, 0xD9, 0x36, 0x1A, 0x4B, 0x94, 0x5E, 0x92, 0xA4, 0x14, 0xBF, 0x4D, 0x18, 0x0C, 0xED, 0xAA, 0xEA, 0xA5, 0xF4, 0xCC], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL2", storage.children["TL2"]!.name)
                XCTAssertEqual(0x00000000000001D8, storage.children["TL2"]!.count)
                XCTAssertEqual([0x6D, 0xE1, 0xFC, 0x17, 0x9A, 0x3F, 0x99, 0x6F, 0xAC, 0xAE, 0x0A, 0xAE, 0x02, 0x54, 0xE9, 0xAA, 0x48, 0xCF, 0x12, 0x1E, 0x86, 0x7B, 0xDB, 0x88, 0x1B, 0xE2, 0xBB, 0x9F, 0xB1, 0xDE, 0x74, 0xE8], [UInt8](SHA256.hash(data: storage.children["TL2"]!.data)))
                do {
                    var storage = storage.children["TL2"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x0000000000000174, storage.children["TL1"]!.count)
                XCTAssertEqual([0x44, 0xB7, 0x14, 0x0A, 0x32, 0xD6, 0x45, 0xB8, 0xDA, 0xD9, 0x8F, 0x69, 0xAE, 0x97, 0x5B, 0x85, 0x8C, 0x82, 0x74, 0xB0, 0x7C, 0x86, 0x04, 0x73, 0x0E, 0xBD, 0x47, 0x69, 0x58, 0x42, 0x4F, 0x88], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x0000000000000168, storage.children["TL0"]!.count)
                XCTAssertEqual([0xA1, 0x75, 0x9C, 0x82, 0x1E, 0x2C, 0x73, 0x6A, 0x76, 0x2D, 0x1A, 0x37, 0xFE, 0x87, 0x7F, 0xDB, 0xC2, 0x61, 0xF9, 0xEB, 0xCC, 0xC0, 0xB0, 0x26, 0xA6, 0xBD, 0xFB, 0xE1, 0x21, 0xDB, 0xD5, 0x10], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x000000000000031C, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0x03, 0xCD, 0x8F, 0x58, 0x71, 0xF5, 0x88, 0xC2, 0x04, 0x81, 0x40, 0xEB, 0x12, 0x2D, 0x5D, 0x11, 0xD3, 0x35, 0xBA, 0x96, 0x66, 0x29, 0x40, 0xCA, 0xC3, 0x0D, 0x97, 0xDF, 0x6A, 0x4E, 0x7B, 0xBB], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "{BC59C035-E8AC-11E4-825B-10604B7CB9F0}", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000CC0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(9, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x000000000000001C, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0xB6, 0xFE, 0x7E, 0xAD, 0x3C, 0xD2, 0x54, 0xAB, 0x50, 0xF5, 0x6D, 0x14, 0x1B, 0x83, 0x0B, 0x48, 0x4E, 0x62, 0x26, 0x47, 0x1B, 0xD8, 0x98, 0x4C, 0x86, 0xB2, 0xF7, 0x3D, 0xE6, 0x5E, 0xB7, 0x14], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL7", storage.children["TL7"]!.name)
                XCTAssertEqual(0x00000000000000E8, storage.children["TL7"]!.count)
                XCTAssertEqual([0x3E, 0xA2, 0xD9, 0x39, 0xD8, 0x0A, 0xB3, 0x42, 0xDE, 0xC7, 0x2B, 0x2E, 0x52, 0xF2, 0x96, 0x74, 0x50, 0x1F, 0x81, 0x78, 0x41, 0xB0, 0x95, 0xE6, 0xA2, 0x5A, 0xEC, 0x56, 0x40, 0x46, 0x01, 0x07], [UInt8](SHA256.hash(data: storage.children["TL7"]!.data)))
                do {
                    var storage = storage.children["TL7"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL5", storage.children["TL5"]!.name)
                XCTAssertEqual(0x00000000000000EA, storage.children["TL5"]!.count)
                XCTAssertEqual([0xD5, 0xF3, 0x6C, 0x42, 0xEA, 0xCC, 0xBC, 0xCF, 0x23, 0x08, 0xF8, 0xB9, 0x70, 0x9D, 0x64, 0x4D, 0x6B, 0x3F, 0x03, 0x65, 0x3A, 0x3D, 0xD3, 0x2F, 0x31, 0x8A, 0x81, 0xCB, 0x33, 0x49, 0xE5, 0x09], [UInt8](SHA256.hash(data: storage.children["TL5"]!.data)))
                do {
                    var storage = storage.children["TL5"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL4", storage.children["TL4"]!.name)
                XCTAssertEqual(0x00000000000000E6, storage.children["TL4"]!.count)
                XCTAssertEqual([0x07, 0x32, 0x08, 0x85, 0x48, 0xB3, 0xEE, 0xEA, 0x99, 0xD7, 0x56, 0x50, 0x7A, 0xD9, 0xF1, 0x86, 0x95, 0x70, 0xE8, 0x06, 0xA9, 0xE2, 0x18, 0xC8, 0xC2, 0xAA, 0x09, 0xE5, 0x06, 0x15, 0xB5, 0xCD], [UInt8](SHA256.hash(data: storage.children["TL4"]!.data)))
                do {
                    var storage = storage.children["TL4"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL3", storage.children["TL3"]!.name)
                XCTAssertEqual(0x0000000000000114, storage.children["TL3"]!.count)
                XCTAssertEqual([0x8F, 0x83, 0x7B, 0xF6, 0x71, 0xFD, 0xEC, 0xFB, 0x1A, 0x86, 0x90, 0x42, 0x50, 0x09, 0xB3, 0xED, 0x88, 0x20, 0x55, 0x9F, 0x0F, 0xBA, 0x0D, 0xB9, 0x40, 0x2B, 0x4D, 0x43, 0xF5, 0x4D, 0x1D, 0xC1], [UInt8](SHA256.hash(data: storage.children["TL3"]!.data)))
                do {
                    var storage = storage.children["TL3"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL2", storage.children["TL2"]!.name)
                XCTAssertEqual(0x00000000000000E6, storage.children["TL2"]!.count)
                XCTAssertEqual([0x3C, 0xC3, 0x20, 0x20, 0x56, 0x5E, 0x5C, 0x9A, 0x35, 0xFE, 0x18, 0xE2, 0xE2, 0xF8, 0x7D, 0xC7, 0xD2, 0x8E, 0xA7, 0x5B, 0xF8, 0x86, 0x56, 0xDE, 0x0C, 0x71, 0xC0, 0x84, 0x95, 0x6E, 0x70, 0x12], [UInt8](SHA256.hash(data: storage.children["TL2"]!.data)))
                do {
                    var storage = storage.children["TL2"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x00000000000000D4, storage.children["TL1"]!.count)
                XCTAssertEqual([0xF4, 0x75, 0x38, 0x60, 0xD2, 0x5B, 0xDF, 0x65, 0x1A, 0x66, 0xD5, 0xC1, 0x5E, 0x37, 0x6E, 0xFB, 0x9A, 0x5C, 0xBD, 0xCB, 0xC0, 0x24, 0x8E, 0xDF, 0x4C, 0x27, 0xE6, 0x19, 0x48, 0x0D, 0xCB, 0xA4], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x0000000000000420, storage.children["TL0"]!.count)
                XCTAssertEqual([0xA6, 0xA6, 0x02, 0x25, 0x08, 0xCE, 0x8C, 0x56, 0x60, 0xE0, 0x01, 0x92, 0xC2, 0xB2, 0x4D, 0x8E, 0xDF, 0xC6, 0x11, 0xC5, 0xA3, 0x97, 0x96, 0x37, 0x5D, 0xED, 0xB2, 0xD9, 0xBB, 0xAD, 0x11, 0xD5], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x00000000000001E4, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0x1C, 0xED, 0x60, 0x7A, 0xD9, 0x88, 0x1A, 0x59, 0xED, 0xBF, 0x85, 0x19, 0x3F, 0x6E, 0xC2, 0x97, 0x36, 0xBD, 0x7D, 0xD7, 0x63, 0x71, 0x60, 0xAD, 0xAE, 0x5C, 0x72, 0x2E, 0x57, 0x21, 0x4F, 0x94], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* microsoft/compoundfilereader */
            let file = try CompoundFile(data: try getData(name: "{FE554E21-EA21-11E4-825B-10604B7CB9F0}", fileExtension: "dat"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000D80, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(11, storage.children.count)
                XCTAssertEqual("TravelLog", storage.children["TravelLog"]!.name)
                XCTAssertEqual(0x0000000000000024, storage.children["TravelLog"]!.count)
                XCTAssertEqual([0x92, 0x1C, 0x80, 0x3A, 0xBF, 0xA6, 0xAC, 0x88, 0xF4, 0x4F, 0x7A, 0xB1, 0x91, 0x98, 0xE5, 0xC1, 0x37, 0xD1, 0xC7, 0x18, 0x3E, 0x8E, 0x69, 0x12, 0x75, 0x7A, 0x62, 0x63, 0xE8, 0xDE, 0xE0, 0xA5], [UInt8](SHA256.hash(data: storage.children["TravelLog"]!.data)))
                do {
                    var storage = storage.children["TravelLog"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL8", storage.children["TL8"]!.name)
                XCTAssertEqual(0x00000000000001A8, storage.children["TL8"]!.count)
                XCTAssertEqual([0x2E, 0xCE, 0x5B, 0x5E, 0xBC, 0x09, 0xBD, 0xEB, 0xC0, 0x2B, 0x30, 0x69, 0x39, 0x28, 0x4A, 0x36, 0x98, 0xDC, 0x15, 0x15, 0x8A, 0xD1, 0x42, 0xFD, 0x9C, 0xD2, 0x2F, 0x0A, 0x89, 0xCF, 0x8D, 0xFA], [UInt8](SHA256.hash(data: storage.children["TL8"]!.data)))
                do {
                    var storage = storage.children["TL8"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL7", storage.children["TL7"]!.name)
                XCTAssertEqual(0x00000000000000A0, storage.children["TL7"]!.count)
                XCTAssertEqual([0xEC, 0xDE, 0x44, 0x7C, 0xF3, 0x2B, 0xB9, 0x12, 0xC8, 0x37, 0x9D, 0xA7, 0xFF, 0x13, 0x5C, 0x33, 0x7D, 0x92, 0xC3, 0x9B, 0x68, 0xAD, 0x84, 0x2C, 0xBE, 0x71, 0xD3, 0x49, 0x10, 0xA1, 0x06, 0x5C], [UInt8](SHA256.hash(data: storage.children["TL7"]!.data)))
                do {
                    var storage = storage.children["TL7"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL6", storage.children["TL6"]!.name)
                XCTAssertEqual(0x00000000000000E4, storage.children["TL6"]!.count)
                XCTAssertEqual([0x69, 0xDF, 0xE1, 0x4C, 0x4D, 0xB2, 0x2E, 0xFD, 0xEA, 0xBD, 0xC1, 0xE8, 0x23, 0x4E, 0xA9, 0x42, 0xFE, 0x17, 0xDE, 0xD7, 0x1C, 0x76, 0x27, 0x19, 0x93, 0x64, 0x26, 0xF5, 0x07, 0x96, 0xA5, 0x0E], [UInt8](SHA256.hash(data: storage.children["TL6"]!.data)))
                do {
                    var storage = storage.children["TL6"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL5", storage.children["TL5"]!.name)
                XCTAssertEqual(0x00000000000000A0, storage.children["TL5"]!.count)
                XCTAssertEqual([0xEC, 0xDE, 0x44, 0x7C, 0xF3, 0x2B, 0xB9, 0x12, 0xC8, 0x37, 0x9D, 0xA7, 0xFF, 0x13, 0x5C, 0x33, 0x7D, 0x92, 0xC3, 0x9B, 0x68, 0xAD, 0x84, 0x2C, 0xBE, 0x71, 0xD3, 0x49, 0x10, 0xA1, 0x06, 0x5C], [UInt8](SHA256.hash(data: storage.children["TL5"]!.data)))
                do {
                    var storage = storage.children["TL5"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL4", storage.children["TL4"]!.name)
                XCTAssertEqual(0x0000000000000100, storage.children["TL4"]!.count)
                XCTAssertEqual([0x04, 0xAA, 0xB2, 0x76, 0x89, 0x65, 0x23, 0xBE, 0x4B, 0xD0, 0x5F, 0x56, 0x5E, 0x31, 0x42, 0xB4, 0x0C, 0x65, 0x20, 0xCB, 0xE1, 0x21, 0xB7, 0xC4, 0x1A, 0xD3, 0x9D, 0x4E, 0x01, 0xB0, 0xE6, 0xC6], [UInt8](SHA256.hash(data: storage.children["TL4"]!.data)))
                do {
                    var storage = storage.children["TL4"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL3", storage.children["TL3"]!.name)
                XCTAssertEqual(0x00000000000000C4, storage.children["TL3"]!.count)
                XCTAssertEqual([0xEC, 0xD3, 0x33, 0x3F, 0xEA, 0x54, 0x31, 0x8D, 0x04, 0xB5, 0x82, 0xE5, 0x0B, 0xD4, 0xF0, 0x32, 0x7F, 0x2F, 0x4A, 0xB0, 0x87, 0x42, 0xCC, 0x34, 0x9D, 0x32, 0x03, 0x2D, 0x60, 0x92, 0xC1, 0x4A], [UInt8](SHA256.hash(data: storage.children["TL3"]!.data)))
                do {
                    var storage = storage.children["TL3"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL2", storage.children["TL2"]!.name)
                XCTAssertEqual(0x00000000000000A0, storage.children["TL2"]!.count)
                XCTAssertEqual([0xEC, 0xDE, 0x44, 0x7C, 0xF3, 0x2B, 0xB9, 0x12, 0xC8, 0x37, 0x9D, 0xA7, 0xFF, 0x13, 0x5C, 0x33, 0x7D, 0x92, 0xC3, 0x9B, 0x68, 0xAD, 0x84, 0x2C, 0xBE, 0x71, 0xD3, 0x49, 0x10, 0xA1, 0x06, 0x5C], [UInt8](SHA256.hash(data: storage.children["TL2"]!.data)))
                do {
                    var storage = storage.children["TL2"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL1", storage.children["TL1"]!.name)
                XCTAssertEqual(0x00000000000000F4, storage.children["TL1"]!.count)
                XCTAssertEqual([0x06, 0xCC, 0xF3, 0xBC, 0x01, 0x28, 0x77, 0x4B, 0x33, 0xA2, 0x18, 0x29, 0xA0, 0x02, 0x4F, 0x57, 0x29, 0x03, 0xF7, 0xD0, 0x19, 0xEA, 0xFB, 0x66, 0xFC, 0xE0, 0x31, 0x31, 0xC3, 0x57, 0xB3, 0xC4], [UInt8](SHA256.hash(data: storage.children["TL1"]!.data)))
                do {
                    var storage = storage.children["TL1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("TL0", storage.children["TL0"]!.name)
                XCTAssertEqual(0x00000000000001C6, storage.children["TL0"]!.count)
                XCTAssertEqual([0x58, 0x07, 0x3E, 0xB0, 0x4D, 0x34, 0x1D, 0x79, 0xBC, 0x25, 0x03, 0xA6, 0xEF, 0x78, 0x34, 0x17, 0xAC, 0x23, 0x4D, 0x11, 0x30, 0x89, 0xA0, 0x87, 0xAD, 0xF9, 0xB1, 0xEB, 0x05, 0x6E, 0x08, 0x37], [UInt8](SHA256.hash(data: storage.children["TL0"]!.data)))
                do {
                    var storage = storage.children["TL0"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe", storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.name)
                XCTAssertEqual(0x0000000000000330, storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.count)
                XCTAssertEqual([0xFA, 0x22, 0xC6, 0xF3, 0xB3, 0xF5, 0x2D, 0x6C, 0xAD, 0x5D, 0x56, 0x85, 0xB7, 0x18, 0x35, 0xDF, 0xF5, 0xC6, 0x71, 0xB6, 0x88, 0x45, 0xCA, 0x8D, 0x5D, 0xA7, 0x87, 0x6C, 0x76, 0x52, 0x56, 0x82], [UInt8](SHA256.hash(data: storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!.data)))
                do {
                    var storage = storage.children["\u{05}Xrpnqgkd0qyouogaTj5jpe4dEe"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "poWEr.prelim", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x00000000000070A9, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x31, 0x17, 0x5A, 0x56, 0x11, 0xB6, 0xA5, 0x74, 0x05, 0x8D, 0x15, 0xA8, 0xE7, 0x0F, 0xC2, 0xEF, 0x8A, 0x2B, 0x53, 0xB0, 0x85, 0x19, 0x4D, 0xD0, 0x3C, 0x49, 0x46, 0xCF, 0x83, 0x1C, 0x72, 0x9C], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xFE, 0xC7, 0x3E, 0xA1, 0x2E, 0x32, 0xA3, 0xD4, 0xBF, 0x3F, 0x9A, 0xA0, 0x0C, 0x63, 0xA2, 0xB4, 0x7D, 0x80, 0xA2, 0x91, 0x0E, 0x5A, 0x7C, 0x8E, 0x09, 0xDD, 0xBB, 0x9C, 0xFA, 0x95, 0xF9, 0x89], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["1Table"]!.count)
                XCTAssertEqual([0x3A, 0x8E, 0x51, 0x78, 0x79, 0x7E, 0x2F, 0xE3, 0x7E, 0x06, 0x59, 0x0E, 0x80, 0x51, 0x06, 0xB7, 0xFA, 0xD1, 0xF4, 0xC0, 0x28, 0xDF, 0xA5, 0x68, 0x6E, 0x1E, 0xCA, 0x34, 0xD6, 0x4E, 0xA0, 0xB5], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x99, 0x7A, 0xFB, 0xB5, 0x20, 0x4D, 0x21, 0xA7, 0x07, 0xD0, 0xDD, 0x22, 0xE5, 0x59, 0x8B, 0x87, 0x07, 0x1B, 0x54, 0xD8, 0xF8, 0xDC, 0x66, 0xB7, 0x05, 0xDA, 0x76, 0x73, 0x67, 0x29, 0x61, 0x10], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x02, 0xC9, 0xE2, 0x2C, 0x41, 0x76, 0x34, 0x21, 0x31, 0x22, 0x45, 0x9D, 0x00, 0xC3, 0x43, 0x49, 0xCB, 0x3F, 0x4A, 0x07, 0x48, 0x30, 0x2A, 0x1B, 0x65, 0xB9, 0x1C, 0x7D, 0xFC, 0x0E, 0x30, 0x83], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000058, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x20, 0xD1, 0xAC, 0x2D, 0xEE, 0x52, 0x1B, 0x0B, 0x47, 0x10, 0xFC, 0x0A, 0x6F, 0x1F, 0xE0, 0x0B, 0xD4, 0x52, 0xA9, 0xAE, 0x41, 0xA1, 0x50, 0x0B, 0x53, 0x90, 0xD0, 0x32, 0x7A, 0x34, 0x99, 0xDA], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "report", fileExtension: "xls"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000002C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("Workbook", storage.children["Workbook"]!.name)
                XCTAssertEqual(0x00000000000033E7, storage.children["Workbook"]!.count)
                XCTAssertEqual([0x60, 0xA3, 0xB9, 0x73, 0x7C, 0x3D, 0x15, 0x6E, 0xC1, 0x49, 0xB4, 0x35, 0x37, 0xE8, 0xBA, 0xFF, 0x7F, 0x9E, 0x2C, 0xB7, 0x1E, 0x4D, 0xA4, 0xEB, 0x52, 0x75, 0xCB, 0x0C, 0x2F, 0x7C, 0x82, 0x76], [UInt8](SHA256.hash(data: storage.children["Workbook"]!.data)))
                do {
                    var storage = storage.children["Workbook"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000000E8, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xE2, 0x78, 0x18, 0xF6, 0x74, 0xCF, 0xF7, 0x04, 0x78, 0xC8, 0xE8, 0x73, 0x46, 0x76, 0x4B, 0xAB, 0x27, 0x34, 0xF2, 0x21, 0x07, 0x1A, 0x1D, 0x3D, 0x7A, 0x39, 0xD4, 0x5D, 0x7D, 0x59, 0x08, 0xFB], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000108, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x4E, 0x87, 0xFF, 0x11, 0x9C, 0x7B, 0x62, 0x5C, 0xA8, 0x9F, 0xC8, 0x9D, 0xB4, 0x02, 0x2C, 0x05, 0x66, 0x5E, 0x21, 0xF9, 0xCF, 0xF1, 0xAB, 0xFE, 0x0C, 0x93, 0x2F, 0xFC, 0x6B, 0xF4, 0x58, 0x58], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000072, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x67, 0xE8, 0x42, 0x47, 0xAA, 0x56, 0xFC, 0x6C, 0xB4, 0x73, 0x50, 0x58, 0xBB, 0x59, 0x26, 0x0C, 0x84, 0xA9, 0x6D, 0xF6, 0xE8, 0x7B, 0xA9, 0xAA, 0x5A, 0xEA, 0x57, 0xA0, 0x61, 0x44, 0x87, 0x1B], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "testbad", fileExtension: "ole"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(2, storage.children.count)
                XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                XCTAssertEqual(0x00000000000046DC, storage.children["\u{01}Ole10Native"]!.count)
                XCTAssertEqual([0x59, 0x38, 0xF4, 0x46, 0x75, 0x0F, 0xD0, 0x3E, 0xBA, 0x11, 0x7C, 0x1A, 0x05, 0x9F, 0xAC, 0xC2, 0xEF, 0x0C, 0xC5, 0xCC, 0x29, 0xF7, 0x25, 0x0D, 0x7E, 0xB2, 0xF6, 0x84, 0xD5, 0x4D, 0x39, 0x0B], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                do {
                    var storage = storage.children["\u{01}Ole10Native"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000004C, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0xD5, 0x77, 0xD5, 0x8B, 0x8F, 0x8C, 0xE1, 0x93, 0x10, 0x79, 0xA4, 0x31, 0x7F, 0x44, 0x3F, 0xAB, 0x52, 0xD2, 0x60, 0x27, 0x08, 0x96, 0x20, 0x8E, 0xCE, 0xE2, 0x2C, 0xD1, 0x6D, 0xFC, 0xD6, 0xFF], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "testgood", fileExtension: "ole"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000004C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(2, storage.children.count)
                XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                XCTAssertEqual(0x0000000000000421, storage.children["\u{01}Ole10Native"]!.count)
                XCTAssertEqual([0x16, 0x1E, 0x6A, 0xCC, 0x90, 0xD9, 0xC2, 0x53, 0xC9, 0x36, 0x7B, 0x91, 0xD7, 0x24, 0xF7, 0xEF, 0x6F, 0x76, 0x6F, 0x14, 0x89, 0xC4, 0x30, 0x43, 0x3A, 0x80, 0x80, 0xCE, 0x43, 0x86, 0x69, 0x48], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                do {
                    var storage = storage.children["\u{01}Ole10Native"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000004C, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0xD5, 0x77, 0xD5, 0x8B, 0x8F, 0x8C, 0xE1, 0x93, 0x10, 0x79, 0xA4, 0x31, 0x7F, 0x44, 0x3F, 0xAB, 0x52, 0xD2, 0x60, 0x27, 0x08, 0x96, 0x20, 0x8E, 0xCE, 0xE2, 0x2C, 0xD1, 0x6D, 0xFC, 0xD6, 0xFF], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* decalage2/olefile */
            let file = try CompoundFile(data: try getData(name: "test-ole-file", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(5, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x0A, 0xE3, 0x0E, 0x85, 0x03, 0xD5, 0xB7, 0x90, 0x34, 0x88, 0x3C, 0x73, 0x93, 0x0C, 0xBE, 0x52, 0x46, 0xEA, 0xF5, 0xCC, 0x0D, 0x22, 0x9F, 0x10, 0x9D, 0xFF, 0x5E, 0xEC, 0x0E, 0xFA, 0x63, 0xD2], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001926, storage.children["1Table"]!.count)
                XCTAssertEqual([0xFD, 0x02, 0xA4, 0xBD, 0x70, 0xA2, 0xA2, 0x21, 0x50, 0x9A, 0x32, 0xDA, 0xC3, 0x37, 0x8B, 0x78, 0x1F, 0x8D, 0x41, 0xEC, 0xFA, 0xA4, 0xAB, 0x40, 0x2D, 0x36, 0xD4, 0xB4, 0x9F, 0x1C, 0x80, 0x76], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xDE, 0x76, 0xAE, 0x07, 0xAF, 0xB9, 0x25, 0x8A, 0xD7, 0x4D, 0x3C, 0x9D, 0xF6, 0xF6, 0xBD, 0x1A, 0xAD, 0xE4, 0x74, 0xA0, 0x49, 0x21, 0x7D, 0x3E, 0x7E, 0x52, 0x1C, 0x33, 0xCC, 0xA1, 0xD0, 0x45], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0xA4, 0x95, 0x2F, 0x48, 0xC6, 0xD3, 0x18, 0x47, 0x1D, 0x3F, 0x89, 0x34, 0x27, 0xEE, 0x51, 0x5E, 0x56, 0xFE, 0x4C, 0xE5, 0xE6, 0x47, 0xD7, 0x75, 0x3A, 0xEE, 0x58, 0xA6, 0x40, 0x29, 0xDF, 0xC1], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000072, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0xF7, 0x0F, 0xE3, 0x84, 0xC6, 0x72, 0x86, 0x5F, 0xFF, 0x4B, 0xB8, 0xAB, 0x60, 0xD7, 0x30, 0x98, 0xBC, 0x75, 0x1E, 0x8F, 0x2A, 0xA9, 0x15, 0xB8, 0xAF, 0xF2, 0xE2, 0x08, 0x56, 0x48, 0xB4, 0x28], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "mediationform", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000003C36, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x43, 0xDE, 0x39, 0x54, 0x50, 0x77, 0x5C, 0xA5, 0x9B, 0xDA, 0xAF, 0xF2, 0xE1, 0x26, 0x59, 0xA5, 0x49, 0xED, 0x3C, 0xA3, 0x00, 0xA6, 0x0B, 0x09, 0x52, 0x31, 0xDD, 0x60, 0xC1, 0x14, 0x3E, 0x38], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xAD, 0x7F, 0xAC, 0xB2, 0x58, 0x6F, 0xC6, 0xE9, 0x66, 0xC0, 0x04, 0xD7, 0xD1, 0xD1, 0x6B, 0x02, 0x4F, 0x58, 0x05, 0xFF, 0x7C, 0xB4, 0x7C, 0x7A, 0x85, 0xDA, 0xBD, 0x8B, 0x48, 0x89, 0x2C, 0xA7], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x000000000000522F, storage.children["1Table"]!.count)
                XCTAssertEqual([0x61, 0x1C, 0x6C, 0x55, 0xE2, 0x22, 0xEE, 0x17, 0xE4, 0x11, 0xE4, 0xB7, 0x28, 0x4D, 0x12, 0x84, 0xBD, 0xC1, 0x95, 0xEB, 0x88, 0x6E, 0x1D, 0x0C, 0x2C, 0x45, 0xED, 0xDE, 0xC3, 0x1A, 0x23, 0x99], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xBB, 0x99, 0x49, 0x83, 0x37, 0x0B, 0x56, 0x70, 0xAD, 0xC2, 0xA2, 0x86, 0x76, 0x49, 0xCE, 0x55, 0xC0, 0x39, 0xB7, 0xF5, 0x1C, 0x71, 0x84, 0x9A, 0xB2, 0x85, 0x69, 0x74, 0xCE, 0x94, 0xE9, 0x72], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x73, 0x28, 0x4D, 0xA3, 0xE5, 0xE7, 0x72, 0xD8, 0x5A, 0xAD, 0x70, 0x67, 0x90, 0xBA, 0x31, 0x96, 0xF3, 0x64, 0x73, 0x13, 0x9F, 0x20, 0x2F, 0x02, 0xF9, 0x5B, 0xA3, 0x20, 0x2F, 0x2C, 0x81, 0x6B], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000079, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0xD8, 0x12, 0x9D, 0xE4, 0x28, 0x6D, 0xC4, 0xFD, 0x24, 0x5C, 0x77, 0x76, 0xB5, 0x1D, 0x76, 0xAA, 0xA7, 0x27, 0x95, 0x6E, 0x8F, 0xC8, 0x8F, 0xF9, 0x28, 0xEB, 0x69, 0xFF, 0x7F, 0xC1, 0x7E, 0x0B], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "mime001", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000002540, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(5, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000006E47, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0xF9, 0xCC, 0xBB, 0xF8, 0x63, 0x6D, 0x76, 0xED, 0x1E, 0x18, 0xB1, 0xE7, 0xA1, 0xED, 0x7F, 0xE7, 0xF1, 0x82, 0x1A, 0x2D, 0x0A, 0x84, 0x1C, 0xBE, 0x5E, 0x1E, 0x1C, 0x75, 0xFA, 0xCF, 0x7E, 0x42], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xAD, 0x7F, 0xAC, 0xB2, 0x58, 0x6F, 0xC6, 0xE9, 0x66, 0xC0, 0x04, 0xD7, 0xD1, 0xD1, 0x6B, 0x02, 0x4F, 0x58, 0x05, 0xFF, 0x7C, 0xB4, 0x7C, 0x7A, 0x85, 0xDA, 0xBD, 0x8B, 0x48, 0x89, 0x2C, 0xA7], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000000B88, storage.children["1Table"]!.count)
                XCTAssertEqual([0xB3, 0x7F, 0xD2, 0xE7, 0xC5, 0xEB, 0xE1, 0x06, 0x99, 0x37, 0x5F, 0xBB, 0xDA, 0x14, 0x3C, 0x97, 0xC1, 0x03, 0x21, 0x7E, 0x03, 0x21, 0xB7, 0xAA, 0x06, 0xEC, 0xEB, 0x68, 0x9F, 0x8C, 0x3D, 0x5D], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000198, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xF3, 0xA7, 0x16, 0x07, 0x5D, 0x2D, 0xC9, 0x26, 0xAC, 0xEE, 0x72, 0xC9, 0x22, 0xCD, 0xBF, 0xCB, 0x56, 0xB5, 0x43, 0xB8, 0xA9, 0x12, 0x1E, 0x33, 0xCC, 0x3A, 0xA3, 0xC7, 0x88, 0xD7, 0x65, 0x14], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001D0, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x1C, 0x88, 0x27, 0x9A, 0x1D, 0x0E, 0x56, 0xB0, 0xE3, 0x2B, 0x9C, 0xF2, 0xAD, 0x52, 0x24, 0xF3, 0x2B, 0x67, 0xE2, 0xA8, 0xE2, 0x48, 0xB4, 0x8F, 0x48, 0x40, 0xB3, 0x98, 0x48, 0xC6, 0x3B, 0xB0], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "2_MB-W", fileExtension: "ppt"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000000, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(5, storage.children.count)
                XCTAssertEqual("PowerPoint Document", storage.children["PowerPoint Document"]!.name)
                XCTAssertEqual(0x0000000000009DD5, storage.children["PowerPoint Document"]!.count)
                XCTAssertEqual([0x62, 0xC9, 0xD9, 0xF8, 0xFF, 0xDB, 0xA3, 0x90, 0x4F, 0x2D, 0x32, 0x37, 0xD3, 0x36, 0x92, 0x3F, 0x11, 0x38, 0x77, 0x14, 0x1E, 0x53, 0xA2, 0x07, 0x2A, 0x18, 0xB5, 0x07, 0x00, 0x2C, 0xD2, 0xDD], [UInt8](SHA256.hash(data: storage.children["PowerPoint Document"]!.data)))
                do {
                    var storage = storage.children["PowerPoint Document"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Pictures", storage.children["Pictures"]!.name)
                XCTAssertEqual(0x00000000001E0179, storage.children["Pictures"]!.count)
                XCTAssertEqual([0x69, 0x90, 0xF3, 0x8E, 0x4D, 0x24, 0x59, 0x49, 0x03, 0x02, 0x0E, 0x40, 0xFE, 0x8F, 0x16, 0x57, 0x15, 0x67, 0x6E, 0x3B, 0xC5, 0x6C, 0x76, 0x3D, 0xF4, 0x88, 0xA3, 0xF2, 0x1B, 0x7A, 0xFF, 0x8C], [UInt8](SHA256.hash(data: storage.children["Pictures"]!.data)))
                do {
                    var storage = storage.children["Pictures"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Current User", storage.children["Current User"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Current User"]!.count)
                XCTAssertEqual([0xCC, 0xD6, 0x61, 0x3D, 0x84, 0xDD, 0xFC, 0x70, 0xC0, 0x81, 0x98, 0xA6, 0x81, 0x94, 0xA0, 0xD9, 0x2A, 0xDC, 0xA7, 0xEC, 0x71, 0xA6, 0x65, 0x75, 0x5C, 0x9A, 0xE0, 0x75, 0x02, 0x24, 0x85, 0x9E], [UInt8](SHA256.hash(data: storage.children["Current User"]!.data)))
                do {
                    var storage = storage.children["Current User"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xDF, 0x85, 0xC0, 0xC5, 0x72, 0x86, 0xBD, 0x15, 0xC5, 0x4E, 0xEA, 0x94, 0x2B, 0x91, 0x6A, 0x56, 0x89, 0x9A, 0x12, 0xB5, 0x31, 0x6F, 0x1C, 0x2F, 0xA5, 0xC6, 0x28, 0x50, 0x48, 0x73, 0x36, 0xB8], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0xE1, 0x90, 0xA1, 0xF9, 0x99, 0x48, 0x31, 0x5F, 0x4F, 0x0E, 0x4E, 0x6D, 0x5E, 0x0C, 0x80, 0xA9, 0xD0, 0x63, 0xF7, 0xD2, 0x2E, 0xDF, 0x4F, 0xB3, 0x9C, 0x95, 0x2B, 0xBB, 0xCA, 0x05, 0xA1, 0xB8], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "2custom", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000380, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0xF7, 0x1F, 0xDC, 0x8B, 0x46, 0xE8, 0x3C, 0x00, 0xBD, 0xF5, 0x59, 0x13, 0xE6, 0x8C, 0x3C, 0x7A, 0x3C, 0xE3, 0xB3, 0xA4, 0xF6, 0x57, 0x35, 0x34, 0x10, 0xDC, 0x70, 0x4D, 0xB0, 0x54, 0xEF, 0x34], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xAD, 0x7F, 0xAC, 0xB2, 0x58, 0x6F, 0xC6, 0xE9, 0x66, 0xC0, 0x04, 0xD7, 0xD1, 0xD1, 0x6B, 0x02, 0x4F, 0x58, 0x05, 0xFF, 0x7C, 0xB4, 0x7C, 0x7A, 0x85, 0xDA, 0xBD, 0x8B, 0x48, 0x89, 0x2C, 0xA7], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001A47, storage.children["1Table"]!.count)
                XCTAssertEqual([0xDD, 0xDF, 0xC5, 0x2D, 0x8D, 0x97, 0x96, 0xD1, 0x2D, 0x80, 0x1F, 0xC5, 0xC3, 0x21, 0x1E, 0x63, 0xC2, 0x57, 0x4A, 0x2F, 0xDA, 0xD0, 0xF4, 0xB3, 0x0A, 0x54, 0x71, 0x69, 0xA0, 0x8E, 0x3F, 0x55], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000140, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x6F, 0x2E, 0x18, 0x1D, 0xAC, 0x58, 0x9D, 0x8B, 0x36, 0x37, 0x8D, 0xA3, 0x1A, 0x6F, 0x17, 0xB0, 0xA3, 0x2C, 0x2D, 0x33, 0xF6, 0xBB, 0xF8, 0x43, 0x3C, 0x03, 0xF0, 0x5B, 0x03, 0xD6, 0xE7, 0x7F], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001A8, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0xB4, 0x20, 0x90, 0xE3, 0x8C, 0xD4, 0x85, 0x44, 0x92, 0xA8, 0x00, 0x5C, 0x5A, 0x02, 0x80, 0x24, 0x60, 0x68, 0xD8, 0x30, 0x8F, 0xEB, 0xE1, 0xD5, 0x14, 0x81, 0x33, 0xFF, 0xC6, 0x93, 0x0A, 0x7C], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000079, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x28, 0xF4, 0x30, 0xB9, 0x11, 0xA4, 0x27, 0xFA, 0x7A, 0x5C, 0x59, 0x06, 0x1F, 0x73, 0x73, 0xE4, 0x03, 0x79, 0xD6, 0x70, 0x1C, 0xEB, 0x61, 0x91, 0x59, 0x28, 0x44, 0xB5, 0x0A, 0x5C, 0x07, 0xF6], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "BUG_16_", fileExtension: "xls"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000002900, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("_VBA_PROJECT_CUR", storage.children["_VBA_PROJECT_CUR"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["_VBA_PROJECT_CUR"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_VBA_PROJECT_CUR"]!.data)))
                do {
                    var storage = storage.children["_VBA_PROJECT_CUR"]!
                    XCTAssertEqual(3, storage.children.count)
                    XCTAssertEqual("VBA", storage.children["VBA"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["VBA"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["VBA"]!.data)))
                    do {
                        var storage = storage.children["VBA"]!
                        XCTAssertEqual(6, storage.children.count)
                        XCTAssertEqual("dir", storage.children["dir"]!.name)
                        XCTAssertEqual(0x0000000000000340, storage.children["dir"]!.count)
                        XCTAssertEqual([0x32, 0x8D, 0xBA, 0xA0, 0x7E, 0x83, 0xF7, 0x27, 0xA3, 0x31, 0x2D, 0x87, 0x1D, 0x04, 0x18, 0xA8, 0x8F, 0x81, 0x05, 0x2D, 0x47, 0x3E, 0x31, 0xF6, 0x06, 0x93, 0xC2, 0xE2, 0x3E, 0xB5, 0x99, 0x37], [UInt8](SHA256.hash(data: storage.children["dir"]!.data)))
                        do {
                            var storage = storage.children["dir"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("_VBA_PROJECT", storage.children["_VBA_PROJECT"]!.name)
                        XCTAssertEqual(0x0000000000000CD7, storage.children["_VBA_PROJECT"]!.count)
                        XCTAssertEqual([0x49, 0x6C, 0xF8, 0xA4, 0x7D, 0x33, 0xDC, 0xF0, 0xBD, 0x34, 0x43, 0x47, 0xA5, 0xF5, 0x60, 0x7D, 0x7D, 0xCC, 0x01, 0x61, 0x32, 0xA0, 0x6E, 0x6E, 0xFB, 0x29, 0xC2, 0xBF, 0x08, 0x57, 0xB1, 0x10], [UInt8](SHA256.hash(data: storage.children["_VBA_PROJECT"]!.data)))
                        do {
                            var storage = storage.children["_VBA_PROJECT"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("ThisWorkbook", storage.children["ThisWorkbook"]!.name)
                        XCTAssertEqual(0x00000000000003E1, storage.children["ThisWorkbook"]!.count)
                        XCTAssertEqual([0x8B, 0x5E, 0x54, 0x47, 0x46, 0xD5, 0x01, 0xA1, 0xD5, 0x7B, 0xF7, 0x18, 0xDB, 0xBE, 0x51, 0x92, 0x05, 0x71, 0x75, 0x28, 0xC6, 0xE2, 0xBF, 0xD8, 0x2B, 0x35, 0x3D, 0x98, 0x7F, 0xB9, 0x4A, 0xDC], [UInt8](SHA256.hash(data: storage.children["ThisWorkbook"]!.data)))
                        do {
                            var storage = storage.children["ThisWorkbook"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Sheet3", storage.children["Sheet3"]!.name)
                        XCTAssertEqual(0x00000000000003D9, storage.children["Sheet3"]!.count)
                        XCTAssertEqual([0x4E, 0xED, 0x6C, 0x6C, 0x76, 0xC0, 0xCB, 0xA1, 0x12, 0x43, 0x10, 0x32, 0x18, 0xD5, 0xCB, 0x8C, 0xE8, 0x73, 0x4A, 0x1B, 0x3B, 0x26, 0xF6, 0x9B, 0xBA, 0x52, 0x3E, 0xD3, 0x35, 0xC4, 0xC9, 0x6B], [UInt8](SHA256.hash(data: storage.children["Sheet3"]!.data)))
                        do {
                            var storage = storage.children["Sheet3"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Sheet2", storage.children["Sheet2"]!.name)
                        XCTAssertEqual(0x00000000000003D9, storage.children["Sheet2"]!.count)
                        XCTAssertEqual([0x97, 0x02, 0x88, 0x1C, 0x7E, 0x93, 0xB4, 0x01, 0xBE, 0x41, 0x32, 0x9E, 0x80, 0xFF, 0x23, 0xED, 0x24, 0xBB, 0x17, 0x77, 0x1A, 0xAF, 0x6D, 0xB9, 0xD5, 0x57, 0x30, 0xFC, 0x23, 0x0B, 0xA7, 0x9C], [UInt8](SHA256.hash(data: storage.children["Sheet2"]!.data)))
                        do {
                            var storage = storage.children["Sheet2"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Sheet1", storage.children["Sheet1"]!.name)
                        XCTAssertEqual(0x0000000000000680, storage.children["Sheet1"]!.count)
                        XCTAssertEqual([0x36, 0x3A, 0x7E, 0x4E, 0xD6, 0xB5, 0x83, 0x53, 0xA1, 0x3B, 0xB1, 0xA7, 0x5C, 0xBC, 0xCE, 0xD0, 0xBF, 0x5A, 0x83, 0xD0, 0x86, 0x11, 0x83, 0x53, 0xBD, 0xF7, 0x25, 0x1A, 0xB2, 0x78, 0x25, 0xDE], [UInt8](SHA256.hash(data: storage.children["Sheet1"]!.data)))
                        do {
                            var storage = storage.children["Sheet1"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("PROJECTwm", storage.children["PROJECTwm"]!.name)
                    XCTAssertEqual(0x0000000000000068, storage.children["PROJECTwm"]!.count)
                    XCTAssertEqual([0x62, 0x94, 0xEE, 0xF8, 0xFE, 0x32, 0x85, 0xEF, 0x7E, 0x45, 0x31, 0x9F, 0x93, 0x02, 0x1E, 0x5F, 0x21, 0xAD, 0x62, 0x0B, 0x0D, 0x42, 0x0A, 0x02, 0x3D, 0x05, 0xEC, 0x1A, 0x8D, 0x83, 0xE7, 0xC5], [UInt8](SHA256.hash(data: storage.children["PROJECTwm"]!.data)))
                    do {
                        var storage = storage.children["PROJECTwm"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("PROJECT", storage.children["PROJECT"]!.name)
                    XCTAssertEqual(0x000000000000024A, storage.children["PROJECT"]!.count)
                    XCTAssertEqual([0x7E, 0x19, 0x75, 0xD0, 0x9B, 0x82, 0x12, 0xE0, 0xAB, 0x0A, 0xB7, 0x91, 0xBA, 0x9D, 0xD6, 0x7F, 0x80, 0x1A, 0xB0, 0xE8, 0x4A, 0x6E, 0x87, 0xFD, 0xB0, 0x1D, 0x8F, 0x19, 0xA4, 0xD2, 0xFE, 0x1C], [UInt8](SHA256.hash(data: storage.children["PROJECT"]!.data)))
                    do {
                        var storage = storage.children["PROJECT"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }

                XCTAssertEqual("Workbook", storage.children["Workbook"]!.name)
                XCTAssertEqual(0x0000000000003E24, storage.children["Workbook"]!.count)
                XCTAssertEqual([0x3C, 0x0B, 0x48, 0x55, 0x93, 0xE9, 0x28, 0x92, 0x75, 0xD7, 0x8A, 0x6E, 0xE7, 0xC7, 0x8C, 0x4F, 0x74, 0xC7, 0x74, 0x86, 0xDE, 0x9F, 0x66, 0xAB, 0xB2, 0x95, 0x14, 0x13, 0xA7, 0xBD, 0xF5, 0x17], [UInt8](SHA256.hash(data: storage.children["Workbook"]!.data)))
                do {
                    var storage = storage.children["Workbook"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Ctls", storage.children["Ctls"]!.name)
                XCTAssertEqual(0x0000000000000050, storage.children["Ctls"]!.count)
                XCTAssertEqual([0x52, 0xAD, 0x42, 0xE5, 0xBC, 0x69, 0xF1, 0xB8, 0xE5, 0xE5, 0xB1, 0xD7, 0xAB, 0xA4, 0x7F, 0x62, 0xB6, 0xF2, 0x0E, 0x10, 0x19, 0xBE, 0xD7, 0x06, 0xE1, 0xE0, 0xA2, 0x1C, 0xDB, 0xE5, 0xB3, 0x4E], [UInt8](SHA256.hash(data: storage.children["Ctls"]!.data)))
                do {
                    var storage = storage.children["Ctls"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000000A8, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x92, 0xA9, 0xCD, 0x9C, 0xDA, 0xA7, 0xB9, 0x73, 0xAD, 0x7F, 0x90, 0xC5, 0xF3, 0x0A, 0x09, 0xB1, 0x15, 0xC4, 0xB2, 0x2A, 0x1C, 0x20, 0xB4, 0x05, 0xEB, 0xE9, 0x5B, 0x09, 0x09, 0xF3, 0x63, 0xD3], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000100, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x3B, 0x7F, 0x10, 0x32, 0xB0, 0x32, 0x43, 0xE9, 0x84, 0x53, 0xE4, 0xEA, 0xB9, 0x11, 0x5B, 0x57, 0x2A, 0x81, 0xCB, 0x19, 0x69, 0x89, 0x51, 0xA2, 0x0C, 0x56, 0x85, 0x71, 0x3F, 0xD3, 0x95, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000006B, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x87, 0xAD, 0xE3, 0x55, 0x70, 0x05, 0x2B, 0xAA, 0x02, 0x06, 0xF1, 0x0A, 0x3F, 0xB7, 0x54, 0xB7, 0xBB, 0x42, 0x7F, 0xE0, 0x19, 0xF2, 0x45, 0x09, 0x89, 0xF6, 0xBA, 0x32, 0x92, 0x54, 0x56, 0x6E], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "poWEr.prelim", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x00000000000070A9, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x31, 0x17, 0x5A, 0x56, 0x11, 0xB6, 0xA5, 0x74, 0x05, 0x8D, 0x15, 0xA8, 0xE7, 0x0F, 0xC2, 0xEF, 0x8A, 0x2B, 0x53, 0xB0, 0x85, 0x19, 0x4D, 0xD0, 0x3C, 0x49, 0x46, 0xCF, 0x83, 0x1C, 0x72, 0x9C], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xFE, 0xC7, 0x3E, 0xA1, 0x2E, 0x32, 0xA3, 0xD4, 0xBF, 0x3F, 0x9A, 0xA0, 0x0C, 0x63, 0xA2, 0xB4, 0x7D, 0x80, 0xA2, 0x91, 0x0E, 0x5A, 0x7C, 0x8E, 0x09, 0xDD, 0xBB, 0x9C, 0xFA, 0x95, 0xF9, 0x89], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["1Table"]!.count)
                XCTAssertEqual([0x3A, 0x8E, 0x51, 0x78, 0x79, 0x7E, 0x2F, 0xE3, 0x7E, 0x06, 0x59, 0x0E, 0x80, 0x51, 0x06, 0xB7, 0xFA, 0xD1, 0xF4, 0xC0, 0x28, 0xDF, 0xA5, 0x68, 0x6E, 0x1E, 0xCA, 0x34, 0xD6, 0x4E, 0xA0, 0xB5], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x99, 0x7A, 0xFB, 0xB5, 0x20, 0x4D, 0x21, 0xA7, 0x07, 0xD0, 0xDD, 0x22, 0xE5, 0x59, 0x8B, 0x87, 0x07, 0x1B, 0x54, 0xD8, 0xF8, 0xDC, 0x66, 0xB7, 0x05, 0xDA, 0x76, 0x73, 0x67, 0x29, 0x61, 0x10], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x02, 0xC9, 0xE2, 0x2C, 0x41, 0x76, 0x34, 0x21, 0x31, 0x22, 0x45, 0x9D, 0x00, 0xC3, 0x43, 0x49, 0xCB, 0x3F, 0x4A, 0x07, 0x48, 0x30, 0x2A, 0x1B, 0x65, 0xB9, 0x1C, 0x7D, 0xFC, 0x0E, 0x30, 0x83], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000058, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x20, 0xD1, 0xAC, 0x2D, 0xEE, 0x52, 0x1B, 0x0B, 0x47, 0x10, 0xFC, 0x0A, 0x6F, 0x1F, 0xE0, 0x0B, 0xD4, 0x52, 0xA9, 0xAE, 0x41, 0xA1, 0x50, 0x0B, 0x53, 0x90, 0xD0, 0x32, 0x7A, 0x34, 0x99, 0xDA], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "MultipleStorage", fileExtension: "cfs"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000580, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(1, storage.children.count)
                XCTAssertEqual("MyStorage", storage.children["MyStorage"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["MyStorage"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["MyStorage"]!.data)))
                do {
                    var storage = storage.children["MyStorage"]!
                    XCTAssertEqual(3, storage.children.count)
                    XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                    XCTAssertEqual(0x0000000000000200, storage.children["MyStream"]!.count)
                    XCTAssertEqual([0x6C, 0xAF, 0x38, 0xD5, 0x37, 0x98, 0x4E, 0x26, 0x15, 0x27, 0xB8, 0xCA, 0xEF, 0x5F, 0x99, 0x0F, 0xB9, 0x14, 0x15, 0xA1, 0xDB, 0x91, 0x71, 0x98, 0x82, 0x1A, 0x79, 0xED, 0x28, 0x99, 0x79, 0x73], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                    do {
                        var storage = storage.children["MyStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("MySecondStream", storage.children["MySecondStream"]!.name)
                    XCTAssertEqual(0x0000000000000150, storage.children["MySecondStream"]!.count)
                    XCTAssertEqual([0x7C, 0xD9, 0x9B, 0xE0, 0x0B, 0x28, 0x83, 0x0A, 0x10, 0x20, 0xDD, 0x18, 0x79, 0x41, 0xE7, 0xC0, 0x92, 0x1B, 0x93, 0x06, 0xEA, 0x5F, 0xEB, 0x78, 0x5A, 0xA4, 0xF5, 0x54, 0xCE, 0x10, 0x98, 0x99], [UInt8](SHA256.hash(data: storage.children["MySecondStream"]!.data)))
                    do {
                        var storage = storage.children["MySecondStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("AnotherStorage", storage.children["AnotherStorage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["AnotherStorage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["AnotherStorage"]!.data)))
                    do {
                        var storage = storage.children["AnotherStorage"]!
                        XCTAssertEqual(1, storage.children.count)
                        XCTAssertEqual("AnotherStream", storage.children["AnotherStream"]!.name)
                        XCTAssertEqual(0x0000000000000200, storage.children["AnotherStream"]!.count)
                        XCTAssertEqual([0x1B, 0xD8, 0xD0, 0x4B, 0xB1, 0x27, 0xC9, 0xDB, 0xDB, 0x40, 0x6C, 0x3C, 0x21, 0x3B, 0x20, 0x2C, 0x84, 0xDC, 0x75, 0xF1, 0x22, 0xEC, 0xD5, 0x53, 0xB0, 0x2F, 0xB3, 0x22, 0xBF, 0xFA, 0xFD, 0xC9], [UInt8](SHA256.hash(data: storage.children["AnotherStream"]!.data)))
                        do {
                            var storage = storage.children["AnotherStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "MultipleStorage2", fileExtension: "cfs"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000005C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(1, storage.children.count)
                XCTAssertEqual("MyStorage", storage.children["MyStorage"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["MyStorage"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["MyStorage"]!.data)))
                do {
                    var storage = storage.children["MyStorage"]!
                    XCTAssertEqual(4, storage.children.count)
                    XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                    XCTAssertEqual(0x0000000000000200, storage.children["MyStream"]!.count)
                    XCTAssertEqual([0x6C, 0xAF, 0x38, 0xD5, 0x37, 0x98, 0x4E, 0x26, 0x15, 0x27, 0xB8, 0xCA, 0xEF, 0x5F, 0x99, 0x0F, 0xB9, 0x14, 0x15, 0xA1, 0xDB, 0x91, 0x71, 0x98, 0x82, 0x1A, 0x79, 0xED, 0x28, 0x99, 0x79, 0x73], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                    do {
                        var storage = storage.children["MyStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("MySecondStream", storage.children["MySecondStream"]!.name)
                    XCTAssertEqual(0x0000000000000150, storage.children["MySecondStream"]!.count)
                    XCTAssertEqual([0x7C, 0xD9, 0x9B, 0xE0, 0x0B, 0x28, 0x83, 0x0A, 0x10, 0x20, 0xDD, 0x18, 0x79, 0x41, 0xE7, 0xC0, 0x92, 0x1B, 0x93, 0x06, 0xEA, 0x5F, 0xEB, 0x78, 0x5A, 0xA4, 0xF5, 0x54, 0xCE, 0x10, 0x98, 0x99], [UInt8](SHA256.hash(data: storage.children["MySecondStream"]!.data)))
                    do {
                        var storage = storage.children["MySecondStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("AnotherStorage", storage.children["AnotherStorage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["AnotherStorage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["AnotherStorage"]!.data)))
                    do {
                        var storage = storage.children["AnotherStorage"]!
                        XCTAssertEqual(3, storage.children.count)
                        XCTAssertEqual("AnotherStream", storage.children["AnotherStream"]!.name)
                        XCTAssertEqual(0x0000000000000200, storage.children["AnotherStream"]!.count)
                        XCTAssertEqual([0x1B, 0xD8, 0xD0, 0x4B, 0xB1, 0x27, 0xC9, 0xDB, 0xDB, 0x40, 0x6C, 0x3C, 0x21, 0x3B, 0x20, 0x2C, 0x84, 0xDC, 0x75, 0xF1, 0x22, 0xEC, 0xD5, 0x53, 0xB0, 0x2F, 0xB3, 0x22, 0xBF, 0xFA, 0xFD, 0xC9], [UInt8](SHA256.hash(data: storage.children["AnotherStream"]!.data)))
                        do {
                            var storage = storage.children["AnotherStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another3Stream", storage.children["Another3Stream"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["Another3Stream"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another3Stream"]!.data)))
                        do {
                            var storage = storage.children["Another3Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another2Stream", storage.children["Another2Stream"]!.name)
                        XCTAssertEqual(0x000000000000002E, storage.children["Another2Stream"]!.count)
                        XCTAssertEqual([0x7D, 0xE1, 0x82, 0xE9, 0x71, 0x32, 0x62, 0x3E, 0xDD, 0xFE, 0xCB, 0x3F, 0x41, 0xED, 0x23, 0xA8, 0x69, 0x5D, 0x61, 0x41, 0x0C, 0xD1, 0x92, 0x2A, 0x54, 0x68, 0xE7, 0xC1, 0xF8, 0x85, 0xFF, 0x8B], [UInt8](SHA256.hash(data: storage.children["Another2Stream"]!.data)))
                        do {
                            var storage = storage.children["Another2Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("Another2Storage", storage.children["Another2Storage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["Another2Storage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another2Storage"]!.data)))
                    do {
                        var storage = storage.children["Another2Storage"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "MultipleStorage3", fileExtension: "cfs"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000580, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(1, storage.children.count)
                XCTAssertEqual("MyStorage", storage.children["MyStorage"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["MyStorage"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["MyStorage"]!.data)))
                do {
                    var storage = storage.children["MyStorage"]!
                    XCTAssertEqual(4, storage.children.count)
                    XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                    XCTAssertEqual(0x0000000000000200, storage.children["MyStream"]!.count)
                    XCTAssertEqual([0x6C, 0xAF, 0x38, 0xD5, 0x37, 0x98, 0x4E, 0x26, 0x15, 0x27, 0xB8, 0xCA, 0xEF, 0x5F, 0x99, 0x0F, 0xB9, 0x14, 0x15, 0xA1, 0xDB, 0x91, 0x71, 0x98, 0x82, 0x1A, 0x79, 0xED, 0x28, 0x99, 0x79, 0x73], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                    do {
                        var storage = storage.children["MyStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("MySecondStream", storage.children["MySecondStream"]!.name)
                    XCTAssertEqual(0x0000000000000150, storage.children["MySecondStream"]!.count)
                    XCTAssertEqual([0x7C, 0xD9, 0x9B, 0xE0, 0x0B, 0x28, 0x83, 0x0A, 0x10, 0x20, 0xDD, 0x18, 0x79, 0x41, 0xE7, 0xC0, 0x92, 0x1B, 0x93, 0x06, 0xEA, 0x5F, 0xEB, 0x78, 0x5A, 0xA4, 0xF5, 0x54, 0xCE, 0x10, 0x98, 0x99], [UInt8](SHA256.hash(data: storage.children["MySecondStream"]!.data)))
                    do {
                        var storage = storage.children["MySecondStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("AnotherStorage", storage.children["AnotherStorage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["AnotherStorage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["AnotherStorage"]!.data)))
                    do {
                        var storage = storage.children["AnotherStorage"]!
                        XCTAssertEqual(3, storage.children.count)
                        XCTAssertEqual("AnotherStream", storage.children["AnotherStream"]!.name)
                        XCTAssertEqual(0x0000000000000200, storage.children["AnotherStream"]!.count)
                        XCTAssertEqual([0x1B, 0xD8, 0xD0, 0x4B, 0xB1, 0x27, 0xC9, 0xDB, 0xDB, 0x40, 0x6C, 0x3C, 0x21, 0x3B, 0x20, 0x2C, 0x84, 0xDC, 0x75, 0xF1, 0x22, 0xEC, 0xD5, 0x53, 0xB0, 0x2F, 0xB3, 0x22, 0xBF, 0xFA, 0xFD, 0xC9], [UInt8](SHA256.hash(data: storage.children["AnotherStream"]!.data)))
                        do {
                            var storage = storage.children["AnotherStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another3Stream", storage.children["Another3Stream"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["Another3Stream"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another3Stream"]!.data)))
                        do {
                            var storage = storage.children["Another3Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another2Stream", storage.children["Another2Stream"]!.name)
                        XCTAssertEqual(0x0000000000004380, storage.children["Another2Stream"]!.count)
                        XCTAssertEqual([0x32, 0xAE, 0xA6, 0x6F, 0xFD, 0xC5, 0x9D, 0x65, 0x10, 0xF3, 0x6E, 0x80, 0xDA, 0x55, 0x66, 0x83, 0x90, 0xAC, 0x45, 0x31, 0xFD, 0x83, 0xB0, 0x85, 0x03, 0x26, 0xF4, 0x01, 0x72, 0xA1, 0x48, 0x29], [UInt8](SHA256.hash(data: storage.children["Another2Stream"]!.data)))
                        do {
                            var storage = storage.children["Another2Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("Another2Storage", storage.children["Another2Storage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["Another2Storage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another2Storage"]!.data)))
                    do {
                        var storage = storage.children["Another2Storage"]!
                        XCTAssertEqual(0, storage.children.count)
                    }
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "MultipleStorage4", fileExtension: "cfs"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000580, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(1, storage.children.count)
                XCTAssertEqual("MyStorage", storage.children["MyStorage"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["MyStorage"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["MyStorage"]!.data)))
                do {
                    var storage = storage.children["MyStorage"]!
                    XCTAssertEqual(4, storage.children.count)
                    XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                    XCTAssertEqual(0x0000000000000200, storage.children["MyStream"]!.count)
                    XCTAssertEqual([0x6C, 0xAF, 0x38, 0xD5, 0x37, 0x98, 0x4E, 0x26, 0x15, 0x27, 0xB8, 0xCA, 0xEF, 0x5F, 0x99, 0x0F, 0xB9, 0x14, 0x15, 0xA1, 0xDB, 0x91, 0x71, 0x98, 0x82, 0x1A, 0x79, 0xED, 0x28, 0x99, 0x79, 0x73], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                    do {
                        var storage = storage.children["MyStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("MySecondStream", storage.children["MySecondStream"]!.name)
                    XCTAssertEqual(0x0000000000000150, storage.children["MySecondStream"]!.count)
                    XCTAssertEqual([0x7C, 0xD9, 0x9B, 0xE0, 0x0B, 0x28, 0x83, 0x0A, 0x10, 0x20, 0xDD, 0x18, 0x79, 0x41, 0xE7, 0xC0, 0x92, 0x1B, 0x93, 0x06, 0xEA, 0x5F, 0xEB, 0x78, 0x5A, 0xA4, 0xF5, 0x54, 0xCE, 0x10, 0x98, 0x99], [UInt8](SHA256.hash(data: storage.children["MySecondStream"]!.data)))
                    do {
                        var storage = storage.children["MySecondStream"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("AnotherStorage", storage.children["AnotherStorage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["AnotherStorage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["AnotherStorage"]!.data)))
                    do {
                        var storage = storage.children["AnotherStorage"]!
                        XCTAssertEqual(4, storage.children.count)
                        XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                        XCTAssertEqual(0x00000000000079F4, storage.children["MyStream"]!.count)
                        XCTAssertEqual([0xAA, 0xF6, 0xB7, 0x02, 0xF5, 0xAC, 0x4C, 0xC5, 0xEB, 0x64, 0x94, 0x79, 0x89, 0x85, 0x84, 0x77, 0x82, 0x8D, 0x17, 0x9C, 0x85, 0x12, 0x44, 0x9C, 0xAE, 0xC4, 0xB6, 0xCA, 0x94, 0xD8, 0xA0, 0x8C], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                        do {
                            var storage = storage.children["MyStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("AnotherStream", storage.children["AnotherStream"]!.name)
                        XCTAssertEqual(0x0000000000000200, storage.children["AnotherStream"]!.count)
                        XCTAssertEqual([0x1B, 0xD8, 0xD0, 0x4B, 0xB1, 0x27, 0xC9, 0xDB, 0xDB, 0x40, 0x6C, 0x3C, 0x21, 0x3B, 0x20, 0x2C, 0x84, 0xDC, 0x75, 0xF1, 0x22, 0xEC, 0xD5, 0x53, 0xB0, 0x2F, 0xB3, 0x22, 0xBF, 0xFA, 0xFD, 0xC9], [UInt8](SHA256.hash(data: storage.children["AnotherStream"]!.data)))
                        do {
                            var storage = storage.children["AnotherStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another3Stream", storage.children["Another3Stream"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["Another3Stream"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another3Stream"]!.data)))
                        do {
                            var storage = storage.children["Another3Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("Another2Stream", storage.children["Another2Stream"]!.name)
                        XCTAssertEqual(0x0000000000004380, storage.children["Another2Stream"]!.count)
                        XCTAssertEqual([0x32, 0xAE, 0xA6, 0x6F, 0xFD, 0xC5, 0x9D, 0x65, 0x10, 0xF3, 0x6E, 0x80, 0xDA, 0x55, 0x66, 0x83, 0x90, 0xAC, 0x45, 0x31, 0xFD, 0x83, 0xB0, 0x85, 0x03, 0x26, 0xF4, 0x01, 0x72, 0xA1, 0x48, 0x29], [UInt8](SHA256.hash(data: storage.children["Another2Stream"]!.data)))
                        do {
                            var storage = storage.children["Another2Stream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("Another2Storage", storage.children["Another2Storage"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["Another2Storage"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["Another2Storage"]!.data)))
                    do {
                        var storage = storage.children["Another2Storage"]!
                        XCTAssertEqual(1, storage.children.count)
                        XCTAssertEqual("MyStream", storage.children["MyStream"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["MyStream"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["MyStream"]!.data)))
                        do {
                            var storage = storage.children["MyStream"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "_Test", fileExtension: "ppt"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000280, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("PowerPoint Document", storage.children["PowerPoint Document"]!.name)
                XCTAssertEqual(0x000000000001B4B7, storage.children["PowerPoint Document"]!.count)
                XCTAssertEqual([0x1F, 0x50, 0x9F, 0xB3, 0x0E, 0xFA, 0x5A, 0xF3, 0x23, 0x60, 0xDE, 0x9E, 0x3D, 0x73, 0x13, 0xA9, 0x4F, 0x75, 0xC9, 0x23, 0x5C, 0x96, 0x8D, 0x00, 0x4F, 0xCC, 0xAF, 0x44, 0x5D, 0xA1, 0x9D, 0xC6], [UInt8](SHA256.hash(data: storage.children["PowerPoint Document"]!.data)))
                do {
                    var storage = storage.children["PowerPoint Document"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Current User", storage.children["Current User"]!.name)
                XCTAssertEqual(0x000000000000003E, storage.children["Current User"]!.count)
                XCTAssertEqual([0xF3, 0xD5, 0xB3, 0xA2, 0xD4, 0xB8, 0x9C, 0x76, 0x0A, 0x2E, 0xC5, 0x32, 0xEA, 0x0D, 0xF4, 0x84, 0x61, 0x44, 0x0A, 0x50, 0x5B, 0xD9, 0x6F, 0x7C, 0x8F, 0x19, 0xE4, 0x8E, 0xE2, 0xC0, 0xF4, 0x34], [UInt8](SHA256.hash(data: storage.children["Current User"]!.data)))
                do {
                    var storage = storage.children["Current User"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x000000000000D278, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x44, 0xE0, 0x43, 0x88, 0x50, 0xAE, 0x9A, 0xE6, 0xE4, 0x07, 0x4C, 0x16, 0x17, 0x7C, 0x09, 0x97, 0xD3, 0xB3, 0x5B, 0x8D, 0x93, 0x7B, 0xDC, 0xA5, 0x80, 0x8F, 0x5A, 0xF1, 0x12, 0x5D, 0x14, 0xB1], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000228, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x42, 0xA0, 0x6A, 0x0A, 0x8B, 0xC3, 0x7A, 0x5A, 0x8A, 0xA6, 0xEA, 0x79, 0x1C, 0xC0, 0x51, 0x1A, 0x76, 0xF8, 0x04, 0x75, 0x86, 0xA4, 0xFA, 0xED, 0xBF, 0xEB, 0xF0, 0xC3, 0x51, 0xFF, 0x3C, 0x98], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "english.presets", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000001980, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000000E32, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x1D, 0xD0, 0x99, 0x9F, 0x37, 0x61, 0xE5, 0xFB, 0xEA, 0xC7, 0x02, 0x71, 0x0C, 0x9A, 0x3A, 0x55, 0x8D, 0x72, 0x52, 0x44, 0x5B, 0x0F, 0x50, 0x56, 0x07, 0x50, 0x69, 0xB1, 0xF5, 0x6F, 0xDB, 0x03], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x00000000000007C1, storage.children["1Table"]!.count)
                XCTAssertEqual([0x0A, 0x23, 0xA3, 0x4D, 0x08, 0xF2, 0xA6, 0xCA, 0xE0, 0x76, 0x5C, 0xEA, 0x8F, 0x28, 0xD4, 0xE3, 0xDD, 0x03, 0xE4, 0xCF, 0xAB, 0xCD, 0x95, 0x6F, 0x8F, 0xB0, 0x47, 0xA6, 0x62, 0x0B, 0xF6, 0x01], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x000000000000016C, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x51, 0xF5, 0x51, 0x1B, 0x3A, 0xA6, 0x79, 0x49, 0x86, 0xAD, 0xF3, 0xBA, 0x5D, 0x9D, 0xCA, 0x8E, 0xDB, 0x61, 0x13, 0x0E, 0x53, 0xE3, 0x3B, 0xC4, 0x03, 0x02, 0x1C, 0x4D, 0xDF, 0xF5, 0xA5, 0xAD], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000000C8, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x52, 0x62, 0xC1, 0xFE, 0x47, 0x6F, 0xD1, 0xBF, 0x02, 0x69, 0xC3, 0xA1, 0x20, 0x7B, 0x44, 0x5F, 0x72, 0xA6, 0xE7, 0xDA, 0xFD, 0xD5, 0x82, 0x4A, 0x99, 0x59, 0x12, 0xD1, 0x79, 0x39, 0x0B, 0xD6], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                do {
                    var storage = storage.children["\u{01}Ole"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000006A, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0xFA, 0xDE, 0xB4, 0x3F, 0x2F, 0x72, 0x5C, 0x7D, 0x4B, 0x4D, 0x45, 0x1F, 0xB0, 0xA3, 0x3F, 0x22, 0x01, 0x57, 0xCA, 0x22, 0xCD, 0x5E, 0xAE, 0xA3, 0x73, 0x7E, 0xF7, 0x6F, 0x63, 0x54, 0x26, 0xC7], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "poWEr.prelim", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000080, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x00000000000070A9, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0x31, 0x17, 0x5A, 0x56, 0x11, 0xB6, 0xA5, 0x74, 0x05, 0x8D, 0x15, 0xA8, 0xE7, 0x0F, 0xC2, 0xEF, 0x8A, 0x2B, 0x53, 0xB0, 0x85, 0x19, 0x4D, 0xD0, 0x3C, 0x49, 0x46, 0xCF, 0x83, 0x1C, 0x72, 0x9C], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xFE, 0xC7, 0x3E, 0xA1, 0x2E, 0x32, 0xA3, 0xD4, 0xBF, 0x3F, 0x9A, 0xA0, 0x0C, 0x63, 0xA2, 0xB4, 0x7D, 0x80, 0xA2, 0x91, 0x0E, 0x5A, 0x7C, 0x8E, 0x09, 0xDD, 0xBB, 0x9C, 0xFA, 0x95, 0xF9, 0x89], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["1Table"]!.count)
                XCTAssertEqual([0x3A, 0x8E, 0x51, 0x78, 0x79, 0x7E, 0x2F, 0xE3, 0x7E, 0x06, 0x59, 0x0E, 0x80, 0x51, 0x06, 0xB7, 0xFA, 0xD1, 0xF4, 0xC0, 0x28, 0xDF, 0xA5, 0x68, 0x6E, 0x1E, 0xCA, 0x34, 0xD6, 0x4E, 0xA0, 0xB5], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x99, 0x7A, 0xFB, 0xB5, 0x20, 0x4D, 0x21, 0xA7, 0x07, 0xD0, 0xDD, 0x22, 0xE5, 0x59, 0x8B, 0x87, 0x07, 0x1B, 0x54, 0xD8, 0xF8, 0xDC, 0x66, 0xB7, 0x05, 0xDA, 0x76, 0x73, 0x67, 0x29, 0x61, 0x10], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x02, 0xC9, 0xE2, 0x2C, 0x41, 0x76, 0x34, 0x21, 0x31, 0x22, 0x45, 0x9D, 0x00, 0xC3, 0x43, 0x49, 0xCB, 0x3F, 0x4A, 0x07, 0x48, 0x30, 0x2A, 0x1B, 0x65, 0xB9, 0x1C, 0x7D, 0xFC, 0x0E, 0x30, 0x83], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000058, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x20, 0xD1, 0xAC, 0x2D, 0xEE, 0x52, 0x1B, 0x0B, 0x47, 0x10, 0xFC, 0x0A, 0x6F, 0x1F, 0xE0, 0x0B, 0xD4, 0x52, 0xA9, 0xAE, 0x41, 0xA1, 0x50, 0x0B, 0x53, 0x90, 0xD0, 0x32, 0x7A, 0x34, 0x99, 0xDA], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "reportREAD", fileExtension: "xls"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000002C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("Workbook", storage.children["Workbook"]!.name)
                XCTAssertEqual(0x00000000000033E7, storage.children["Workbook"]!.count)
                XCTAssertEqual([0x60, 0xA3, 0xB9, 0x73, 0x7C, 0x3D, 0x15, 0x6E, 0xC1, 0x49, 0xB4, 0x35, 0x37, 0xE8, 0xBA, 0xFF, 0x7F, 0x9E, 0x2C, 0xB7, 0x1E, 0x4D, 0xA4, 0xEB, 0x52, 0x75, 0xCB, 0x0C, 0x2F, 0x7C, 0x82, 0x76], [UInt8](SHA256.hash(data: storage.children["Workbook"]!.data)))
                do {
                    var storage = storage.children["Workbook"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000000E8, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xE2, 0x78, 0x18, 0xF6, 0x74, 0xCF, 0xF7, 0x04, 0x78, 0xC8, 0xE8, 0x73, 0x46, 0x76, 0x4B, 0xAB, 0x27, 0x34, 0xF2, 0x21, 0x07, 0x1A, 0x1D, 0x3D, 0x7A, 0x39, 0xD4, 0x5D, 0x7D, 0x59, 0x08, 0xFB], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000108, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x4E, 0x87, 0xFF, 0x11, 0x9C, 0x7B, 0x62, 0x5C, 0xA8, 0x9F, 0xC8, 0x9D, 0xB4, 0x02, 0x2C, 0x05, 0x66, 0x5E, 0x21, 0xF9, 0xCF, 0xF1, 0xAB, 0xFE, 0x0C, 0x93, 0x2F, 0xFC, 0x6B, 0xF4, 0x58, 0x58], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000072, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x67, 0xE8, 0x42, 0x47, 0xAA, 0x56, 0xFC, 0x6C, 0xB4, 0x73, 0x50, 0x58, 0xBB, 0x59, 0x26, 0x0C, 0x84, 0xA9, 0x6D, 0xF6, 0xE8, 0x7B, 0xA9, 0xAA, 0x5A, 0xEA, 0x57, 0xA0, 0x61, 0x44, 0x87, 0x1B], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "report_name_fix", fileExtension: "xls"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000002C0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(4, storage.children.count)
                XCTAssertEqual("Workbook", storage.children["Workbook"]!.name)
                XCTAssertEqual(0x00000000000033E7, storage.children["Workbook"]!.count)
                XCTAssertEqual([0x4E, 0xBD, 0x34, 0x09, 0xEB, 0xE7, 0x40, 0xC3, 0xEF, 0x03, 0x85, 0x03, 0xB8, 0x26, 0xFF, 0xB6, 0xF7, 0x0B, 0x14, 0x4A, 0xE2, 0xDB, 0xEE, 0x6F, 0xA9, 0x2D, 0x23, 0xEB, 0x61, 0x89, 0x7B, 0x9D], [UInt8](SHA256.hash(data: storage.children["Workbook"]!.data)))
                do {
                    var storage = storage.children["Workbook"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000000E8, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0xE2, 0x78, 0x18, 0xF6, 0x74, 0xCF, 0xF7, 0x04, 0x78, 0xC8, 0xE8, 0x73, 0x46, 0x76, 0x4B, 0xAB, 0x27, 0x34, 0xF2, 0x21, 0x07, 0x1A, 0x1D, 0x3D, 0x7A, 0x39, 0xD4, 0x5D, 0x7D, 0x59, 0x08, 0xFB], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000000108, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x4E, 0x87, 0xFF, 0x11, 0x9C, 0x7B, 0x62, 0x5C, 0xA8, 0x9F, 0xC8, 0x9D, 0xB4, 0x02, 0x2C, 0x05, 0x66, 0x5E, 0x21, 0xF9, 0xCF, 0xF1, 0xAB, 0xFE, 0x0C, 0x93, 0x2F, 0xFC, 0x6B, 0xF4, 0x58, 0x58], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000072, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x67, 0xE8, 0x42, 0x47, 0xAA, 0x56, 0xFC, 0x6C, 0xB4, 0x73, 0x50, 0x58, 0xBB, 0x59, 0x26, 0x0C, 0x84, 0xA9, 0x6D, 0xF6, 0xE8, 0x7B, 0xA9, 0xAA, 0x5A, 0xEA, 0x57, 0xA0, 0x61, 0x44, 0x87, 0x1B], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "wstr_presets", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000280, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(6, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0xF7, 0x1F, 0xDC, 0x8B, 0x46, 0xE8, 0x3C, 0x00, 0xBD, 0xF5, 0x59, 0x13, 0xE6, 0x8C, 0x3C, 0x7A, 0x3C, 0xE3, 0xB3, 0xA4, 0xF6, 0x57, 0x35, 0x34, 0x10, 0xDC, 0x70, 0x4D, 0xB0, 0x54, 0xEF, 0x34], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0xAD, 0x7F, 0xAC, 0xB2, 0x58, 0x6F, 0xC6, 0xE9, 0x66, 0xC0, 0x04, 0xD7, 0xD1, 0xD1, 0x6B, 0x02, 0x4F, 0x58, 0x05, 0xFF, 0x7C, 0xB4, 0x7C, 0x7A, 0x85, 0xDA, 0xBD, 0x8B, 0x48, 0x89, 0x2C, 0xA7], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x0000000000001A47, storage.children["1Table"]!.count)
                XCTAssertEqual([0xDD, 0xDF, 0xC5, 0x2D, 0x8D, 0x97, 0x96, 0xD1, 0x2D, 0x80, 0x1F, 0xC5, 0xC3, 0x21, 0x1E, 0x63, 0xC2, 0x57, 0x4A, 0x2F, 0xDA, 0xD0, 0xF4, 0xB3, 0x0A, 0x54, 0x71, 0x69, 0xA0, 0x8E, 0x3F, 0x55], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001FC, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x48, 0xE9, 0x06, 0x8F, 0xFD, 0x3F, 0x19, 0xDB, 0x55, 0x8B, 0x66, 0x39, 0xF3, 0x15, 0x85, 0xAA, 0x7F, 0x77, 0x74, 0x3C, 0x44, 0x12, 0x70, 0x04, 0x89, 0x6F, 0x46, 0xBD, 0xEA, 0x75, 0x15, 0xC5], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0x64, 0xFC, 0x08, 0x76, 0x01, 0x42, 0x50, 0xCD, 0x6D, 0x39, 0x55, 0x88, 0x2B, 0x99, 0xB1, 0x38, 0xFF, 0xC0, 0x86, 0xF0, 0x9F, 0x9A, 0x4A, 0x62, 0xCA, 0x7C, 0xB5, 0x2E, 0xE7, 0x95, 0x69, 0x7B], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x0000000000000079, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x28, 0xF4, 0x30, 0xB9, 0x11, 0xA4, 0x27, 0xFA, 0x7A, 0x5C, 0x59, 0x06, 0x1F, 0x73, 0x73, 0xE4, 0x03, 0x79, 0xD6, 0x70, 0x1C, 0xEB, 0x61, 0x91, 0x59, 0x28, 0x44, 0xB5, 0x0A, 0x5C, 0x07, 0xF6], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        do {
            /* aquasync/ruby-ole */
            let file = try CompoundFile(data: try getData(name: "oleWithDirs", fileExtension: "ole"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x00000000000002C8, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(3, storage.children.count)
                XCTAssertEqual("file1", storage.children["file1"]!.name)
                XCTAssertEqual(0x0000000000000048, storage.children["file1"]!.count)
                XCTAssertEqual([0xC8, 0x5F, 0x5F, 0xFF, 0x47, 0xA9, 0x8F, 0x60, 0x51, 0xE1, 0xF1, 0xDA, 0xEE, 0xD3, 0xDA, 0xB2, 0x4D, 0x8E, 0xB4, 0xE8, 0xD5, 0x7F, 0xDC, 0xAA, 0x80, 0x1A, 0xB3, 0x31, 0x4F, 0x68, 0x0F, 0xF4], [UInt8](SHA256.hash(data: storage.children["file1"]!.data)))
                do {
                    var storage = storage.children["file1"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("dir2", storage.children["dir2"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["dir2"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["dir2"]!.data)))
                do {
                    var storage = storage.children["dir2"]!
                    XCTAssertEqual(2, storage.children.count)
                    XCTAssertEqual("file21", storage.children["file21"]!.name)
                    XCTAssertEqual(0x000000000000004E, storage.children["file21"]!.count)
                    XCTAssertEqual([0xF6, 0xD1, 0x1A, 0x8C, 0x68, 0x08, 0x12, 0xD6, 0xC9, 0x25, 0x6C, 0xD4, 0xAA, 0x19, 0x01, 0x9D, 0x0B, 0x24, 0x68, 0x9A, 0x20, 0xBE, 0xB2, 0xC2, 0x06, 0x97, 0xA3, 0x6B, 0xF1, 0x5D, 0x6F, 0xEA], [UInt8](SHA256.hash(data: storage.children["file21"]!.data)))
                    do {
                        var storage = storage.children["file21"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("dir21", storage.children["dir21"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["dir21"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["dir21"]!.data)))
                    do {
                        var storage = storage.children["dir21"]!
                        XCTAssertEqual(1, storage.children.count)
                        XCTAssertEqual("dir221", storage.children["dir221"]!.name)
                        XCTAssertEqual(0x0000000000000000, storage.children["dir221"]!.count)
                        XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["dir221"]!.data)))
                        do {
                            var storage = storage.children["dir221"]!
                            XCTAssertEqual(1, storage.children.count)
                            XCTAssertEqual("file2221", storage.children["file2221"]!.name)
                            XCTAssertEqual(0x000000000000005D, storage.children["file2221"]!.count)
                            XCTAssertEqual([0xB1, 0x6C, 0xD3, 0xE5, 0x1F, 0xEF, 0x5E, 0x3A, 0x17, 0xF3, 0x84, 0x13, 0xA2, 0x51, 0xCC, 0x9D, 0xE0, 0x9C, 0xA9, 0xCD, 0x9E, 0x04, 0x64, 0x78, 0x20, 0x30, 0x89, 0xDC, 0x30, 0x79, 0xEC, 0x9B], [UInt8](SHA256.hash(data: storage.children["file2221"]!.data)))
                            do {
                                var storage = storage.children["file2221"]!
                                XCTAssertEqual(0, storage.children.count)
                            }
                        }
                    }
                }

                XCTAssertEqual("dir1", storage.children["dir1"]!.name)
                XCTAssertEqual(0x0000000000000000, storage.children["dir1"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["dir1"]!.data)))
                do {
                    var storage = storage.children["dir1"]!
                    XCTAssertEqual(3, storage.children.count)
                    XCTAssertEqual("file12", storage.children["file12"]!.name)
                    XCTAssertEqual(0x000000000000004E, storage.children["file12"]!.count)
                    XCTAssertEqual([0xFB, 0x84, 0x6D, 0xD1, 0x38, 0xE5, 0xB1, 0xAC, 0x90, 0x2A, 0x7F, 0xD8, 0xA6, 0x18, 0x41, 0xEA, 0x4F, 0x36, 0xEB, 0xD0, 0x83, 0x22, 0x08, 0xC7, 0xEF, 0x57, 0x9A, 0xAD, 0x75, 0x35, 0x61, 0x37], [UInt8](SHA256.hash(data: storage.children["file12"]!.data)))
                    do {
                        var storage = storage.children["file12"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("file11", storage.children["file11"]!.name)
                    XCTAssertEqual(0x000000000000004E, storage.children["file11"]!.count)
                    XCTAssertEqual([0xF7, 0x91, 0x67, 0x62, 0x3A, 0x8A, 0xE9, 0x06, 0xAD, 0x15, 0x09, 0xB2, 0xF3, 0x89, 0x65, 0x76, 0x0F, 0xFC, 0x5F, 0xCB, 0xC0, 0x79, 0x4A, 0x4C, 0xD8, 0xD1, 0x95, 0x97, 0x2C, 0xC7, 0x7B, 0x73], [UInt8](SHA256.hash(data: storage.children["file11"]!.data)))
                    do {
                        var storage = storage.children["file11"]!
                        XCTAssertEqual(0, storage.children.count)
                    }

                    XCTAssertEqual("dir11", storage.children["dir11"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["dir11"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["dir11"]!.data)))
                    do {
                        var storage = storage.children["dir11"]!
                        XCTAssertEqual(1, storage.children.count)
                        XCTAssertEqual("file111", storage.children["file111"]!.name)
                        XCTAssertEqual(0x0000000000000055, storage.children["file111"]!.count)
                        XCTAssertEqual([0xB4, 0x2C, 0x70, 0xDD, 0xA6, 0xAB, 0xC0, 0xB1, 0x78, 0xAA, 0x9B, 0x5D, 0x78, 0x49, 0x76, 0xAF, 0x25, 0x6B, 0x92, 0x2D, 0x4C, 0x0A, 0xA3, 0xB6, 0xDF, 0x6D, 0x08, 0xD4, 0x30, 0x1B, 0xDA, 0xE9], [UInt8](SHA256.hash(data: storage.children["file111"]!.data)))
                        do {
                            var storage = storage.children["file111"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }
                }
            }
        }
        do {
            /* pehohlva/wv2qt */
            let file = try CompoundFile(data: try getData(name: "testole", fileExtension: "doc"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            XCTAssertEqual(0x0000000000000CC0, file.rootStorage.count)
            do {
                var storage = file.rootStorage
                XCTAssertEqual(7, storage.children.count)
                XCTAssertEqual("WordDocument", storage.children["WordDocument"]!.name)
                XCTAssertEqual(0x00000000000059DC, storage.children["WordDocument"]!.count)
                XCTAssertEqual([0xB4, 0x98, 0x58, 0xEC, 0x76, 0xC7, 0x18, 0x91, 0xBC, 0xA4, 0xB6, 0x88, 0x02, 0x6F, 0x93, 0x7E, 0x03, 0x12, 0x4E, 0x09, 0xE9, 0x17, 0x0D, 0x29, 0x8E, 0xE1, 0x14, 0x15, 0x4A, 0xE8, 0x84, 0x09], [UInt8](SHA256.hash(data: storage.children["WordDocument"]!.data)))
                do {
                    var storage = storage.children["WordDocument"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("ObjectPool", storage.children["ObjectPool"]!.name)
                XCTAssertEqual(0x00000000A0000141, storage.children["ObjectPool"]!.count)
                XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["ObjectPool"]!.data)))
                do {
                    var storage = storage.children["ObjectPool"]!
                    XCTAssertEqual(4, storage.children.count)
                    XCTAssertEqual("_1020966487", storage.children["_1020966487"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1020966487"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1020966487"]!.data)))
                    do {
                        var storage = storage.children["_1020966487"]!
                        XCTAssertEqual(5, storage.children.count)
                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x48, 0x3B, 0xF6, 0x4D, 0x5F, 0x67, 0xEF, 0xE8, 0x21, 0x3F, 0x62, 0x68, 0x04, 0xD3, 0x7D, 0x10, 0x2A, 0x15, 0x26, 0x7E, 0x7E, 0x89, 0x7D, 0xE6, 0xEC, 0x2E, 0x54, 0xE8, 0x82, 0x17, 0x2D, 0x6D], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                        XCTAssertEqual(0x0000000000000064, storage.children["\u{01}Ole10Native"]!.count)
                        XCTAssertEqual([0xFE, 0x1B, 0x05, 0x06, 0x71, 0x9C, 0xE5, 0x14, 0x03, 0x88, 0x00, 0x89, 0x19, 0xDC, 0x18, 0xA4, 0xE3, 0x76, 0xF4, 0x72, 0x62, 0xFE, 0xD1, 0xDE, 0xAE, 0x9D, 0x32, 0x3A, 0xF7, 0x86, 0x58, 0xC8], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10ItemName", storage.children["\u{01}Ole10ItemName"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["\u{01}Ole10ItemName"]!.count)
                        XCTAssertEqual([0x2B, 0x99, 0xF2, 0x16, 0xA0, 0x49, 0xA5, 0x16, 0x8A, 0x4D, 0xF0, 0x06, 0xA5, 0xA7, 0x6E, 0x7E, 0xE7, 0x77, 0x9F, 0xCC, 0x70, 0xFB, 0xDA, 0x33, 0x99, 0xED, 0x92, 0xAA, 0xC6, 0x7F, 0x78, 0x51], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10ItemName"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10ItemName"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x0000000000000053, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0x82, 0xCF, 0x89, 0x0C, 0x72, 0xF2, 0x77, 0xEC, 0x77, 0x26, 0x27, 0x02, 0xC1, 0xB0, 0xE4, 0xC5, 0x5D, 0xEA, 0x7C, 0xB5, 0xC2, 0x50, 0xF9, 0xBB, 0x81, 0x78, 0x3D, 0x78, 0x89, 0xBF, 0xB9, 0xC0], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("_1020966263", storage.children["_1020966263"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1020966263"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1020966263"]!.data)))
                    do {
                        var storage = storage.children["_1020966263"]!
                        XCTAssertEqual(5, storage.children.count)
                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x48, 0x3B, 0xF6, 0x4D, 0x5F, 0x67, 0xEF, 0xE8, 0x21, 0x3F, 0x62, 0x68, 0x04, 0xD3, 0x7D, 0x10, 0x2A, 0x15, 0x26, 0x7E, 0x7E, 0x89, 0x7D, 0xE6, 0xEC, 0x2E, 0x54, 0xE8, 0x82, 0x17, 0x2D, 0x6D], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                        XCTAssertEqual(0x00000000000000C4, storage.children["\u{01}Ole10Native"]!.count)
                        XCTAssertEqual([0x97, 0xAE, 0xFB, 0xEC, 0x15, 0x83, 0x3F, 0x11, 0x58, 0x80, 0xC8, 0x6F, 0x7A, 0x41, 0xA0, 0x01, 0xA3, 0x1D, 0x76, 0x5A, 0x05, 0x0F, 0xAB, 0x5D, 0xA2, 0xB7, 0xAF, 0xF8, 0x5E, 0x48, 0xFA, 0x40], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10ItemName", storage.children["\u{01}Ole10ItemName"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["\u{01}Ole10ItemName"]!.count)
                        XCTAssertEqual([0x2B, 0x99, 0xF2, 0x16, 0xA0, 0x49, 0xA5, 0x16, 0x8A, 0x4D, 0xF0, 0x06, 0xA5, 0xA7, 0x6E, 0x7E, 0xE7, 0x77, 0x9F, 0xCC, 0x70, 0xFB, 0xDA, 0x33, 0x99, 0xED, 0x92, 0xAA, 0xC6, 0x7F, 0x78, 0x51], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10ItemName"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10ItemName"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x0000000000000053, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0x82, 0xCF, 0x89, 0x0C, 0x72, 0xF2, 0x77, 0xEC, 0x77, 0x26, 0x27, 0x02, 0xC1, 0xB0, 0xE4, 0xC5, 0x5D, 0xEA, 0x7C, 0xB5, 0xC2, 0x50, 0xF9, 0xBB, 0x81, 0x78, 0x3D, 0x78, 0x89, 0xBF, 0xB9, 0xC0], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("_1020963964", storage.children["_1020963964"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1020963964"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1020963964"]!.data)))
                    do {
                        var storage = storage.children["_1020963964"]!
                        XCTAssertEqual(5, storage.children.count)
                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x48, 0x3B, 0xF6, 0x4D, 0x5F, 0x67, 0xEF, 0xE8, 0x21, 0x3F, 0x62, 0x68, 0x04, 0xD3, 0x7D, 0x10, 0x2A, 0x15, 0x26, 0x7E, 0x7E, 0x89, 0x7D, 0xE6, 0xEC, 0x2E, 0x54, 0xE8, 0x82, 0x17, 0x2D, 0x6D], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                        XCTAssertEqual(0x00000000000000E4, storage.children["\u{01}Ole10Native"]!.count)
                        XCTAssertEqual([0xDA, 0xE3, 0x68, 0xEC, 0xA5, 0x8D, 0x49, 0xA4, 0x19, 0xF7, 0x50, 0xE4, 0xFC, 0x0D, 0x80, 0x43, 0x7B, 0x85, 0x15, 0x46, 0xB1, 0x64, 0x04, 0x3A, 0x86, 0x25, 0x3A, 0x97, 0x77, 0xB3, 0x8D, 0x9B], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10ItemName", storage.children["\u{01}Ole10ItemName"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["\u{01}Ole10ItemName"]!.count)
                        XCTAssertEqual([0x2B, 0x99, 0xF2, 0x16, 0xA0, 0x49, 0xA5, 0x16, 0x8A, 0x4D, 0xF0, 0x06, 0xA5, 0xA7, 0x6E, 0x7E, 0xE7, 0x77, 0x9F, 0xCC, 0x70, 0xFB, 0xDA, 0x33, 0x99, 0xED, 0x92, 0xAA, 0xC6, 0x7F, 0x78, 0x51], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10ItemName"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10ItemName"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x0000000000000053, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0x82, 0xCF, 0x89, 0x0C, 0x72, 0xF2, 0x77, 0xEC, 0x77, 0x26, 0x27, 0x02, 0xC1, 0xB0, 0xE4, 0xC5, 0x5D, 0xEA, 0x7C, 0xB5, 0xC2, 0x50, 0xF9, 0xBB, 0x81, 0x78, 0x3D, 0x78, 0x89, 0xBF, 0xB9, 0xC0], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }

                    XCTAssertEqual("_1020961869", storage.children["_1020961869"]!.name)
                    XCTAssertEqual(0x0000000000000000, storage.children["_1020961869"]!.count)
                    XCTAssertEqual([0xE3, 0xB0, 0xC4, 0x42, 0x98, 0xFC, 0x1C, 0x14, 0x9A, 0xFB, 0xF4, 0xC8, 0x99, 0x6F, 0xB9, 0x24, 0x27, 0xAE, 0x41, 0xE4, 0x64, 0x9B, 0x93, 0x4C, 0xA4, 0x95, 0x99, 0x1B, 0x78, 0x52, 0xB8, 0x55], [UInt8](SHA256.hash(data: storage.children["_1020961869"]!.data)))
                    do {
                        var storage = storage.children["_1020961869"]!
                        XCTAssertEqual(5, storage.children.count)
                        XCTAssertEqual("\u{03}ObjInfo", storage.children["\u{03}ObjInfo"]!.name)
                        XCTAssertEqual(0x0000000000000004, storage.children["\u{03}ObjInfo"]!.count)
                        XCTAssertEqual([0x48, 0x3B, 0xF6, 0x4D, 0x5F, 0x67, 0xEF, 0xE8, 0x21, 0x3F, 0x62, 0x68, 0x04, 0xD3, 0x7D, 0x10, 0x2A, 0x15, 0x26, 0x7E, 0x7E, 0x89, 0x7D, 0xE6, 0xEC, 0x2E, 0x54, 0xE8, 0x82, 0x17, 0x2D, 0x6D], [UInt8](SHA256.hash(data: storage.children["\u{03}ObjInfo"]!.data)))
                        do {
                            var storage = storage.children["\u{03}ObjInfo"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10Native", storage.children["\u{01}Ole10Native"]!.name)
                        XCTAssertEqual(0x0000000000000084, storage.children["\u{01}Ole10Native"]!.count)
                        XCTAssertEqual([0x77, 0x85, 0x44, 0x8A, 0x5B, 0x7C, 0xCD, 0x1E, 0x07, 0x81, 0xE5, 0xCF, 0x8E, 0x57, 0x0B, 0xA7, 0xED, 0x9C, 0x39, 0xBD, 0xFD, 0xE0, 0x7E, 0x56, 0x9B, 0x8D, 0xEF, 0xF1, 0x94, 0xAA, 0x80, 0x9F], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10Native"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10Native"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole10ItemName", storage.children["\u{01}Ole10ItemName"]!.name)
                        XCTAssertEqual(0x0000000000000008, storage.children["\u{01}Ole10ItemName"]!.count)
                        XCTAssertEqual([0x2B, 0x99, 0xF2, 0x16, 0xA0, 0x49, 0xA5, 0x16, 0x8A, 0x4D, 0xF0, 0x06, 0xA5, 0xA7, 0x6E, 0x7E, 0xE7, 0x77, 0x9F, 0xCC, 0x70, 0xFB, 0xDA, 0x33, 0x99, 0xED, 0x92, 0xAA, 0xC6, 0x7F, 0x78, 0x51], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole10ItemName"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole10ItemName"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}Ole", storage.children["\u{01}Ole"]!.name)
                        XCTAssertEqual(0x0000000000000014, storage.children["\u{01}Ole"]!.count)
                        XCTAssertEqual([0xC3, 0x6C, 0x8A, 0x4B, 0x7D, 0xEE, 0x70, 0x3B, 0x9C, 0xE6, 0xE2, 0x88, 0x03, 0x20, 0x33, 0xB7, 0x18, 0xFE, 0xEF, 0x01, 0xCA, 0x28, 0x3C, 0xFA, 0xA4, 0x33, 0x2A, 0x83, 0x34, 0xB2, 0xAD, 0xF3], [UInt8](SHA256.hash(data: storage.children["\u{01}Ole"]!.data)))
                        do {
                            var storage = storage.children["\u{01}Ole"]!
                            XCTAssertEqual(0, storage.children.count)
                        }

                        XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                        XCTAssertEqual(0x000000000000005C, storage.children["\u{01}CompObj"]!.count)
                        XCTAssertEqual([0xE9, 0x6A, 0xBF, 0x89, 0xAB, 0x32, 0x1F, 0xA7, 0x20, 0x91, 0x67, 0x5F, 0xA1, 0x4E, 0x2F, 0xC0, 0x87, 0xEA, 0x83, 0x08, 0xC7, 0x43, 0xE8, 0x4F, 0x3B, 0x46, 0xE0, 0x15, 0x81, 0x38, 0x6D, 0x07], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                        do {
                            var storage = storage.children["\u{01}CompObj"]!
                            XCTAssertEqual(0, storage.children.count)
                        }
                    }
                }

                XCTAssertEqual("Data", storage.children["Data"]!.name)
                XCTAssertEqual(0x0000000000001000, storage.children["Data"]!.count)
                XCTAssertEqual([0x3B, 0xA2, 0xB7, 0x47, 0x47, 0x6F, 0xFF, 0xB5, 0x73, 0x24, 0x71, 0x29, 0x0A, 0x25, 0x7D, 0xB9, 0xB3, 0xF5, 0x5D, 0x0A, 0x73, 0xD9, 0x83, 0x14, 0x2E, 0x2F, 0xD3, 0x23, 0xF9, 0xBD, 0xDB, 0x20], [UInt8](SHA256.hash(data: storage.children["Data"]!.data)))
                do {
                    var storage = storage.children["Data"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("1Table", storage.children["1Table"]!.name)
                XCTAssertEqual(0x00000000000020A6, storage.children["1Table"]!.count)
                XCTAssertEqual([0x80, 0xF3, 0x0D, 0x9C, 0xBA, 0x33, 0x28, 0x17, 0xAE, 0x65, 0xB8, 0x1C, 0xE0, 0xDD, 0x71, 0x8F, 0x80, 0x55, 0x81, 0xBF, 0x6F, 0x26, 0x40, 0xA8, 0xC8, 0x4F, 0xE1, 0x59, 0x07, 0x2B, 0x03, 0x07], [UInt8](SHA256.hash(data: storage.children["1Table"]!.data)))
                do {
                    var storage = storage.children["1Table"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}SummaryInformation", storage.children["\u{05}SummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001C4, storage.children["\u{05}SummaryInformation"]!.count)
                XCTAssertEqual([0x19, 0xD8, 0xE3, 0x65, 0x32, 0x7F, 0x09, 0xE8, 0x14, 0xCA, 0x7A, 0x9B, 0xF1, 0x14, 0x89, 0x01, 0xFC, 0xFA, 0xD7, 0xE0, 0x1F, 0x26, 0x29, 0xDC, 0x5A, 0x22, 0x8F, 0x89, 0x02, 0x75, 0x5B, 0xDE], [UInt8](SHA256.hash(data: storage.children["\u{05}SummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}SummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{05}DocumentSummaryInformation", storage.children["\u{05}DocumentSummaryInformation"]!.name)
                XCTAssertEqual(0x00000000000001E0, storage.children["\u{05}DocumentSummaryInformation"]!.count)
                XCTAssertEqual([0xC0, 0x35, 0xFA, 0xFE, 0x0B, 0x8D, 0xA3, 0xF7, 0x0D, 0x89, 0xC4, 0x02, 0x73, 0x2F, 0xA7, 0xDC, 0xBD, 0x5E, 0x33, 0x0A, 0xD1, 0x90, 0x72, 0xF3, 0x8E, 0x2E, 0x5B, 0xD0, 0x94, 0x0D, 0x0D, 0x2D], [UInt8](SHA256.hash(data: storage.children["\u{05}DocumentSummaryInformation"]!.data)))
                do {
                    var storage = storage.children["\u{05}DocumentSummaryInformation"]!
                    XCTAssertEqual(0, storage.children.count)
                }

                XCTAssertEqual("\u{01}CompObj", storage.children["\u{01}CompObj"]!.name)
                XCTAssertEqual(0x000000000000006A, storage.children["\u{01}CompObj"]!.count)
                XCTAssertEqual([0x6F, 0x1E, 0xC7, 0x17, 0xCD, 0x67, 0x1C, 0x4E, 0x65, 0x32, 0x1A, 0x11, 0x29, 0xF6, 0xFE, 0x30, 0x36, 0xE0, 0xEF, 0xFC, 0x4F, 0x87, 0xB3, 0xC7, 0x21, 0x60, 0xEE, 0xED, 0x71, 0x48, 0x37, 0x60], [UInt8](SHA256.hash(data: storage.children["\u{01}CompObj"]!.data)))
                do {
                    var storage = storage.children["\u{01}CompObj"]!
                    XCTAssertEqual(0, storage.children.count)
                }
            }
        }
        /*
        do {
            /* ironfede/openmcdf */
            let file = try CompoundFile(data: try getData(name: "poWEr.prelim", fileExtension: "doc"))
            print(testDump(accessor: "file", file: file))
        }
        */
    }

    func testConstructorInvalid() throws {
        XCTAssertThrowsError(try CompoundFile(data: Data([])))
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "corrupted-sector-chain-2", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "corrupted-sector-chain", fileExtension: "cfs")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "corrupted-sector-chain", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        /*
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "CyclicFAT", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "CorruptedDoc_bug36", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "empty_directory_chain", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
         */
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "no_sectors", fileExtension: "doc")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        /*
        do {
            /* ironfede/openmcdf */
            let data = try getData(name: "_thumbs_bug_24", fileExtension: "db")
            XCTAssertThrowsError(try CompoundFile(data: data))
        }
        */
    }

    func testPerformance1() throws {
        do {
            /* hughbe */
            let file = try CompoundFile(data: try getData(name: "custom", fileExtension: "msg"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)

            let children = file.rootStorage.children
            XCTAssertEqual(74, children.count)
            XCTAssertNotNil(children["__substg1.0_0044001F"])
            XCTAssertNotNil(children["__substg1.0_00520102"])
            XCTAssertNotNil(children["__nameid_version1.0"])
            XCTAssertNotNil(children["__recip_version1.0_#00000000"])

            let substg = children["__substg1.0_0044001F"]!
            measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
                for _ in 0...50_000 {
                    let _ = substg.data
                }
            }
        }
    }
    
    func testPerformance2() throws {
        do {
            /* hughbe */
            let file = try CompoundFile(data: try getData(name: "VBA Project", fileExtension: "pps"))
            let storage = file.rootStorage.children["PowerPoint Document"]!
            measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
                for _ in 0...10_000 {
                    let _ = storage.data
                }
            }
        }
    }

    static var allTests = [
        ("testConstructor", testConstructor),
        ("testConstructorInvalid", testConstructorInvalid),
        ("testPerformance1", testPerformance1),
        ("testPerformance2", testPerformance2),
    ]
}

//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BigEndianNumber.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Foundation

internal final class IntegerBytesOverflowError: DescribedError {

    private let bytes: Data
    private let sizeLimit: Int
    public init(bytes: Data, sizeLimit: Int) {
        self.bytes = bytes
        self.sizeLimit = sizeLimit
    }

    internal var description: String {
        return "Integer with hex representation \(bytes.toHexString()) exceeds maximum size \(sizeLimit) by \(bytes.count - sizeLimit)"
    }

}

///** Big endian number */
//public final class EthNaturalNumber: BytesScalar {
//
//    private let bytes: BytesScalar
//
//    /**
//    Ctor
//
//    - parameters:
//        - bytes: bytes representation of a big endian number
//    */
//    public init(bytes: BytesScalar) {
//        self.bytes = bytes
//    }
//
//    /**
//    Ctor
//
//    - parameters:
//        - value: integer representation of a big endian number
//    */
//    public convenience init(value: Int) {
//        self.init(
//            bytes: ReversedBytes(
//                origin: IntegerBytes(
//                    value: value.littleEndian
//                )
//            )
//        )
//    }
//
//    /**
//    Ctor
//
//    - parameters:
//        - hex: hexadecimal string representation of a big endian number. Must not be ambiguous.
//    */
//    public convenience init(hex: StringScalar) {
//        self.init(
//            bytes: BytesFromHexString(
//                hex: hex
//            )
//        )
//    }
//
//    /**
//    - returns:
//    bytes of the number in big endian order
//
//    - throws:
//    doesn't throw
//    */
//    public func value() throws -> Data {
//        return try bytes.value()
//    }
//
//    /**
//    - returns:
//    unsigned integer representation of the number
//
//    - throws:
//    `DescribedError` if something went wrong or if the size of the number is too big for `Int`
//    */
//    public func value() throws -> Int {
//        let bytes = try LeadingCompactBytes(origin: self.bytes).value()
//        guard bytes.count <= MemoryLayout<Int>.size else {
//            throw IntegerBytesOverflowError(
//                bytes: bytes,
//                sizeLimit: MemoryLayout<Int>.size
//            )
//        }
//        var integer = Int(0).bigEndian
//        bytes.forEach{ byte in
//            integer = integer << 8
//            integer = integer | Int(byte)
//        }
//        return integer
//    }
//
//}

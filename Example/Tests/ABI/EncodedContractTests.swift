//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EncodedContractTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EncodedContractTests: XCTestCase {

    func testSingleNumber() {
        expect{
            try EncodedContract(
                byteCode: BytesFromHexString(
                    hex: "60606040523415600e57600080fd5b604051602080608683398101604052808051906020019091905050806000806101000a81548160ff021916908360ff1602179055505060358060516000396000f3006060604052600080fd00a165627a7a72305820b6108f3cf97aa582d7d420f5068f08ec3759636182894e9e9db73b389e6afedc0029"
                ),
                arguments: [
                    ABIUnsignedNumber(
                        origin: EthNaturalNumber(
                            value: 1
                        )
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0x60606040523415600e57600080fd5b604051602080608683398101604052808051906020019091905050806000806101000a81548160ff021916908360ff1602179055505060358060516000396000f3006060604052600080fd00a165627a7a72305820b6108f3cf97aa582d7d420f5068f08ec3759636182894e9e9db73b389e6afedc00290000000000000000000000000000000000000000000000000000000000000001"
                )
            ),
            description: "Contract ctor uint8 is expected to be encoded correctly"
        )
    }

    func testDynamicNumbersArrayBoolString() {
        expect{
            try EncodedContract(
                byteCode: BytesFromHexString(
                    hex: "6060604052341561000f57600080fd5b60405161024c38038061024c83398101604052808051820191906020018051906020019091908051820191905050826000908051906020019061005392919061008d565b5081600160006101000a81548160ff0219169083151502179055508060029080519060200190610084929190610134565b50505050610209565b82805482825590600052602060002090601f016020900481019282156101235791602002820160005b838211156100f457835183826101000a81548160ff021916908360ff16021790555092602001926001016020816000010492830192600103026100b6565b80156101215782816101000a81549060ff02191690556001016020816000010492830192600103026100f4565b505b50905061013091906101b4565b5090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017557805160ff19168380011785556101a3565b828001600101855582156101a3579182015b828111156101a2578251825591602001919060010190610187565b5b5090506101b091906101e4565b5090565b6101e191905b808211156101dd57600081816101000a81549060ff0219169055506001016101ba565b5090565b90565b61020691905b808211156102025760008160009055506001016101ea565b5090565b90565b6035806102176000396000f3006060604052600080fd00a165627a7a72305820e1ddf2fe77b310f43fa2771ba9eaf8f017a63d036c19e046b3c3393a763ccebb0029"
                ),
                arguments: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: EthNaturalNumber(
                                    value: 1
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNaturalNumber(
                                    value: 2
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNaturalNumber(
                                    value: 3
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNaturalNumber(
                                    value: 4
                                )
                            )
                        ]
                    ),
                    ABIBoolean(
                        origin: true
                    ),
                    ABIString(
                        origin: SimpleString(
                            string: "helloworld"
                        )
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "6060604052341561000f57600080fd5b60405161024c38038061024c83398101604052808051820191906020018051906020019091908051820191905050826000908051906020019061005392919061008d565b5081600160006101000a81548160ff0219169083151502179055508060029080519060200190610084929190610134565b50505050610209565b82805482825590600052602060002090601f016020900481019282156101235791602002820160005b838211156100f457835183826101000a81548160ff021916908360ff16021790555092602001926001016020816000010492830192600103026100b6565b80156101215782816101000a81549060ff02191690556001016020816000010492830192600103026100f4565b505b50905061013091906101b4565b5090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017557805160ff19168380011785556101a3565b828001600101855582156101a3579182015b828111156101a2578251825591602001919060010190610187565b5b5090506101b091906101e4565b5090565b6101e191905b808211156101dd57600081816101000a81549060ff0219169055506001016101ba565b5090565b90565b61020691905b808211156102025760008160009055506001016101ea565b5090565b90565b6035806102176000396000f3006060604052600080fd00a165627a7a72305820e1ddf2fe77b310f43fa2771ba9eaf8f017a63d036c19e046b3c3393a763ccebb002900000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000a68656c6c6f776f726c6400000000000000000000000000000000000000000000"
                )
            ),
            description: "Contract ctor []uint8, bool, string is expected to be encoded correctly"
        )
    }

}

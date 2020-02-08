//
//  model.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 05/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import Foundation
import CryptoKit


private var actualCounterValue: UInt = 0

func generateSequenceKey() -> String{
    let keySize = SymmetricKeySize.bits256
    let key = SymmetricKey(size: keySize);
    let keyb64 = key.withUnsafeBytes {
       return Data(Array($0)).base64EncodedString()
    }
    return keyb64
}

func getKeyFromBase64String(_ base64Key: String) -> SymmetricKey? {
    if let keyData = Data(base64Encoded: base64Key) {
        return SymmetricKey(data: keyData)
    }
    return nil
}

func get128bitCounterDataFrom(_ value: UInt) -> Data {
    var counter = String(value, radix: 2)
    
    while counter.count < 128 {
        counter = "0" + counter
    }
    
    return Data(counter.utf8)
    
}

func getCypheredCounter128Bit(using key: SymmetricKey) -> String? {
    let counter = get128bitCounterDataFrom(actualCounterValue)
    actualCounterValue = actualCounterValue + 1
    
    guard let cypheredCounter = try? AES.GCM.seal(counter, using: key) else {
        assert(true, "Error cyphering counter")
        return nil
    }
    
    let simplified128Counter = ([UInt8](cypheredCounter.ciphertext)).map { value -> String in
        if (0..<127).contains(value){
            return "0"
        }
        else {
            return "1"
        }
    }
    
    return Array(simplified128Counter[0..<(simplified128Counter.count/2)]).joined()
}

var numberOfRows: Int = 11
var columns: [String] = ["A", "B", "C", "D", "E", "F", "G"]

var cards: [ [String: [String]] ]?

func generateCardArray(  passwordLenght: Int, charactersArrayOfString: [String], sequenceKey: SymmetricKey, numberOfCards: Int) ->  [[String]]?{
//        var card = [String: [String]]()
        var card = [[String]]()
        
        for number in 0..<numberOfRows {
            var row = [String]()
//            row.append(columns[number])
            row.append(String(number))

            for columnIndex in 0..<columns.count {
                if (number == 0) {
                    row.append(columns[columnIndex])
                } else {
                let cell = getCellPasswordWithLenght(passwordLenght, fromCharacterSet: charactersArrayOfString, withKey: sequenceKey)
                row.append(cell)
                }
            }
//            print(row)
            card.append(row)
//            card[columns[number]] = column
        }
    
    return card
}

func getCellPasswordWithLenght(_ passwordLength: Int, fromCharacterSet characterSet: [String], withKey key: SymmetricKey) -> String {
    
    var cell = ""
    
    for _ in 0..<passwordLength {
        
        let ciphered128BitCounter = getCypheredCounter128Bit(using: key) ?? " "
        let cipheredCounterValue = strtoul(ciphered128BitCounter, nil, 2)
        let characterToAssign = cipheredCounterValue % UInt(characterSet.count)
        let characterIndex = Int(characterToAssign)
        cell = cell + characterSet[characterIndex]
    }
    
//    print(cell)
    return cell
}

func getCharacterArrayFrom(_ characters: String) -> [String]? {
    let values = characters.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    
    if values != "" {
        return Array(Set(values)).map({String($0)}).sorted()
    }
    else {
        return nil
    }
    
}

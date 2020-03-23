//
//  ViewController.swift
//  Intro_CodeSignal
//
//  Created by Trinh Thai on 3/20/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(shapeArea(n: 3))
    }

    // MARK: - Task 2
    func centuryFromYear(year: Int) -> Int {
        return (year + 99) / 100
    }

    // MARK: - Task 3
    func checkPalindrome(inputString: String) -> Bool {
      return String(inputString.reversed()) == inputString
    }
    
    // MARK: - Task 4
    func adjacentElementsProduct(inputArray: [Int]) -> Int {
        let res = stride(from: 0, to: inputArray.count - 1, by: 1).map {
            inputArray[$0] * inputArray[$0 + 1]
        }
        return res.max()!
    }
    
    // MARK: - Task 5
    func shapeArea(n: Int) -> Int {
        guard n > 1 else { return 1 }
        let w = n * 2 - 1
        var area = w * w
        for i in 1...n - 1 {
            area = area - i * 4
        }
        return area
    }

    func BEST_shapeArea(n: Int) -> Int {
        
        return (n * n) + ((n - 1) * (n - 1))
    }
    
    func shapeArea2(n: Int) -> Int {
        return n == 1 ? 1 : shapeArea(n: n - 1) + (4 * (n - 1))
    }
    
    func shapeArea3(n: Int) -> Int {
        return (0..<n).map {4 * $0}.reduce(0, +) + 1
    }
    
    func shapeArea4(n: Int) -> Int {
     return Int( pow(Double(n), 2) + pow(Double(n - 1), 2)  )
    }

    // MARK: - Task 6
    func makeArrayConsecutive2(statues: [Int]) -> Int {
        return statues.max()! - statues.min()! - statues.count + 1
    }
    
    func almostIncreasingSequence(sequence: [Int]) -> Bool {
        var count = 0
        for (i, num) in sequence.enumerated() {
            if i < sequence.count - 1 {
                if num - sequence[i + 1] < 0 {
                    count += 1
                    if count == 2 {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    // MARK: - Task 21
    func isIPv4Address(inputString: String) -> Bool {
        guard !inputString.contains("..") else { return false }
        let inputArr = inputString.split(separator: ".")
        guard inputArr.count == 4 else { return false }
        for str in inputArr {
            if str.count > 1 && Array(str)[0] == "0"  { return false }
            guard let num = Int(str) else { return false }
            guard num >= 0 && num <= 255 else { return false}
        }
        return true
    }
    func ok1_isIPv4Address(inputString: String) -> Bool {
        var components = inputString.components(separatedBy: ".").map { Int($0) }
        
        if components.count != 4 {
            return false
        }
        
        return components.filter { $0 > -1 && $0 <= 255 }.count == 4
    }

    func ok2_isIPv4Address(inputString: String) -> Bool {
        let values = inputString.components(separatedBy: ".").map { Int($0) }
        return values.count == 4 && !values.contains { $0 == nil || !(0..<256).contains($0!) }
    }




}


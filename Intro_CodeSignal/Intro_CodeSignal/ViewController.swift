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
    
    // only pass 18/21 test: xem cach lam hui
    func ok1_isIPv4Address(inputString: String) -> Bool {
        let components = inputString.components(separatedBy: ".").flatMap { Int($0) }
        
        if components.count != 4 {
            return false
        }
        
        return components.filter { $0 > -1 && $0 <= 255 }.count == 4
    }
    
    // only pass 17/21 test: xem cach lam hui
    func ok2_isIPv4Address(inputString: String) -> Bool {
        let values = inputString.components(separatedBy: ".").map { Int($0) }
        return values.count == 4 && !values.contains { $0 == nil || !(0..<256).contains($0!) }
    }
    
    // MARK: - Task 22
    func avoidObstacles(inputArray: [Int]) -> Int {
        let max = inputArray.max()!
        for i in 1...max {
            var temp = 0
            while temp <= max {
                temp += i
                if inputArray.contains(temp) {
                    temp = -1
                    break
                }
            }
            if temp != -1 {
                return i
            }
        }
        return max + 1
    }
    
    func BEST_avoidObstacles(inputArray: [Int]) -> Int {
        var minimumJump = 1
        while inputArray.map({ $0 % minimumJump }).contains(0) {
            minimumJump += 1
        }
        return minimumJump
    }
    
    // MARK: - Task 23
    func boxBlur(image: [[Int]]) -> [[Int]] {
        var resultArr: [[Int]] = []
        for i in 0...image.count - 3 {
            resultArr.append([])
            for j in 0...image[0].count - 3 {
                let num = calculateAverage(i: i, j: j, array: image)
                resultArr[i].append(num)
            }
        }
        return resultArr
    }
    
    func calculateAverage(i: Int, j: Int, array: [[Int]]) -> Int{
        var sum = 0
        for ii in i...i + 2 {
            for jj in j...j + 2 {
                sum += array[ii][jj]
            }
        }
        return sum / 9
    }
    
    //other: NOTE: Use reduce for zArray
    func getArrayAverage(x: Int, y: Int, imageArray: [[Int]]) -> Int {
        var average:Int = 0
        for xArray in imageArray[y...(y+2)] {
            average += xArray[x...(x+2)].reduce(0, +)
        }
        
        return Int((Double(average)/9).rounded(.down))
        
    }
    
    
    func ok_boxBlur(image: [[Int]]) -> [[Int]] {
        let sizeX = image[0].count - 2
        let sizeY = image.count - 2
        var result: [[Int]] = [[Int]]()
        for yIndex in 0..<sizeY {
            var xArray = [Int]()
            for xIndex in 0..<sizeX {
                let av = getArrayAverage(x:xIndex, y:yIndex, imageArray: image)
                xArray.append(av)
            }
            result.append(xArray)
        }
        return result
    }
    
    // MARK: - Task 25

    func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
        let resultArray = inputArray.map({ (num) -> Int in
            if num == elemToReplace {
                return substitutionElem
            }
            return num
        })
        return resultArray
    }

    func arrayReplace1(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int]
    {
        return inputArray.map{$0 == elemToReplace ? substitutionElem : $0 }
    }

    
    
}


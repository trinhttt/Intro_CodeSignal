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


}


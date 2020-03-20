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
        // Do any additional setup after loading the view.
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

}


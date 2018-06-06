//
//  Calculator.swift
//  Calculator
//
//  Created by 钟凡 on 2018/3/29.
//

import Foundation

public class Calculator {
    // MARK: - 常量
    let operators:[String] = ["x", "/", "+", "-"]
    // MARK: - 变量
    var calculateStr:String = ""
    var result:Float = 0
    lazy var calculateArray: [String] = {
        return [String]()
    }()
    // MARK: - 回调
    public var didFinishCalculateBlock:((String) -> ())?
    
    public init() {
        
    }
    public func reset() {
        result = 0
        calculateStr = ""
        calculateArray.removeAll()
    }
    public func calculate(_ str: String) {
        switch str {
        case "+", "-", "x", "/":
            calculateArray.append(calculateStr)
            calculateArray.append(str)
            calculateStr = ""
            break
        case "=":
            calculateArray.append(calculateStr)
            calculateResult(calculateArray)
            break
        default:
            calculateStr.append(str)
            break
        }
    }
    
    func calculateResult(_ arr: [String]) {
        print(arr)
        for op in operators {
            if let index = arr.index(of: op) {
                if index >= 1 && index < arr.count - 1 {
                    let left = Float(arr[index - 1]) ?? 0
                    let right = Float(arr[index + 1]) ?? 0
                    let result = calculateCount(op, left, right)
                    var tempArr = arr
                    tempArr[index] = result.description
                    //先删除后面的，顺序不会乱
                    tempArr.remove(at: index + 1)
                    tempArr.remove(at: index - 1)
                    calculateResult(tempArr)
                    return
                }
            }
        }
        
        if(arr.count == 1) {
            print(arr[0])
            var resultString = arr[0]
            if resultString == "inf" {
                resultString = "错误"
            }
            didFinishCalculateBlock?(resultString)
            calculateStr = resultString
            calculateArray.removeAll()
        }
    }
    func calculateCount(_ op: String, _ left: Float, _ right: Float) -> Float {
        switch op {
        case "+":
            result = left + right
            break
        case "-":
            result = left - right
            break
        case "x":
            result = left * right
            break
        case "/":
            result = left / right
            break
        default: break
        }
        return result
    }
}

//
//  CalculatorController.swift
//  Calculator
//
//  Created by 钟凡 on 2018/3/29.
//

import UIKit

public class CalculatorController: UIViewController {
    
    let allItem = ["7","8","9","+",
                   "4","5","6","-",
                   "1","2","3","x",
                   ".","0","=","/"]
    public var tintColor:UIColor? = UIColor.blue
    public var didSeletctItemBlock:((_ item: String)->())?
    
    func loadData() {
        let containerW = view.bounds.size.width / 4
        let btnW = containerW * 0.8
        for (index, name) in allItem.enumerated() {
            autoreleasepool {
                let centerX = CGFloat(index % 4) * containerW + containerW * 0.5
                let centerY = CGFloat(index / 4) * containerW + containerW * 0.5
                let btn = UIButton(type: .system)
                btn.tag = index
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
                let btnFrame = CGRect(origin: .zero, size: CGSize(width: btnW, height: btnW))
                btn.frame = btnFrame
                btn.center = CGPoint(x: centerX, y: centerY)
                btn.setTitle(name, for: .normal)
                btn.setTitleColor(tintColor, for: .normal)
                let backLayer = CAShapeLayer()
                let path = UIBezierPath(ovalIn: btnFrame)
                backLayer.path = path.cgPath
                let color = tintColor?.withAlphaComponent(0.2)
                backLayer.fillColor = color?.cgColor
                btn.layer.insertSublayer(backLayer, at: 0)
                btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
                view.addSubview(btn)
            }
        }
    }
    @objc func btnClick(btn:UIButton) {
        if (didSeletctItemBlock != nil) {
            didSeletctItemBlock!(allItem[btn.tag])
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.autoresizingMask = []
        // 适配iphone
        let marginBottom:CGFloat = UIApplication.shared.statusBarFrame.size.height > 20 ? 20:0
        view.bounds.size = CGSize(width: view.bounds.size.width, height: view.bounds.size.width + marginBottom)

        view.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        loadData()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

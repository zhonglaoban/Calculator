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
    
    public var didSeletctItemBlock:((_ item: String)->())?
    
    func loadData() {
        let containerW = view.bounds.size.width / 4
        let btnW = containerW - 4
        for (index, name) in allItem.enumerated() {
            let centerX = CGFloat(index % 4) * containerW + containerW * 0.5
            let centerY = CGFloat(index / 4) * containerW + containerW * 0.5
            let btn = UIButton(type: .system)
            btn.tag = index
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            btn.frame = CGRect(origin: .zero, size: CGSize(width: btnW, height: btnW))
            btn.center = CGPoint(x: centerX, y: centerY)
            btn.setTitle(name, for: .normal)
            btn.setTitleColor(UIColor.red, for: .normal)
            btn.layer.cornerRadius = btnW * 0.5
            btn.layer.borderColor = UIColor.red.cgColor
            btn.layer.borderWidth = 1
            btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            view.addSubview(btn)
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
        let marginBottom:CGFloat = UIApplication.shared.statusBarFrame.size.height > 20 ? 20:0
        view.bounds.size = CGSize(width: view.bounds.size.width, height: view.bounds.size.width + marginBottom)
        loadData()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

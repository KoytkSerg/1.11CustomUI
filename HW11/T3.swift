//
//  T3.swift
//  HW11
//
//  Created by Sergii Kotyk on 25/3/21.
//

import UIKit
protocol T3Delegate: class {
    func button1Pressed(_ t3: T3)
    func button2Pressed(_ t3: T3)
}
@IBDesignable
class T3: UIView {
   weak var delegate: T3Delegate?
    private let animateView = UIView()
    private let button1 = UIButton(type: UIButton.ButtonType.system)
    private let button2 = UIButton(type: UIButton.ButtonType.system)
    
    
    @IBInspectable var backColor: UIColor = UIColor.blue{
        didSet{animateView.backgroundColor = backColor}
    }
    @IBInspectable var borderColor: UIColor = UIColor.black{
        didSet{layer.borderColor = borderColor.cgColor}
    }
    @IBInspectable var B1Title: String = "1"{
        didSet{button1.setTitle(B1Title, for: .normal)}
    }
    @IBInspectable var B2Title: String = "2"{
        didSet{button2.setTitle(B1Title, for: .normal)}
    }
    
    func  updateViews() {
        let w = frame.size.width
        let h = frame.size.height
        
        
        button1.frame = CGRect(x: 0, y: 0, width: w / 2, height: h)
        button2.frame = CGRect(x: w / 2, y: 0, width: w / 2, height: h)
        animateView.frame = button1.frame
        animateView.backgroundColor = backColor
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 2
        button1.setTitleColor(UIColor.white, for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button1.setTitle(B1Title, for: .normal)
        button2.setTitle(B2Title, for: .normal)
        button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        addSubview(animateView)
        addSubview(button1)
        addSubview(button2)
    }
    
    
    
    @objc func button1Action(sender: UIButton!){
        delegate?.button1Pressed(self)
        button1.setTitleColor(UIColor.white, for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        UIView.animate(withDuration: 0.1, animations: {
            self.animateView.frame = self.button1.frame
        })
    }
    @objc func button2Action(sender: UIButton!){
        delegate?.button2Pressed(self)
        button2.setTitleColor(UIColor.white, for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        UIView.animate(withDuration: 0.1, animations: {
            self.animateView.frame = self.button2.frame
        })
    }
    
    
    override func prepareForInterfaceBuilder() {
                super.prepareForInterfaceBuilder()
                updateViews()
            }

    override func awakeFromNib() {
                super.awakeFromNib()
                updateViews()
            }
}






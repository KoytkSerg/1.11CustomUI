//
//  button1.swift
//  HW11
//
//  Created by Sergii Kotyk on 24/3/21.
//

import UIKit

@IBDesignable
class button1: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.red{
        didSet{layer.borderColor = borderColor.cgColor}
    }
    
    @IBInspectable var radius: CGFloat = 10{
        didSet {layoutIfNeeded()}
    }
    @IBInspectable var BWidth: CGFloat = 5{
        didSet {layer.borderWidth = BWidth}
    }
    
    func updateViews(){
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = BWidth
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

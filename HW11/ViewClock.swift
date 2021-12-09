//
//  ViewClock.swift
//  HW11
//
//  Created by Sergii Kotyk on 24/3/21.
//

import UIKit

@IBDesignable
class ViewClock: UIView {
       
       var markerHeight: CGFloat = 4
       var markerLength: CGFloat = 12
       var isSetuped = false
       var markerColour: UIColor = UIColor.purple
    
    var lineScale: CGFloat = 10
       var hourLineSize: CGFloat = 6
    @IBInspectable var hourLineLength: CGFloat = 50{
        didSet {layoutIfNeeded()}
    }
       var minuteLineSize: CGFloat = 4
      @IBInspectable var minuteLineLength: CGFloat = 10{
        didSet {layoutIfNeeded()}
    }
       var secondLineSize: CGFloat = 1
     @IBInspectable  var secondLineLength: CGFloat = 1{
        didSet {layoutIfNeeded()}
    }
       var roundViewColour = UIColor.purple
    
    @IBInspectable
    var hourLineColour: UIColor = UIColor.purple{
           didSet{hourLine.backgroundColor = hourLineColour}
       }
    @IBInspectable
    var minuteLineColour: UIColor = UIColor.purple{
        didSet{minuteLine.backgroundColor = minuteLineColour}
    }
    @IBInspectable
    var secondLineColour: UIColor = UIColor.purple{
        didSet{secondLine.backgroundColor = secondLineColour}
    }
        
      
    
       
       private let topMarker = UIView()
       private let tleftMarker = UIView()
       private let rightMarker = UIView()
       private let bottomMarker = UIView()
       private let hourLine = UIView()
       private let roundView = UIView()
       private let minuteLine = UIView()
       private let secondLine = UIView()
       

        func updateViews() {
        
           let w = frame.size.width
           let h = frame.size.height
           
           hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
           minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
           secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
           secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: secondLineLength - lineScale, width: secondLineSize, height: h / 2 - secondLineLength + lineScale)
           minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2, y: minuteLineLength - lineScale, width: minuteLineSize, height: h / 2 - minuteLineLength + lineScale)
           hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineLength - lineScale, width: hourLineSize, height: h / 2 - hourLineLength + lineScale)
        
           roundView.frame = CGRect(x: w/2 - 8, y: h/2 - 8, width: 16, height: 16)
           roundView.layer.cornerRadius = 8
           
           updateHours()
        updateMinutes()
        updateSeconds()
           
           topMarker.frame = CGRect(x: w / 2 - markerHeight / 2, y: 0, width: markerHeight, height: markerLength)
           tleftMarker.frame = CGRect(x: 0, y: h / 2 - markerHeight / 2, width: markerLength, height: markerHeight)
           rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerHeight / 2, width: markerLength, height: markerHeight)
           bottomMarker.frame = CGRect(x: w / 2 - markerHeight / 2, y: h - markerLength, width: markerHeight, height: markerLength)
           
           
           for v in [topMarker , bottomMarker , tleftMarker , rightMarker , hourLine , roundView , minuteLine , secondLine]{
               v.backgroundColor = markerColour
               addSubview(v)
           }
           roundView.backgroundColor = roundViewColour
           hourLine.backgroundColor = hourLineColour
           minuteLine.backgroundColor = minuteLineColour
           secondLine.backgroundColor = secondLineColour
           layer.cornerRadius = w / 2

           

       }
    override func prepareForInterfaceBuilder() {
                super.prepareForInterfaceBuilder()
                updateViews()
            }

    override func awakeFromNib() {
                super.awakeFromNib()
                updateViews()
            }
    var hours: CGFloat = 5
    var minutes: CGFloat = 40
    var seconds: CGFloat = 5
    
       func updateHours(){
           let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
           hourLine.transform = CGAffineTransform(rotationAngle: angle)
       }
       func updateMinutes(){
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
       }
       func updateSeconds(){
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
      }
   }



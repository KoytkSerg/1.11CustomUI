//
//  ViewController.swift
//  HW11
//
//  Created by Sergii Kotyk on 24/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var T3view: T3!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    T3view.delegate = self

    }
}

extension ViewController: T3Delegate{
    func button1Pressed(_ t3: T3) {
        print("111")
    }
    
    func button2Pressed(_ t3: T3) {
        print("222")
    }
    
   
    
   
    
    
}
    


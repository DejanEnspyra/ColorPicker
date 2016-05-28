//
//  ViewController.swift
//  TestSwiftProject
//
//  Created by Born2invest on 28/05/16.
//  Copyright © 2016 TheAppSpace. All rights reserved.
//

import UIKit

class ViewController: UIViewController,colorDelegate {
    @IBOutlet var colorPicker: ColorPicker!
    @IBOutlet var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func pickedColor(color: UIColor) {
        colorView.backgroundColor = color;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


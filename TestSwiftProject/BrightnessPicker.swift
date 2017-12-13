//
//  BrightnessPicker.swift
//  TestSwiftProject
//
//  Created by Michael Kroth on 12/12/17.
//  Copyright © 2017 TheAppSpace. All rights reserved.
//

import UIKit

class BrightnessPicker : ColorPicker {
    
    var firstBrightnessDraw = true
    
    override func draw(_ rect: CGRect) {
        //UIColor.black.setFill()
        let width = Int(self.frame.size.width)
        for i in 0 ..< width + 1 {
            let alpha = CGFloat(i) / self.frame.size.width
            UIColor(white: 1.0, alpha: alpha).set()
            let temp = CGRect(x: CGFloat (i), y: 0, width: 1.0, height: self.frame.size.height)
            UIRectFill(temp);
        }
        // Add the indicator
        indicator.strokeColor = UIColor.darkGray.cgColor
        indicator.fillColor = indicatorColor
        indicator.lineWidth = indicatorBorderWidth
        self.layer.addSublayer(indicator)
        
        if(firstBrightnessDraw){
            point = CGPoint(x: self.frame.size.width, y: 0)
            firstBrightnessDraw = false
        }
        drawIndicator()
    }
    
    override func updateColor(touch: UITouch){

        guard touch.location(in: self).x > 0 && touch.location(in: self).x < self.frame.size.width else {
            return
        }
        // Update indicator position
        point = CGPoint(x: touch.location(in: self).x, y: 0)
        drawIndicator()

        let selectionX = (touch.location(in: self).x) / self.frame.size.width
        
        // get the saved color parameters, adjust brightness, send to delegate
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 1.0
        var alpha: CGFloat = 0
        let sColor = ColorControl.shared.selectedColor

        if sColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha){
            ColorControl.shared.selectedBrightness = 1.0 * selectionX
        }
        
        let adjustedColor = UIColor(hue: hue, saturation: saturation, brightness: 1.0 * selectionX, alpha: alpha)
        delegate.pickedColor(color: adjustedColor)
        self.setNeedsDisplay()
    }
}

//
//  ColorPicker.swift
//
//  Created by Dejan Atanasov on 12/25/15.
//

import UIKit

protocol ColorDelegate{
    func pickedColor(color:UIColor)
}

class ColorPicker: UIView {

    var selectedColor: UIColor!
    var delegate: ColorDelegate!
    
    var point: CGPoint!
    var indicator = CAShapeLayer()
    var indicatorColor: CGColor = UIColor.lightGray.cgColor
    var indicatorBorderWidth: CGFloat = 2.0
    var firstDraw = true
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        let width = Int(self.frame.size.width)
        for i in 0 ..< width {
                UIColor(hue:CGFloat (i)/self.frame.size.width, saturation: 1.0, brightness: 1.0, alpha: 1.0).set()
                let temp = CGRect(x: CGFloat (i), y: 0, width: 1.0, height: self.frame.size.height)
                UIRectFill(temp);
            }
        
        // Add the indicator
        indicator.strokeColor = UIColor.darkGray.cgColor
        indicator.fillColor = indicatorColor
        indicator.lineWidth = indicatorBorderWidth
        self.layer.addSublayer(indicator)
        
        // places the indicator in the middle on initialization
        if(firstDraw){
            point = CGPoint(x: self.frame.size.width / 2, y: 0)
            firstDraw = false
        }
        drawIndicator()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
    
    func updateColor(touch: UITouch){
        guard touch.location(in: self).x > 0 && touch.location(in: self).x < self.frame.size.width else {
            return
        }
        // Update indicator position
        point = CGPoint(x: touch.location(in: self).x, y: 0)
        drawIndicator()
        
        let currentSelectionX = (touch.location(in: self).x) / self.frame.size.width
        
        // get the saved brightness, and apply to selected color
        let brightness  = ColorControl.shared.selectedBrightness
        selectedColor = UIColor(hue: currentSelectionX, saturation: 1.0, brightness: brightness, alpha: 1.0)
        
        self.delegate.pickedColor(color: selectedColor)
        
        // Save new selection
        ColorControl.shared.selectedColor = selectedColor
        self.setNeedsDisplay()
    }
    
    func drawIndicator() {
        // Draw the indicator
        if (point != nil) {
            indicator.path = UIBezierPath(roundedRect: CGRect(x: point.x-3, y: -3, width: 6, height: self.frame.size.height + 6), cornerRadius: 3).cgPath
        }
    }
}

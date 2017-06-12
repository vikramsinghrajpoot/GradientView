//
//  VRGradientView.swift
//  Components
//
//  Created by vikram singh rajpoot on 26/03/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable class VRGradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.white {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    override class var layerClass:AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    private func setupView(){
        
        let colors:Array<AnyObject> = [startColor.cgColor, endColor.cgColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        self.setNeedsDisplay()
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
}

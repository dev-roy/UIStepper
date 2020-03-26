//
//  ViewController.swift
//  UIStepper
//
//  Created by Field Employee on 3/26/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeView: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBall(xPosition: 0.0)
    }
    
    @IBAction func valueDidChange(_ sender: Any) {
        setUpBall(xPosition: CGFloat(stepper.value))
        shapeView.layer.sublayers?.popLast()
        progressView.setProgress(Float(stepper.value / 240.0), animated: true)
    }
    
    func setUpBall(xPosition: CGFloat)  {
        let viewWidth = shapeView.frame.size.width
        let viewHeight = shapeView.frame.size.height
        //let size = viewHeight * scale
        let center = CGPoint(x: xPosition, y: 0)
        let radius = min(viewHeight, viewWidth) * 0.5
        let startAngle = CGFloat.pi / 6
        let endAngle = (CGFloat.pi * 11) / 6
        let path = CGMutablePath()
        path.move(to: center)
        path.addArc(center: center , radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor(red: 255, green: 255, blue: 0, alpha: 1).cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }

}


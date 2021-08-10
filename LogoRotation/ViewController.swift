//
//  ViewController.swift
//  LogoRotation
//
//  Created by MhMuD SalAh on 10/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var viewBlack: UIView!
    @IBOutlet private weak var viewGreen: UIView!
    private var angle: CGFloat = 0
    private let speed: CGFloat = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        setupViewBlack()
        setupViewGreen()
    }
    
    func setupViewBlack() {
        CADisplayLink(target: self, selector: #selector(handleDisplayLink)).add(to: .main, forMode: .common)
    }
         
    @objc private func handleDisplayLink() {
        viewBlack.layer.transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        angle = (angle + speed).truncatingRemainder(dividingBy: .pi * 2)
    }
    
    func setupViewGreen() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.repeatCount = .infinity
        animation.speed = Float(speed)
        viewGreen.layer.add(animation, forKey: "rotate")
    }
}


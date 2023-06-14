//
//  ViewController.swift
//  animationApp
//
//  Created by Евгений Ефимов on 14.06.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var usedPrefText: UITextView!
    @IBOutlet weak var playAnimationButton: SpringButton!
    
    private var randomAnimation = Animation.getRandomAnimation()
    private var randomForce = Double.random(in: 1...2)
    private var randomDuration = Double.random(in: 0.5...2)
    private var randomDelay = Double.random(in: 0...1.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 5
        playAnimationButton.layer.cornerRadius = 5
        
        displayCurrentSettings()
        
        playAnimationButton.setTitle("Run \(randomAnimation.animation)", for: .normal)
    }
    
    @IBAction func playAnimationButtonPressed(_ sender: SpringButton) {
        
        playViewAnimate()
        getRandomAnimation()
        displayCurrentSettings()
        playAnimationButton.setTitle("Run \(randomAnimation.animation)", for: .normal)
        
    }
    
    private func getRandomAnimation() {
        randomAnimation = Animation.getRandomAnimation()
        randomForce = Double.random(in: 1...2)
        randomDuration = Double.random(in: 0.5...2)
        randomDelay = Double.random(in: 0...1.5)
    }
    
    private func playViewAnimate() {
        animatedView.animation = randomAnimation.animation
        animatedView.curve = randomAnimation.curve
        animatedView.force = randomForce
        animatedView.duration = randomDuration
        animatedView.delay = randomDelay
        animatedView.animate()
    }
    
    private func displayCurrentSettings() {
        usedPrefText.text =
        """
        Next:
        animation: \((randomAnimation.animation))
        curve: \(randomAnimation.curve)
        force: \(String(format: "%0.2f", randomForce))
        duration: \(String(format: "%0.2f", randomDuration))
        delay: \(String(format: "%0.2f", randomDelay))
        """
    }
}


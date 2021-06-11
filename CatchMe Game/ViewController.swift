//
//  ViewController.swift
//  CatchMe Game
//
//  Created by Taylor Ngo on 6/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameButton: UIButton!
    static var score: Int = 0
    var newButtonX: CGFloat?
    var newButtonY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtonLoc()
        ViewController.score = 0
        updateScore()
    }

    @IBAction func catchMeButtonTapped(_ sender: UIButton) {
        let halfWidth = sender.bounds.width / 2.0
        let halfHeight = sender.bounds.height / 2.0
        let minX = view.safeAreaInsets.left
        let maxX = view.bounds.width - view.safeAreaInsets.right
//        let minY = view.safeAreaInsets.top
        let minY = 200
        let maxY = view.bounds.height - view.safeAreaInsets.bottom
        
        let randomX = CGFloat.random(in: minX...maxX - (halfWidth * 2))
        let randomY = CGFloat.random(in: CGFloat(minY)...maxY - (halfHeight * 2))

        newButtonX = randomX + halfWidth
        newButtonY = randomY + halfHeight

        sender.center.x = newButtonX!
        sender.center.y = newButtonY!
        ViewController.score += 1
        updateScore()
    }
    
    func updateScore(){
        scoreLabel.text = "Score: " + String(ViewController.score);
    }
    
    func initButtonLoc(){
        let halfWidth = gameButton.bounds.width / 2.0
        let halfHeight = gameButton.bounds.height / 2.0
        let minX = view.safeAreaInsets.left
        let maxX = view.bounds.width - view.safeAreaInsets.right
//        let minY = view.safeAreaInsets.top
        let minY = 200
        let maxY = view.bounds.height - view.safeAreaInsets.bottom
        
        let randomX = CGFloat.random(in: minX...maxX - (halfWidth * 2))
        let randomY = CGFloat.random(in: CGFloat(minY)...maxY - (halfHeight * 2))

        newButtonX = randomX + halfWidth
        newButtonY = randomY + halfHeight

        gameButton.center.x = newButtonX!
        gameButton.center.y = newButtonY!
    }
    
    override func viewDidLayoutSubviews() {
        if let buttonX = newButtonX{
            gameButton.center.x = buttonX
        }
        if let buttonY = newButtonY{
            gameButton.center.y = buttonY
        }
    }
    
}


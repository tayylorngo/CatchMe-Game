//
//  ViewController.swift
//  CatchMe Game
//
//  Created by Taylor Ngo on 6/10/21.
//  112626118
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var targetArea: UIView!
    
    static var score: Int = 0
    var newButtonX: CGFloat?
    var newButtonY: CGFloat?
    var newAreaX: CGFloat?
    var newAreaY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoc()
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
    
    func initLoc(){
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
        
        let areaHalfWidth = targetArea.bounds.width / 2.0
        let areaHalfHeight = targetArea.bounds.height / 2.0
        let randomAreaX = CGFloat.random(in: minX...maxX - (areaHalfWidth * 2))
        let randomAreaY = CGFloat.random(in: CGFloat(minY)...maxY - (areaHalfHeight * 2))
        
        newAreaX = randomAreaX + areaHalfWidth
        newAreaY = randomAreaY + areaHalfHeight
        targetArea.center.x = newAreaX!
        targetArea.center.y = newAreaY!
    }
    
    func checkIfInside(){
        
    }
    
    override func viewDidLayoutSubviews() {
        if let buttonX = newButtonX{
            gameButton.center.x = buttonX
        }
        if let buttonY = newButtonY{
            gameButton.center.y = buttonY
        }
        if let areaX = newAreaX{
            targetArea.center.x = areaX
        }
        if let areaY = newAreaY{
            targetArea.center.y = areaY
        }
    }
    
}


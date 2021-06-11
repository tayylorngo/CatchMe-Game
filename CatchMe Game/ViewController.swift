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
    
    var score: Int = 0
    var newButtonX: CGFloat?
    var newButtonY: CGFloat?
    var newAreaX: CGFloat?
    var newAreaY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoc()
        while(checkIfInside()){
            initLoc()
        }
        score = 0
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
        score += 1
        updateScore()
        if checkIfInside(){
            print("WINNER")
            winGame()
        }
    }
    
    func updateScore(){
        scoreLabel.text = "Score: " + String(score);
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
    
    func checkIfInside() -> Bool{
        let targetAreaCenterX = targetArea.center.x
        let targetAreaCenterY = targetArea.center.y
        let targetAreaWidth = targetArea.bounds.width
        let targetAreaHeight = targetArea.bounds.height
        
        let buttonCenterX = gameButton.center.x
        let buttonCenterY = gameButton.center.y
        let buttonWidth = gameButton.bounds.width
        let buttonHeight = gameButton.bounds.height
        
        let rightButtonBorder = buttonCenterX + (buttonWidth / 2.0)
        let leftButtonBorder = buttonCenterX - (buttonWidth / 2.0)
        let topButtonBorder = buttonCenterY - (buttonHeight / 2.0)
        let bottomButtonBorder = buttonCenterY + (buttonHeight / 2.0)
        
        let rightAreaBorder = targetAreaCenterX + (targetAreaWidth / 2.0)
        let leftAreaBorder = targetAreaCenterX - (targetAreaWidth / 2.0)
        let topAreaBorder = targetAreaCenterY - (targetAreaHeight / 2.0)
        let bottomAreaBorder = targetAreaCenterY + (targetAreaHeight / 2.0)
        
        if topButtonBorder < topAreaBorder {
            return false
        }
        if bottomButtonBorder > bottomAreaBorder {
            return false
        }
        if leftButtonBorder < leftAreaBorder {
            return false
        }
        if rightButtonBorder > rightAreaBorder {
            return false
        }
        return true
    }
    
    func winGame(){
        let alert = UIAlertController(title: "Game Over!", message: "Your Score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in
            self.playAgain()
        }))
        present(alert, animated: true)
    }
    
    func playAgain(){
        initLoc()
        score = 0
        updateScore()
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


//
//  ViewController.swift
//  TicTacToeFourByFour
//
//  Created by Андрей Королев on 01.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let gameModel: GameModel = GameModel()
    
    let gameView: GameView = GameView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(gameView)
        NSLayoutConstraint.activate([
            gameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gameView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        gameView.setButtonReactor(reac: self)
        
        gameModel.setWinSender(ws: self)
    }

    @objc func buttonClicked(buttonPos: Int) {
        if gameModel.isTaken(pos: buttonPos) {
            return
        }
        if gameModel.currentColor == 1 {
            gameView.buttons[buttonPos].backgroundColor = .red
            gameModel.makeMove(id: buttonPos, color: 1)
        } else {
            gameView.buttons[buttonPos].backgroundColor = .blue
            gameModel.makeMove(id: buttonPos, color: 2)
        }
        updateView()
    }
    
    func updateView() {
        gameView.winMessage.text = ""
        if gameModel.currentColor == 1 {
            gameView.moveMessage.text = "RED turn"
        } else {
            gameView.moveMessage.text = "BLUE turn"
        }
        
    }
    
    func getWin(winType: Int) {
        gameView.blueScore.text = "Blue score: \(gameModel.blueScore)"
        gameView.redScore.text = "Red score: \(gameModel.redScore)"
        if gameModel.currentColor == 1 {
            gameView.moveMessage.text = "RED turn"
        } else {
            gameView.moveMessage.text = "BLUE turn"
        }
        
        if winType == 0 {
            gameView.winMessage.text = "DRAW"
        } else if winType == 1 {
            gameView.winMessage.text = "RED win!"
        } else {
            gameView.winMessage.text = "BLUE win!"
        }
        
        gameView.resetButtons()
    }
}


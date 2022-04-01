//
//  GameModel.swift
//  TicTacToeFourByFour
//
//  Created by Андрей Королев on 01.04.2022.
//

import Foundation

class GameModel {
    
    private var gameBoard: TicTacModel
    
    var redScore: Int
    var blueScore: Int
    
    var currentMove: Int
    
    var currentColor: Int
    
    var winSender: ViewController? = nil
    
    public init() {
        redScore = 0
        blueScore = 0
        
        currentMove = 0
        currentColor = 1
        
        gameBoard = TicTacModel()
    }
    
    public func makeMove(id: Int, color: Int) {
        gameBoard.setColor(id: id, color: color)
        currentMove += 1
        
        if (currentColor == 1) {
            currentColor = 2
        } else {
            currentColor = 1
        }
        
        if gameBoard.checkWinner(color: color) {
            if color == 1 {
                redScore += 1
                winSender?.getWin(winType: 1)
            } else {
                blueScore += 1
                winSender?.getWin(winType: 2)
            }
            gameBoard.clearField()
            currentColor = 1
            return
        }
        
        //check draw - no winners, 16th move == draw
        if currentMove == 15 {
            gameBoard.clearField()
            winSender?.getWin(winType: 0)
            currentColor = 1
        }
    }
    
    func isTaken(pos: Int) -> Bool {
        return gameBoard.isTaken(pos: pos)
    }
    
    func setWinSender(ws: ViewController) {
        winSender = ws
    }
}

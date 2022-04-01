//
//  TicTacModel.swift
//  TicTacToeFourByFour
//
//  Created by Андрей Королев on 01.04.2022.
//

import Foundation

class TicTacModel {
    //field represented as array with 16 ints
    //0 - empty
    //1 - red
    //2 - blue
    
    private var field: [Int] = []
    
    public init() {
        clearField()
    }
    
    public func setColor(id: Int, color: Int) {
        field[id] = color
    }
    
    public func clearField() {
        field = []
        for _ in 0..<16 {
            field.append(0)
        }
    }
    
    public func checkWinner(color: Int) -> Bool{
        var win = false
        
        //check rows
        for i in 0..<4 {
            win = true
            for j in 0..<4 {
                let pos = i * 4 + j
                let val = field[pos]
                if (val != color) {
                    win = false
                }
            }
            if win {
                return true
            }
        }
        
        //check columns
        for j in 0..<4 {
            win = true
            for i in 0..<4 {
                let pos = i * 4 + j
                let val = field[pos]
                if val != color {
                    win = false
                }
            }
            if win {
                return true
            }
        }
        
        //check diag 1
        win = true
        for i in 0..<4 {
            let pos = i * 4 + i
            let val = field[pos]
            if val != color {
                win = false
            }
        }
        if win {
            return true
        }
        
        //check diag 2
        win = true
        for i in 0..<4 {
            let pos = i * 4 + (3 - i)
            let val = field[pos]
            if val != color {
                win = false
            }
        }
        return win
    }
    
    func isTaken(pos: Int) -> Bool {
        return field[pos] != 0
    }
}

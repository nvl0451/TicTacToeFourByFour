//
//  GameView.swift
//  TicTacToeFourByFour
//
//  Created by Андрей Королев on 01.04.2022.
//

import Foundation
import UIKit

class GameView: UIView {
    
    let redScore: UILabel = UILabel()
    let blueScore: UILabel = UILabel()
    let moveMessage: UILabel = UILabel()
    let winMessage: UILabel = UILabel()
    
    let gameField: UIStackView = UIStackView()
    
    var buttons: [UIButton] = []
    
    var buttonRows: [UIView] = []
    
    var buttonReactor: ViewController? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(redScore)
        addSubview(blueScore)
        addSubview(winMessage)
        addSubview(moveMessage)
        addSubview(gameField)
        
        createButtons()
        
        initElements()
        
        setConstraints()
        
        backgroundColor = .white
    }
    
    func setButtonReactor(reac: ViewController) {
        buttonReactor = reac
    }
    
    private func createButtons() {
        for i in 0..<16 {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 50),
                button.widthAnchor.constraint(equalToConstant: 50)
            ])
            
            button.tag = i
            
            button.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            
            buttons.append(button)
        }
    }
    
    @objc func btnAction(sender: UIButton) {
        print("\(sender.tag)")
        buttonReactor?.buttonClicked(buttonPos: sender.tag)
    }
    
    func resetButtons() {
        for button in buttons {
            button.backgroundColor = .lightGray
        }
    }
    
    private func setupGameView() {
        gameField.axis = .vertical
        gameField.spacing = 20
        
        for i in 0..<4 {
            let newRow = UIStackView()
            newRow.axis = .horizontal
            newRow.spacing = 20
            newRow.translatesAutoresizingMaskIntoConstraints = false
            
            for j in 0..<4 {
                let buttonPos = i * 4 + j
                newRow.addArrangedSubview(buttons[buttonPos])
                
                //NSLayoutConstraint.activate([
                  //  buttons[buttonPos].centerYAnchor.constraint(equalTo: newRow.centerYAnchor)
                //])
                
                if j > 0 {
                    let prev = buttonPos - 1
                    NSLayoutConstraint.activate([
                        buttons[buttonPos].leadingAnchor.constraint(
                            equalTo: buttons[prev].trailingAnchor,
                            constant: 20
                        )
                    ])
                }
            }
            
            gameField.addArrangedSubview(newRow)
        }
    }
    
    private func initElements() {
        redScore.text = "Red: 0"
        blueScore.text = "Blue: 0"
        moveMessage.text = "It's RED turn"
        winMessage.text = "temp win msg"
        
        createButtons()
        setupGameView()
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        redScore.translatesAutoresizingMaskIntoConstraints = false
        blueScore.translatesAutoresizingMaskIntoConstraints = false
        moveMessage.translatesAutoresizingMaskIntoConstraints = false
        winMessage.translatesAutoresizingMaskIntoConstraints = false
        gameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redScore.topAnchor.constraint(equalTo: topAnchor),
            redScore.centerXAnchor.constraint(equalTo: centerXAnchor),
            redScore.heightAnchor.constraint(equalToConstant: 30),
            
            blueScore.topAnchor.constraint(equalTo: redScore.bottomAnchor, constant: 20),
            blueScore.centerXAnchor.constraint(equalTo: centerXAnchor),
            blueScore.heightAnchor.constraint(equalToConstant: 30),
            
            moveMessage.topAnchor.constraint(equalTo: blueScore.bottomAnchor, constant: 20),
            moveMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            moveMessage.heightAnchor.constraint(equalToConstant: 30),
            
            winMessage.topAnchor.constraint(equalTo: moveMessage.bottomAnchor, constant: 20),
            winMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            winMessage.heightAnchor.constraint(equalToConstant: 30),
            
            gameField.topAnchor.constraint(equalTo: winMessage.bottomAnchor, constant: 20),
            gameField.leadingAnchor.constraint(equalTo: leadingAnchor),
            gameField.trailingAnchor.constraint(equalTo: trailingAnchor),
            gameField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

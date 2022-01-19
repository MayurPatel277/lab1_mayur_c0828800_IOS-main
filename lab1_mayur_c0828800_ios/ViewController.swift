//
//  ViewController.swift
//  lab1_mayur_c0828800_ios
//
//  Created by Pooja Mistry on 1/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn
    {
        case nought
        case cross
    }
    
    
    var FirstRound = Turn.cross
    var currentRound = Turn.cross
    var nought = "0"
    var cross = "X"
    var board = [UIButton]()
    
    var scoreOfNought = 0
    var scoreOfCross = 0

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var d9: UIButton!
    @IBOutlet weak var d8: UIButton!
    @IBOutlet weak var d7: UIButton!
    @IBOutlet weak var d6: UIButton!
    @IBOutlet weak var d5: UIButton!
    @IBOutlet weak var d4: UIButton!
    @IBOutlet weak var d3: UIButton!
    @IBOutlet weak var d2: UIButton!
    @IBOutlet weak var d1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){
        board.append(d1)
        board.append(d2)
        board.append(d3)
        board.append(d4)
        board.append(d5)
        board.append(d6)
        board.append(d7)
        board.append(d8)
        board.append(d9)
    }
    
    @IBAction func tapaction(_ sender: UIButton)
    {
        actionOnBoard(sender)
        
        if whoWIN(cross)
        {
            scoreOfCross += 1
            result(title: "Winner is Cross")
        }
        if whoWIN(nought){
            scoreOfNought += 1
            result(title: "Winner is Nought")
        }
        
        if(fullBoard())
        {
            result(title: "This match is draw! good try though")
        }
    }
    
    func result(title : String)
    {
        _ = "\nNought " + String(scoreOfNought) + "\n\nCrosses " + String(scoreOfCross)
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (_) in self.toClearBoard()}))
        self.present(ac , animated: true)
    }
    
    func fullBoard() -> Bool
    {
        for button in board
        {
            
            if  (button.title(for: .normal) == nil )
            {
            return false
            }
        }
        return true
    }
    
    func whoWIN(_ s: String)-> Bool
    {
        // checking first row
        if toSetSymbol(d1, s) && toSetSymbol(d2, s) && toSetSymbol(d3, s)
        {
            return true
        }
        // checking second row
        if toSetSymbol(d4, s) && toSetSymbol(d5, s) && toSetSymbol(d6, s)
        {
            return true
        }
        // checking third row
        if toSetSymbol(d7, s) && toSetSymbol(d8, s) && toSetSymbol(d9, s)
        {
            return true
        }
        // checking first column
        if toSetSymbol(d1, s) && toSetSymbol(d4, s) && toSetSymbol(d7, s)
        {
            return true
        }
        // checking second column
        if toSetSymbol(d2, s) && toSetSymbol(d5, s) && toSetSymbol(d8, s)
        {
            return true
        }
        // checking third column
        if toSetSymbol(d3, s) && toSetSymbol(d6, s) && toSetSymbol(d9, s)
        {
            return true
        }
        
        // Chicking diagonally
        if toSetSymbol(d1, s) && toSetSymbol(d5, s) && toSetSymbol(d9, s)
        {
            return true
        }
        if toSetSymbol(d3, s) && toSetSymbol(d5, s) && toSetSymbol(d7, s)
        {
            return true
        }
        return false
    }
    
    func toSetSymbol(_ button : UIButton , _ symbol : String )-> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func toClearBoard()
    {
        
        for button11 in board
        {
           
            button11.isEnabled = true
            button11.setTitle(nil, for: .normal)
            
            }
        if FirstRound == Turn.cross
        {
            FirstRound = Turn.nought
            label.text = nought

        }
        else if(FirstRound == Turn.nought)
        {
            FirstRound = Turn.cross
            label.text = cross
        }
        currentRound = FirstRound
    }
    
    func actionOnBoard(_ sender : UIButton){
        if (sender.title(for: .normal) == nil)
        {
            if(currentRound == Turn.nought)
            {
                sender.setTitle(nought, for: .normal)
                currentRound = Turn.cross
                label.text = cross
            } else if(currentRound == Turn.cross)
            {
                sender.setTitle(cross, for: .normal)
                currentRound = Turn.nought
                label.text = nought
            }
        }
    }

}


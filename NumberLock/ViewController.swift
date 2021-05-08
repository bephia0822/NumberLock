//
//  ViewController.swift
//  NumberLock
//
//  Created by Sophia Wang on 2021/1/19.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    var answer =  GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1//0~100的亂數，沒加1就是0~99
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var changeTitle: UIButton!
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        
        if isOver == false{
            //正在玩遊戲
            print(answer)
            let inputText = inputTextField.text!
            inputTextField.text = "" //設成空字串這樣每次猜完空格都可以歸零
            
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                messageLabel.text = "No input! Guess a number between \(minNumber) ~ \(maxNumber)"
            }else{
                //input ok
                if inputNumber! > maxNumber{
                    messageLabel.text = "Too large! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! < minNumber{
                    messageLabel.text = "Too small! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber == answer{
                    //bingo! right answer
                    messageLabel.text = "You are right! Press [Play Again] to play again!"
                    changeTitle.setTitle("Play Again", for: .normal)
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }else{
                    //wrong answer
                    if inputNumber! > answer{
                        //larger than answer猜的數字比答案大的情況
                        maxNumber = inputNumber!
                    }else{
                        //smaller than anwser猜的數字比答案小的情況
                        minNumber = inputNumber!
                    }
                    messageLabel.text = "Try again! Guess a number between \(minNumber) ~ \(maxNumber)"
                }
            }
        }else{
            //玩完了
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
            changeTitle.setTitle("Guess", for: .normal)
            answer =  GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isOver = false
            background.image = UIImage(named: "BG")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //一打開鍵盤就會跳出
        inputTextField.becomeFirstResponder()
        //make a random number
       
        
        // Do any additional setup after loading the view.
    }


}


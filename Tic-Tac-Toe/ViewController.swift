//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Wei Chung Chuo on 8/10/15.
//  Copyright © 2015 Wei Chung Chuo. All rights reserved.
//

import UIKit

var controller = ViewController?.self

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
   
    func changeButtonColor() {
        for button in buttons {
            button.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    func stopButtons() {
        for button in buttons {
            button.enabled = false
        }
    }
    
    func startButtons() {
        for button in buttons {
            button.enabled = true
        }
    }

    var currentStep:Int = 0
    var blueArray = [Int]()
    var redArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonTTT(sender: UIButton) {
        currentStep += 1

        if currentStep % 2 != 0 {
            sender.backgroundColor = UIColor.blueColor()
            blueArray.append(sender.tag)
            print("Blue has \(blueArray)")
        } else {
            sender.backgroundColor = UIColor.redColor()
            redArray.append(sender.tag)
            print("Red has \(redArray)")
        }
        
        if  blueArray.contains(1) && blueArray.contains(2) && blueArray.contains(3) ||
            blueArray.contains(4) && blueArray.contains(5) && blueArray.contains(6) ||
            blueArray.contains(7) && blueArray.contains(8) && blueArray.contains(9) ||
            blueArray.contains(1) && blueArray.contains(4) && blueArray.contains(7) ||
            blueArray.contains(2) && blueArray.contains(5) && blueArray.contains(8) ||
            blueArray.contains(3) && blueArray.contains(6) && blueArray.contains(9) ||
            blueArray.contains(1) && blueArray.contains(5) && blueArray.contains(9) ||
            blueArray.contains(3) && blueArray.contains(5) && blueArray.contains(7)
        {
            statusLabel.text = "Congrats, Blue Won!"
            stopButtons()
        } else if
            redArray.contains(1) && redArray.contains(2) && redArray.contains(3) ||
            redArray.contains(4) && redArray.contains(5) && redArray.contains(6) ||
            redArray.contains(7) && redArray.contains(8) && redArray.contains(9) ||
            redArray.contains(1) && redArray.contains(4) && redArray.contains(7) ||
            redArray.contains(2) && redArray.contains(5) && redArray.contains(8) ||
            redArray.contains(3) && redArray.contains(6) && redArray.contains(9) ||
            redArray.contains(1) && redArray.contains(5) && redArray.contains(9) ||
            redArray.contains(3) && redArray.contains(5) && redArray.contains(7)
        {
            statusLabel.text = "Congrats, Red Won!"
            stopButtons()
        } else if
            blueArray.count == 5 && redArray.count == 4 {
            statusLabel.text = "It's a tie! Try again."
            stopButtons()
        }
    }
    
    //123, 456, 789, 147, 258, 369, 159, 357
    
    @IBAction func restart(sender: UIButton) {
        redArray = []
        blueArray = []
        print("Blue Array: \(blueArray); Red Array: \(redArray)")
        statusLabel.text = ""
        currentStep = 0
        changeButtonColor()
        startButtons()
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    

    
}
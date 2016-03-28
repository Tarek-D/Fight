//
//  ViewController.swift
//  Fight
//
//  Created by Stéphane Lux on 23.03.16.
//  Copyright © 2016 LUXio IT-Solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var game:Game!
    
    @IBOutlet weak var player0HPLbl: UILabel!
    @IBOutlet weak var player1HPLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var player0AttackBtn: UIButton!
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var backgroundMusic: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // play background
        let path = NSBundle.mainBundle().pathForResource("Shogun", ofType: "caf")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try backgroundMusic = AVAudioPlayer(contentsOfURL: soundUrl)
            backgroundMusic.prepareToPlay()
            backgroundMusic.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        initGame()
    }
    
    func initGame() {
        resetBtn.hidden = true
        let players = [
            ["name": "Player1", "healtPoints": "100", "attackPower": "15"],
            ["name": "Player2", "healtPoints": "120", "attackPower": "20"]
        ]
        game = Game.init(players: players)
        updateDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay() {
        player0HPLbl.text = "\(game.hpOfPlayer(0))"
        player1HPLbl.text = "\(game.hpOfPlayer(1))"
        statusLbl.text = game.message
    }
    
    @IBAction func attackBtnPressed(sender: UIButton) {
        game.attack(sender.tag, victimIndex: (sender.tag + 1) % 2)
        updateDisplay()
        if game.deadPlayer() != nil {
            resetBtn.hidden = false
        } else {
//            if sender.tag == 0 {
//                player1AttackBtn.enabled = false
//            } else {
//                player0AttackBtn.enabled = false
//            }
            player0AttackBtn.enabled = false
            player1AttackBtn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableAttackBtns), userInfo: nil, repeats: true)
        }
    }
    
    func enableAttackBtns() {
        player0AttackBtn.enabled = true
        player1AttackBtn.enabled = true
    }
    
    @IBAction func resetBtnPressed(sender: AnyObject) {
        initGame()
    }
    
}


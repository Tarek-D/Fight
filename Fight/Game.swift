//
//  Game.swift
//  Fight
//
//  Created by Stéphane Lux on 26.03.16.
//  Copyright © 2016 LUXio IT-Solutions. All rights reserved.
//

import Foundation

class Game {
    
    private var _players = [Character]()
    private var _message = ""
    
    init(players:Array<Dictionary<String, String>>) {
        
        for player in players {
            _players.append(Character.init(name: player["name"]!, healtPoints: Int(player["healtPoints"]!)!, attackPower: Int(player["attackPower"]!)!))
        }
        
        _message = "Press Attack to Start"
    }
    
    var message:String {
        get {
            return _message
        }
    }
    
    func hpOfPlayer(index:Int) -> Int {
        return _players[index].healthPoints
    }
    
    func attack(attackerIndex:Int, victimIndex:Int) {
        _players[victimIndex].isAttackedBy(_players[attackerIndex])
        
        if _players[victimIndex].healthPoints <= 0 {
            _message = "\(_players[victimIndex].name) was killed by \(_players[attackerIndex].name)!"
        } else {
            _message = "\(_players[attackerIndex].name) attacks \(_players[victimIndex].name) with \(_players[attackerIndex].attackPower) AP"
        }
    }
    
    
    func deadPlayer() -> Int? {
        for (index, player) in _players.enumerate() {
            if player.isDead() {
                return index
            }
        }
        return nil
    }
    
    
}
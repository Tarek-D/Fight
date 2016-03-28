//
//  Character.swift
//  Fight
//
//  Created by Stéphane Lux on 23.03.16.
//  Copyright © 2016 LUXio IT-Solutions. All rights reserved.
//

import Foundation


class Character {
    private var _healtPoints = 0
    private var _attackPower = 0
    private var _name = ""
    
    init(name:String, healtPoints: Int, attackPower: Int) {
        _name = name
        _healtPoints = healtPoints
        _attackPower = attackPower
    }
    
    
    var healthPoints:Int {
        get {
            return _healtPoints
        }
    }
    
    var attackPower:Int {
        get {
            return _attackPower
        }
    }
    
    var name:String {
        get {
            return _name
        }
    }
    
    func isAttackedBy(character:Character) {
        if _healtPoints >= character.attackPower {
            _healtPoints -= character.attackPower
        }
    }
    
    func isDead() -> Bool {
        return _healtPoints <= 0
    }
    
    
}
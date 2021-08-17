//
//  Message.swift
//  SwiftNats
//
//  Created by bany on 17/08/2021.
//  Copyright © 2021 Travelish. All rights reserved.
//

import Foundation

class Message {
    
    var symbol: String?
    var chanel: String?
    var nameSub: String?
    var messageString: String?
    
    func handleMsg(message: String) {
        let array = message.components(separatedBy: " ")
        
        
        if array.count > 0 {
            symbol = array[0]
        }
        
        if array.count > 1 {
            chanel = array[1]
        }
        
        if array.count > 2 {
            nameSub = array[2]
        }
        
        if array.count > 3 {
            messageString = array[3]
        }
        
    }
}

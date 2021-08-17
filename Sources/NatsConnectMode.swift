//
//  NatsConnectMode.swift
//  SwiftNats
//
//  Created by bany on 17/08/2021.
//  Copyright © 2021 Travelish. All rights reserved.
//

import Foundation

public enum NatsConnectMode {
    case unAuthorization
    case userAuthorization(user: String, password: String)
    case tokenAuthorization(token: String)
    
    func asPayload() -> [String: Any] {
        switch self {
        case .unAuthorization:
            return [:]
        case .tokenAuthorization(let token):
            return [
                "auth_token": token
            ]
        case .userAuthorization(let user,let password):
            return [
                "user": user,
                "pass": password
            ]
        }
    }
}

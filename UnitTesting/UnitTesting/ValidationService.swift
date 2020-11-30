//
//  ValidationService.swift
//  UnitTesting
//
//  Created by Juan Capponi on 11/30/20.
//

import Foundation

struct ValidationService {
    func validateUserName(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 15 else { throw ValidationError.usernameTooLong }
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 5 else { throw ValidationError .passwordTooShort }
        guard password.count < 15 else { throw ValidationError.passwordTooLong }
        return password
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value"
        case .passwordTooLong:
            return "Your password is too long"
        case .passwordTooShort:
            return "Your password is too short"
        case .usernameTooLong:
            return "Your user name is too long"
        case .usernameTooShort:
            return "Your user name is too short"
        }
    }
}




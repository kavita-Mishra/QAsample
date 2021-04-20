//
//  Validation.swift
//  LoginPageSwiftUITutorial
//
//  Created by Alex on 12/04/2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import Foundation

enum ValidationEntryType {
    case numeric
    case alphanumericIgnoringDiacritics
    case alphanumeric(ignoreSpaces: Bool = false)
    case alphanumericIgnoreList(_ ignoreList: String)
    
    case username
    case email
    case password
}

struct ValidationError: LocalizedError, Equatable {
    public static func == (lhs: ValidationError, rhs: ValidationError) -> Bool {
        lhs.message == rhs.message
    }
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    public var errorDescription: String? {
        return message
    }
}

protocol ValidationProtocol {
    func isValid(value: String, regex: String) -> Result<Bool, ValidationError>
    func isValid(value: Character, _ type: ValidationEntryType) -> Result<Bool, ValidationError>
    func isValid(value: String, _ type: ValidationEntryType) -> Result<Bool, ValidationError>
}

extension ValidationProtocol {
    func isValid(value: String, regex: String) -> Result<Bool, ValidationError> {
        let result = value.range(of: regex, options: .regularExpression) == .none && value != ""
        return result ? .success(true) : .failure(ValidationError("Not valid"))
    }
    
    func isValid(value: Character, _ type: ValidationEntryType) -> Result<Bool, ValidationError> {
        return isValid(value: String(value), type)
    }
}

// MARK: set validations (emails, passwords, postcodes...)
extension ValidationProtocol {
    func isValid(value: String, _ type: ValidationEntryType) -> Result<Bool, ValidationError> {
        switch type {
        case .alphanumericIgnoringDiacritics:
            return alphanumericIgnoringDiacritics(value: value)
        case .alphanumeric(let ignoreSpaces):
            return isAlphanumeric(value: value, ignoreSpaces: ignoreSpaces)
        case .alphanumericIgnoreList(let ignoreList):
            return isAlphanumeric(value: value, ignoreList: ignoreList)
        case .numeric:
            return isNumber(value: value)
        case .email:
            return EmailValidator().validate(value)
        case .password:
            return PasswordValidator().validate(value, minimumChar: 2, maximumChar: 8)
        case .username:
            if value.isEmpty {
                return .failure(ValidationError("username is empty"))
            } else {
                return .success(true)
            }
        }
    }
}

// MARK: Private functions
extension ValidationProtocol {
    private func alphanumericIgnoringDiacritics(value: String) -> Result<Bool, ValidationError> {
        let result = value.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == .none && value != ""
        return result ? .success(true) : .failure(ValidationError("Not valid"))
    }
    
    private func isAlphanumeric(value: String, ignoreSpaces: Bool = false) ->  Result<Bool, ValidationError> {
        let regexValue = ignoreSpaces ? "[^a-zA-Z0-9? ]" : "[^a-zA-Z0-9]"
        return isValid(value: value, regex: regexValue)
        
    }
    
    private func isAlphanumeric(value: String, ignoreList: String) ->  Result<Bool, ValidationError> {
        let regexValue = "[^a-zA-Z0-9?\(ignoreList)]"
        return isValid(value: value, regex: regexValue)
    }
    
    private func isNumber(value: String) ->  Result<Bool, ValidationError> {
        let result = !value.isEmpty && value.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == .none
        return result ? .success(true) : .failure(ValidationError("Not valid"))
    }
}

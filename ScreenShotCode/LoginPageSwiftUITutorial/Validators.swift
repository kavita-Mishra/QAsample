//
//  Validators.swift
//  LoginPageSwiftUITutorial
//
//  Created by Alex on 12/04/2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import Foundation

protocol ValidatorConvertible {
    func validate(_ value: String)  -> Result<Bool, ValidationError>
    func validate(_ value: String, minimumChar: Int, maximumChar: Int)  -> Result<Bool, ValidationError>
}

extension ValidatorConvertible {
    func validate(_ value: String, minimumChar: Int = 0, maximumChar: Int = 160)  -> Result<Bool, ValidationError> {
        return validate(value, minimumChar: minimumChar, maximumChar: maximumChar)
    }
}

struct PasswordValidator: ValidatorConvertible {
    
    func validate(_ value: String) -> Result<Bool, ValidationError> {
        validate(value, minimumChar: 0, maximumChar: 160)
    }
    
    func validate(_ value: String, minimumChar: Int = 0, maximumChar: Int = 160)  -> Result<Bool, ValidationError> {
        guard value != "" else { return .failure(ValidationError("Password is Required"))}
        guard value.count >= minimumChar else { return .failure(ValidationError("Password must have at least \(minimumChar) characters"))}
        guard value.count < maximumChar else { return .failure(ValidationError("Password must have less than \(maximumChar) characters"))}

        do {
            let regexString = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(minimumChar),}$"
            
            if try NSRegularExpression(pattern: regexString, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return .failure(ValidationError("Password must be more than \(minimumChar) characters, with at least a numeric character"))} else {
                    return .success(true)
                }
        } catch {
            return .failure(ValidationError("Password must be more than \(minimumChar) characters, with at least a numeric character"))
        }
    }
}

struct EmailValidator: ValidatorConvertible {
    
    func validate(_ value: String) -> Result<Bool, ValidationError> {
        validate(value, minimumChar: 0, maximumChar: 160)
    }
    
    func validate(_ value: String, minimumChar: Int = 0, maximumChar: Int = 160) -> Result<Bool, ValidationError> {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return .failure(ValidationError("Invalid e-mail Address"))
            } else {
                return .success(true)
            }
        } catch {
            return .failure(ValidationError("Invalid e-mail Address"))
        }
    }
}

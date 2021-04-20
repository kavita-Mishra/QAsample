//
//  LoginPageScenerioTests.swift
//  LoginPageSwiftUITutorialUITests
//
//  Created by Keywords Studio on 20/04/21.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import XCTest

class LoginPageScenerioTests: XCTestCase {
    
    private var  app : XCUIApplication!

    override func setUpWithError() throws {
    
       app = XCUIApplication()
       app.launch()
      
       continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
/* Test to check when username is blank*/
    
    func testBlankUserName(){
        
        let storedUsername = ""
       
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText(storedUsername)
        app.buttons["Return"].tap()
        app.buttons["LOGIN"].tap()
        
        let errorTextField = app.staticTexts["TextError"]
    
       XCTAssertEqual(errorTextField.label,"username is empty")
    }
    
    func testcheckvalidatePasswordWithEightCharacter(){
    
        let validName = "kavita"
        let validPassword = "kavita1"
        let validEmail = "email@gmail.com"

        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText(validName)
        app.buttons["Return"].tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(validEmail)
        app.buttons["Return"].tap()
      
        let Password = app.secureTextFields["Password"]
        Password.tap()
        Password.typeText(validPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LOGIN"].tap()
        
        let errorTextField = app.staticTexts["TextError"]
        
        XCTAssertEqual(errorTextField.label,"Information not correct. Try again")

        }
    
    
    /* Check for when password is blank */
    
    func testBlankPasswordfield(){
        
        let storedPassword = ""
        let storedName = "Abcdefg"
        let storedEmail = "kavita@gmail.com"
        
        
        let userTextFiled =  app.textFields["Username"]
        userTextFiled.tap()
        userTextFiled.typeText(storedName)
        app.buttons["Return"].tap()
        
        let  emailtextField = app.textFields["Email"]
        emailtextField.tap()
        emailtextField.typeText(storedEmail)
        app.buttons["Return"].tap()
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText(storedPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LOGIN"].tap()
        
        let errorTextField = app.staticTexts["TextError"]
       XCTAssertEqual(errorTextField.label,"Password is Required")
        
    }

}

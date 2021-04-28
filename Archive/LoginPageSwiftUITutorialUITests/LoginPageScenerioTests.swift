//
//  LoginPageScenerioTests.swift
//  LoginPageSwiftUITutorialUITests
//
//  Created by Keywords Studio on 20/04/21.
//  Copyright © 2021 Andreas Schultz. All rights reserved.


// Use Accessibility identifier for dynamic access and miminize the code and put all variables in setUp function

import XCTest

class LoginPageScenerioTests: XCTestCase {
    
    private var  app : XCUIApplication!
    private var usernameTextField: XCUIElement!
    private var emailTextField : XCUIElement!
    private var Password : XCUIElement!
    private var errorTextField: XCUIElement!
    
    
    override func setUpWithError() throws {
    
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        usernameTextField = app.textFields["UsernameField"] // use accessibility identifier for user name text field
        emailTextField = app.textFields["EmailField"]      //use accessibility identifier for Email text field
        Password = app.secureTextFields["PasswordField"]   // use accessibility identifier for Password text field
        errorTextField = app.staticTexts["TextError"]      // use accessibility identifier for Error text message
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
        app = nil
        usernameTextField = nil
        emailTextField = nil
        Password = nil
        errorTextField = nil
        
        try super.tearDownWithError()
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /* Test to check when username is blank*/
    
    func testBlankUserName(){
        
        let storedUsername = ""
        let validPassword = "kavita1"
        let validEmail = "kavita@gmail.com"
       

        usernameTextField.tap()
        usernameTextField.typeText(storedUsername)
        app.buttons["Return"].tap()
        

        emailTextField.tap()
        emailTextField.typeText(validEmail)
        app.buttons["Return"].tap()
      
  
        Password.tap()
        Password.typeText(validPassword)
        app.buttons["LoginButton"].tap()
        

    
       XCTAssertEqual(errorTextField.label,"username is empty")
    }
    
    /* Check for when user blank email id field*/
    
    func testBlankEmailId(){
        
        let validName = "kavita"
        let validPassword = "kavita1"
        let storedEmaiId = ""
        
        
        usernameTextField.tap()
        usernameTextField.typeText(validName)
        app.buttons["Return"].tap()
        
        
        emailTextField.tap()
        emailTextField.typeText(storedEmaiId)
        app.buttons["Return"].tap()
       
        Password.tap()
        Password.typeText(validPassword)
        
        app.buttons["LoginButton"].tap()
        
    
       XCTAssertEqual(errorTextField.label,"Invalid e-mail Address")
    }
    
    /* Test case for checking the invalid email id without @ notation*/
    
    func testInvalidEmailId(){
        
        let validName = "abcde"
        let validPassword = "kavita1"
        let storedEmaiId = "kavitagmail.com"
        
      
        usernameTextField.tap()
        usernameTextField.typeText(validName)
        app.buttons["Return"].tap()
        
     
        emailTextField.tap()
        emailTextField.typeText(storedEmaiId)
        app.buttons["Return"].tap()
        
        Password.tap()
        Password.typeText(validPassword)
        
        app.buttons["LoginButton"].tap()
        
    
    
       XCTAssertEqual(errorTextField.label,"Invalid e-mail Address")
    }
    
    /* Check when user enter the less then 8 character password*/
    
    func testValidatePasswordLessEightCharacter(){
    
        let validName = "kavita"
        let validPassword = "kavita1"
        let validEmail = "kavita@gmail.com"

      
        usernameTextField.tap()
        usernameTextField.typeText(validName)
        app.buttons["Return"].tap()

      
        emailTextField.tap()
        emailTextField.typeText(validEmail)
        app.buttons["Return"].tap()
      
     
        Password.tap()
        Password.typeText(validPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LoginButton"].tap()
        
     
        XCTAssertEqual(errorTextField.label,"Information not correct. Try again.")

        }
    
    /* Check for when password is blank */
    
    func testBlankPasswordField(){
        
        let storedPassword = ""
        let storedName = "Abcdefg"
        let storedEmail = "kavita@gmail.com"
        
        
        usernameTextField.tap()
        usernameTextField.typeText(storedName)
        app.buttons["Return"].tap()
        
     
        emailTextField.tap()
        emailTextField.typeText(storedEmail)
        app.buttons["Return"].tap()
        
   
        Password.tap()
        Password.typeText(storedPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LoginButton"].tap()
        
    
       XCTAssertEqual(errorTextField.label,"Password is Required")
        
    }
    
    /* Check password with 2 characters */
    
    func testMinimumPasswordLimit(){
        
        let storedPassword = "ab"
        let storedName = "Abcdefg"
        let storedEmail = "kavita@gmail.com"
        
        
    
        usernameTextField.tap()
        usernameTextField.typeText(storedName)
        app.buttons["Return"].tap()
        
  
        emailTextField.tap()
        emailTextField.typeText(storedEmail)
        app.buttons["Return"].tap()
        
    
        Password.tap()
        Password.typeText(storedPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LoginButton"].tap()
        
     
        XCTAssertEqual(errorTextField.label,"Password must be more than 2 characters, with at least a numeric character")
        
    }
    
    /* Password with alphanumeric characters */
    
    func testPasswordWithAlphanumeric(){
        
        let storedPassword = "ab1"
        let storedName = "Abcdefg"
        let storedEmail = "kavita@gmail.com"
        
        
     
        usernameTextField.tap()
        usernameTextField.typeText(storedName)
        app.buttons["Return"].tap()
        
     
        emailTextField.tap()
        emailTextField.typeText(storedEmail)
        app.buttons["Return"].tap()
        
   
        Password.tap()
        Password.typeText(storedPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LoginButton"].tap()
        
      
        XCTAssertEqual(errorTextField.label,"Information not correct. Try again.")
        
    }
    
   /* check the password with more than 8 character */
    
    func testPasswordLimitMoreEight(){
        
        let storedPassword = "abcdefgh1"
        let storedName = "Abcdefg"
        let storedEmail = "kavita@gmail.com"
        
     
        usernameTextField.tap()
        usernameTextField.typeText(storedName)
        app.buttons["Return"].tap()
        
   
        emailTextField.tap()
        emailTextField.typeText(storedEmail)
        app.buttons["Return"].tap()
        
   
        Password.tap()
        Password.typeText(storedPassword)
        
        app.buttons["Return"].tap()
        app.buttons["LoginButton"].tap()
        
     
        XCTAssertEqual(errorTextField.label,"Password must have less than 8 characters")
        
    }
    

}

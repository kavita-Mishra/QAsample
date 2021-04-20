//
//  LoginPageSwiftUITutorialUITests.swift
//  LoginPageSwiftUITutorialUITests
//
//  Created by Thrive on 01.07.19.
//  Copyright © 2019 Thrive. All rights reserved.
//

import XCTest
@testable import LoginPageSwiftUITutorial

class LoginPageSwiftUITutorialUITests: XCTestCase {
private var  app : XCUIApplication!
    
    override func setUp() {
       app = XCUIApplication()
        app.launch()
        
        
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
      //  app = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testAssertLoginInvaildEmailCredentials(){

          let storedUsername = "myuser"
          let storedPassword = "mypassword"
          let storedEmail = "abcgmail.com"

          let validName = "Myusername"
          let validPassword = "Mypassw"
          let validEmail = "email@gmail.com"

          let usernameTextField = app.textFields["Username"]
        
        
        
          usernameTextField.tap()
          usernameTextField.typeText(storedUsername)
          app.buttons["Return"].tap()

         let emailTextField = app.textFields["Email"]
        
         emailTextField.tap()
         emailTextField.typeText(storedEmail)
         app.buttons["Return"].tap()
        
          let Password = app.secureTextFields["Password"]
          Password.tap()
          Password.typeText(storedPassword)
          app.buttons["Return"].tap()
          app.buttons["LOGIN"].tap()
        
         let errorTextField = app.textViews["TextError"]
        XCTAssertEqual(errorTextField.label,"Username incorrect")

          //XCTAssertEqual(storedUsername, validName, "Username incorrect") // checking for valid and invalid name
         // XCTAssertEqual(storedPassword, validPassword, "Password incorrect")// checking for valid and invalid password
          XCTAssertEqual(storedEmail, validEmail, "Email incorrect")
      }
    
    func testcheckvalidatePassword(){
        
        let storedUsername = "Myusername"
        let storedPassword = "mypa"
        let storedEmail = "email@gmail.com"

        let validName = "Myusername"
        let validPassword = "Mypassword"
        let validEmail = "email@gmail.com"

        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText(storedPassword)
        app.buttons["Return"].tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(storedEmail)
        app.buttons["Return"].tap()
      
        let Password = app.secureTextFields["Password"]
        Password.tap()
        Password.typeText(storedUsername)
        app.buttons["Return"].tap()
        app.buttons["LOGIN"].tap()
        
        XCTAssertEqual(storedUsername, validName, "Username incorrect") // checking for valid and invalid name
        XCTAssertEqual(storedPassword, validPassword, "Password incorrect")// checking for valid and invalid password
        XCTAssertEqual(storedEmail, validEmail, "Email incorrect")

        }
    
    
    func testcheckvalidatePasswordWithEightCharacter(){
        
        //let storedUsername = "myuser"
       // let storedPassword = "mypassword"
       // let storedEmail = "abcgmail.com"

        let validName = "Myusername"
        let validPassword = "Mypassword"
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

        }
    
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
    

}


//
//  LoginPageUsingAssert.swift
//  LoginPageSwiftUITutorialUITests
//
//  Created by Keywords Studio on 07/04/21.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import XCTest

class LoginPageUsingAssert: XCTestCase {
    private var app : XCUIApplication!
  

    override func setUpWithError() throws {
        
        app =  XCUIApplication()
        app.launch()
        
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /* Scenerio 1: Test case when user enter invalid credentials */
    
    func testAssertLoginInvaildCredentials(){

          let storedUsername = "myuser"
          let storedPassword = "mypassword"

          let validName = "Myusername"
          let validPassword = "Mypassword"

          let usernameTextField = app.textFields["Username"]

          usernameTextField.tap()
          usernameTextField.typeText(storedUsername)

          let Password = app.secureTextFields["Password"]
          Password.tap()
          Password.typeText(storedPassword)
          app.buttons["Return"].tap()
        
          app.buttons["LOGIN"].tap()

          XCTAssertEqual(storedUsername, validName, "Username incorrect") // checking for valid and invalid name

          XCTAssertEqual(storedPassword, validPassword, "Password incorrect")  // checking for valid and invalid password
      }
    
    
/* Scenerio 2: Test case when user enter missing credentials */
    
    func testLoginMissingCredentials() {
            
            let validName = "Myusername"
            let validPassword = "Mypassword"
        
           let usernameTextField = app.textFields["Username"]
            XCTAssertTrue(usernameTextField.exists)
            usernameTextField.tap()
            usernameTextField.typeText(validName)

            app.buttons["LOGIN"].tap()

          //  XCTAssertEqual(storedUsername, validName)
            XCTAssert("Myusername" == validName, validName)
        
            XCTAssertNil(validPassword, "Information not correct. Try again.")
          
}
/*Scenerio 3: Test case when user not enter any value */
    
    func testNotEnterLoginCreditions() {
       
        let storedUsername = "myuser"
        let storedPassword = "mypassword"
        
        let usernameTextField = app.textFields["Username"] // access the username field
        usernameTextField.tap()
        
        app.secureTextFields["Password"].tap() // access the password field
        
        app.buttons["Return"].tap()

        app.buttons["LOGIN"].tap() // tap on login button
        
        XCTAssertNil(storedUsername, "Information not correct. Try again.")

        XCTAssertNil(storedPassword, "Information not correct. Try again.")

}

/* Scenerio 4: Test case when user enter valid credentials */
    
func testCompareLoginValidCredentials() {
        
    let validName = "Myusername" // pre define username
    let validPassword = "Mypassword" // pre define password

    let storedUsername = "myuser"
    let storedPassword = "mypassword"

    let usernameTextField = app.textFields["Username"] // storing the input value in variable
    usernameTextField.tap()
    usernameTextField.typeText(validName) // pass predefine value as a parameter

    let Password = app.secureTextFields["Password"] // Password text field
    Password.tap()
    Password.typeText(validPassword)

    app.buttons["Return"].tap()
    app.buttons["LOGIN"].tap()

    XCTAssertNotEqual(storedUsername, validName, "Username does not match")

    XCTAssertNotEqual(storedPassword, validPassword, "Password does not match")
    }
    
/* Scenerio 5: Test case when comparing two valid credentials */
    
    func testLoginValidCredentials() {
            
        let validName = "Myusername" // pre define username
        let validPassword = "Mypassword" // pre define password

        let storedUsername = "Myusername"
        let storedPassword = "Mypassword"

        let usernameTextField = app.textFields["Username"] // storing the input value in variable
        usernameTextField.tap()
        usernameTextField.typeText(validName) // pass predefine value as a parameter

        let Password = app.secureTextFields["Password"] // Password text field
        Password.tap()
        Password.typeText(validPassword)

        app.buttons["Return"].tap()
        app.buttons["LOGIN"].tap()

        XCTAssertEqual(storedUsername, validName, "Username match")

        XCTAssertEqual(storedPassword, validPassword, "Password match")
        }
    
/* Scenerio 6: Test case when user check error message*/
    
func testInvalidErrormessage() {
    
    let usernameTextField = app.textFields["Username"] // access the username field
    usernameTextField.tap()

    app.secureTextFields["Password"].tap() // access the password field

    app.buttons["Return"].tap() // tap on return button to close the keyboard

    app.buttons["LOGIN"].tap() // tap on login button

    let errorMessage = "Information not correct. Try again."   // correct error message
    XCTAssert("Information" == errorMessage, errorMessage)     // checking for correct message

}

}

//
//  LoginPageSwiftUITutorialUITests.swift
//  LoginPageSwiftUITutorialUITests
//
//  Created by Thrive on 01.07.19.
//  Copyright © 2019 Thrive. All rights reserved.
//

import XCTest

class LoginPageSwiftUITutorialUITests: XCTestCase {
    
    private var app : XCUIApplication!
    
    override func setUp() {
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false

      
    }

    override func tearDown() {
        
        app = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /* Scenerio 1: Test case when user enter invalid credentials */
        
  func testLoginInvaildCredentials(){

    let storedUsername = "myuser"
    let storedPassword = "mypassword"

    let validName = "Myusername"
    let validPassword = "Mypassword"

   // let app = XCUIApplication()
    //XCUIApplication().launch()

    let usernameTextField = app.textFields["Username"]
    usernameTextField.tap()
    usernameTextField.typeText(storedUsername)
    
    let Password = app.secureTextFields["Password"]
    Password.tap()
    Password.typeText(storedPassword)
    
    app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.buttons["LOGIN"].tap()
    
    if validName != storedUsername && validPassword != storedPassword{
    app.staticTexts["Information user not correct. Try again."]
    }
}

/* Scenerio 2: Test case when user enter missing credentials */
        
 func testLoginMissingCredentials() {
                
    let validName = "Myusername"
    
    let app = XCUIApplication()
    XCUIApplication().launch()
    
    let usernameTextField = app.textFields["Username"]
    XCTAssertTrue(usernameTextField.exists)
    usernameTextField.tap()
    usernameTextField.typeText(validName)
    
   app.buttons["LOGIN"].tap()
 
    
    
   let informationNotCorrectTryAgainStaticText = app.staticTexts["Information not correct. Try again."]
              
    }
    
/*Scenerio 3: Test case when user not enter any value */
    
func testNotEnterLoginCreditions() {
    
   // let app = XCUIApplication()   // Assigning and launch the app
    //XCUIApplication().launch()
    
    let usernameTextField = app.textFields["Username"] // access the username field
    usernameTextField.tap()
    
    app.secureTextFields["Password"].tap() // access the password field
    
    app.buttons["Return"].tap() // tap on return button to close the keyboard
    
    app.buttons["LOGIN"].tap() // tap on login button
    
    let informationNotCorrectTryAgainStaticText = app.staticTexts["Information not correct. Try again."] // Error messgae shown when no input found

}
    
/* Scenerio 4: Test case when user enter valid credentials */
    
    func testLoginValidCredentials() {
        
    let validName = "Myusername" // pre define username
    let validPassword = "Mypassword" // pre define password
    
    let app = XCUIApplication()
    XCUIApplication().launch() // launch the application
    
    let usernameTextField = app.textFields["Username"] // storing the input value in variable
    usernameTextField.tap()
    usernameTextField.typeText(validName) // pass predefine value as a parameter
        
    let Password = app.secureTextFields["Password"]
    Password.tap()
    Password.typeText(validPassword)
    
    app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()//tap on return button to close the keyboard
    
    app.buttons["LOGIN"].tap()
      
}
func testAssertTest()
{
    let validName = "Myusername"
           XCTAssert("Myusername" == validName, validName)
          // XCTAssertEqual("Test", test, test)
    
    
    

}
    

    
    
  }


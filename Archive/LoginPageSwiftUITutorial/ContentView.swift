//
//  ContentView.swift
//  LoginPageSwiftUITutorial
//
//  Created by BLCKBIRDS on 01.07.19.
//  Copyright © 2019 BLCKBIRDS. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "Myusername"
let storedEmail = "email@gmail.com"
let storedPassword = "Mypassword"

struct ContentView : View, ValidationProtocol {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var error: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var editingMode: Bool = false
    
    var body: some View {
        ScrollView {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username, editingMode: $editingMode)
                EmailTextField(email: $email, editingMode: $editingMode)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text(error)
                        .offset(y: -10)
                        .foregroundColor(.red)
                        .accessibility(identifier:"TextError")
                }
                Button(action: {
                    isValid()
                }) {
                    LoginButtonContent()
                }
                }
                .padding()
            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    //.id("LoginSuccefully")
                    .accessibility(identifier:"LoginSuccefully")
                    //change
                    .animation(Animation.default)
            }
        }
            .offset(y: editingMode ? -150 : 0)
        }
    }
    
    // Business logic
        
    func isValid() {
        if let error = validateFields() {
            self.error = error.localizedDescription
            self.authenticationDidFail = true
        } else {
            self.authenticationDidSucceed = true
            self.authenticationDidFail = false
        }
    }
    
    func validateFields() -> Error? {
        if case .failure(let error) = isValid(value: username, .username) {
            return error
        }
        else if case .failure(let error) = isValid(value: email, .email) {
            return error
        }
        else if case .failure(let error) = isValid(value: password, .password) {
            return error
        }
        
        if !(self.username == storedUsername
            && self.email == storedEmail
            && self.password == storedPassword) {
            return ValidationError("Information not correct. Try again.")
        }

        return nil
    }

}
struct WelcomeText : View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}


struct UserImage : View {
    var body: some View {
        return Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
            .id("username error")
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            //change
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
            .accessibility(identifier:"LoginButton")
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Username", text: $username, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .accessibility(identifier:"UsernameField")
    }
}

struct EmailTextField : View {
    
    @Binding var email: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Email", text: $email, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        }).keyboardType(.emailAddress)
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        .accessibility(identifier:"EmailField")
    }
}
struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .accessibility(identifier:"PasswordField")
            
    }
}

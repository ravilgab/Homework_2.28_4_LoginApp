//
//  User.swift
//  Homework_2.28_4_LoginApp
//
//  Created by Ravil on 22.11.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "Tim88", password: "1qaz@WSX", person: Person.getPerson())
    }
}

struct Person {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    static func getPerson() -> Person {
        Person(firstName: "Tim", lastName: "Cook")
    }
}

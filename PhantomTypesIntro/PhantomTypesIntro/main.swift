//
//  main.swift
//  PhantomTypesIntro
//
//  Created by Dave Spina on 3/3/21.
//

import Foundation

// phantom type that does not use one of its generic parameters
// different than regular generic types
struct Employee<Role>: Equatable {
    var name: String
}

enum Sales {}
enum Programmer {}

let zoe1 = Employee<Programmer>(name: "Zoe")
let zoe2 = Employee<Sales>(name: "Zoe")

//print(zoe1 == zoe2) // can't do this because they are really not the same type


enum OPositive {}
enum APositive {}
enum BPositive {}

struct BloodSample<Type> {
    var amount: Double
    
    static func +(lhs: BloodSample, rhs: BloodSample) -> BloodSample {
        return BloodSample(amount: lhs.amount + rhs.amount)
    }
}


let sample1 = BloodSample<OPositive>(amount: 5)
let sample2 = BloodSample<APositive>(amount: 5)
let sample3 = BloodSample<OPositive>(amount: 10)

let combined1 = sample1 + sample3 //valid
//let combined2 = sample1 + sample2 // invalid



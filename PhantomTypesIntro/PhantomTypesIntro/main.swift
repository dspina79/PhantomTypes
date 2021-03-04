//
//  main.swift
//  PhantomTypesIntro
//
//  Created by Dave Spina on 3/3/21.
//

import Foundation

/*
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

*/

/*
 ========= State Machine Example =========
 */

enum Waiting {}
enum CoinInserted {}
enum Fetching {}
enum Dispensing {}

struct Transition <From, To> {}

struct Machine<State> {
    func transition<To>(from transition: Transition<State, To>) -> Machine<To> {
        .init()
    }
}


let starting = Transition<Waiting, CoinInserted>()
let selection = Transition<CoinInserted, Fetching>()
let delivery = Transition<Fetching, Dispensing>()
let reset = Transition<Dispensing, Waiting>()


let m1 = Machine<Waiting>()
let m2 = m1.transition(from: starting)
let m3 = m2.transition(from: selection)
let m4 = m3.transition(from: delivery)
let m5 = m4.transition(from: reset)

//let m6 = m3.transition(from: reset) // invalid

// a goood little function to have that is not a phantom type
// but takes advantage of the SwiftUI type structure

func undefined<T>(_ message: String = "") -> T {
    fatalError("Undefined: \(message)")
}

func methodNotYetReady(name: String) -> Int? {
    undefined(name)
}





//
//  onBoardingModel.swift
//  Pearl
//
//  Created by ElAmir Mansour on 07/12/2023.
//

import Foundation

struct Page: Identifiable ,Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "TITLE", description: "This is a description", imageUrl: "First_Pic", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Analise your skin and know its type", description: "Lorem ipsum dolor sit amet consectetur. Vestibulum nam sed platea bibendum libero tempor faucibus.", imageUrl: "First_Pic", tag: 0),
        Page(name: "Get your morning skin routine", description: "Lorem ipsum dolor sit amet consectetur. Vestibulum nam sed platea bibendum libero tempor faucibus.", imageUrl: "Second_Pic", tag: 1),
        Page(name: "And your night skin routine", description: "Lorem ipsum dolor sit amet consectetur. Vestibulum nam sed platea bibendum libero tempor faucibus.", imageUrl: "Third_Pic", tag: 2)

    ]
}

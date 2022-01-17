//
//  Lesson_15_ChallengeApp.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import SwiftUI

@main
struct Lesson_15_ChallengeApp: App {
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(BookModel())
        }
    }
}

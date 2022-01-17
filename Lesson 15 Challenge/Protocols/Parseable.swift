//
//  Parseable.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import Foundation

protocol Parseable: Identifiable, Decodable {
    
    var id: Int { get set }
    
}

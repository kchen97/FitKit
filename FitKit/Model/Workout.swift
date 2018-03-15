//
//  Workout.swift
//  FitKit
//
//  Created by Korman Chen on 3/14/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import Foundation

class Workout {
    var exercises = [Exercise]()
}

class Exercise {
    var name: String?
    var sets: String?
    var reps: String?
    
    init() {}
    
    convenience init(_ name: String, _ sets: String, _ reps: String) {
        self.init()
        
        self.name = name
        self.sets = sets
        self.reps = reps
    }
}

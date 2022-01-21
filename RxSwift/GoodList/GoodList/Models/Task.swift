//
//  Task.swift
//  GoodList
//
//  Created by asher.enfj on 2022/01/21.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}




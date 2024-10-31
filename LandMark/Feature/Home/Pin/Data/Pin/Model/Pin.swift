//
//  Pin.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//

import Foundation

struct Pin: Identifiable {
    let id: UUID
    let createdAt: Date
    let latitude: Double
    let longitude: Double
}

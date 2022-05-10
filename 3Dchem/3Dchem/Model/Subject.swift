//
//  Class.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import Foundation
import SwiftUI

struct SubjectList: Decodable {
    let data: [Subject]
}

struct Subject: Decodable {
    let title: String
    let texts: [String]
    let images: [String]
}

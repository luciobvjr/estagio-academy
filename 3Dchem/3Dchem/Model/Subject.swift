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
    let text: String
//    let image: String
//    let model3d: String
}

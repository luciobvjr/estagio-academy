//
//  SubjectViewModel.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 05/05/22.
//

import Foundation

class SubjectViewModel: ObservableObject {
    var subjecList: SubjectList?
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data",
                                          ofType: "json"
        ) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            subjecList = try JSONDecoder().decode(SubjectList.self, from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
}

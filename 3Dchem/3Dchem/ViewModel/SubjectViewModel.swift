//
//  SubjectViewModel.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 05/05/22.
//

import Foundation

class SubjectViewModel: ObservableObject {
    @Published var subjectList: SubjectList?
    
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data",
                                          ofType: "json"
        ) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            subjectList = try JSONDecoder().decode(SubjectList.self, from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func subjectsCount() -> Int {
        let count = subjectList?.data.count
        return count ?? 0
    }
}

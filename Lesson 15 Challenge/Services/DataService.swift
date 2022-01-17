//
//  DataService.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import Foundation

final class DataService {
    
    static func getLocalJsonData<T: Parseable>(forResource fileName: String) -> [T] {
        
        // 1. Get the path to the json file within the app bundle
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        
        // 2. If path is nil then return an empty array of T
        guard path != nil else {
            return [T]()
        }
        
        // 3. Get url object from the path within the app bundle
        let url = URL(fileURLWithPath: path!)
        
        do {
            // 4. Use a do..catch to create a data object from the url
            let data = try Data(contentsOf: url)
            
            // 5. Create a new JSONDecoder object
            let decoder = JSONDecoder()
            
            do {
                // 6. Use a do..catch to decode (de-serialize) the JSON object
                let jsonData = try decoder.decode([T].self, from: data)
                
                // 7. Return the decoded json data
                return jsonData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [T]()
    }
}

//
//  Bundle+Extension.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import Foundation


extension Bundle {
    func data<T: Codable>(file: String) -> T {
        // 1. Locate JOSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to find \(file) in the bundle.")
        }
        
        // 2. Create property of data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file)")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for decoded data.
        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            fatalError("Faile to decode \(file) from bundle \(error)")
        }
        
        
        
        
    }
}

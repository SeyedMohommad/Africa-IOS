//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ashkan Amin on 7/17/22.
//

import Foundation

extension Bundle {
    func decode<T:  Codable>(_ file:String) -> T {
        // 1. Locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle")
        }
        
        // 2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        // 3. Create decoder
        let decoder = JSONDecoder()
        // 4. Create property for the dcoder data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle")
        }
        // 5. Return ready-to-use data
        return loaded
    }
}

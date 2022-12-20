//
//  Encoder.swift
//  ToDoApp
//
//  Created by Никита Швец on 16.12.2022.
//

import Foundation

//old plist implementation
//class Coder {
//    
//    func encode(arr: [ToDoCellModel], url: URL?) {
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(arr)
//            try data.write(to: url!)
//        } catch {
//            
//        }
//    }
//    
//    func decode(url: URL?) -> [ToDoCellModel] {
//        do {
//            let data = try Data(contentsOf: url!)
//            do {
//                let arr = try PropertyListDecoder().decode([ToDoCellModel].self, from: data)
//                return arr
//            } catch {
//                return []
//            }
//        } catch {
//            return []
//        }
//    }
//}

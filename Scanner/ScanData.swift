//
//  ScanData.swift
//  Scanner
//
//  Created by Alper Salık on 2.02.2022.
//

import Foundation

struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}

//
//  SectionDataModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 26.05.2022.
//

import Foundation

struct SectionDataModel: Identifiable {
    
    var id: String {
        return letter
    }
    
    let letter: String
}

extension SectionDataModel: Equatable {
    static func == (lhs: SectionDataModel, rhs: SectionDataModel) -> Bool {
        return lhs.letter == rhs.letter
    }
}

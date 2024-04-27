//
//  CleanAPIService.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

enum CleanAPIService {
    case getPlus
    case getMinus
    
    var value: String {
        switch self {
        case .getPlus:
            return "서버에서 받아온 +"
        case .getMinus:
            return "서버에서 받아온 -"
        }
    }
}

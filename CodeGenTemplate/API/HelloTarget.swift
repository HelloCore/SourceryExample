//
//  HelloTarget.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/4/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum HelloTarget {
    case hello
    case world
}

extension HelloTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://www.google.com")!
    }
    
    var path: String {
        switch self {
        case .hello:
            return "hello"
            
        case .world:
            return "world"
        }
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

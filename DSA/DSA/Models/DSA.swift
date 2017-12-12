//
//  DSA.swift
//  DSA
//
//  Created by Caroline Cruz on 12/12/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import Foundation

enum DSAPropertyKeys: String {
    case title
    case description
}

//NSObject the umbrella everything inhertits from

class DSA: NSObject, NSCoding {
    var dsaTitle: String
    var dsaDescription: String
    
//    Saving
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dsaTitle, forKey: DSAPropertyKeys.title.rawValue)
        aCoder.encode(dsaDescription, forKey: DSAPropertyKeys.description.rawValue)
    }
//    Loading
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: DSAPropertyKeys.title.rawValue) as? String,
            let description = aDecoder.decodeObject(forKey: DSAPropertyKeys.description.rawValue) as? String
            else {return nil}
        self.init(title: title, description: description)
    }
    
//    designated initializer
    init(title: String, description: String) {
        self.dsaTitle = title
        self.dsaDescription = description
        
    }
}

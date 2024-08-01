//
//  WordModel.swift
//  Lawson-andrey
//
//  Created by Apple on 05.07.2024.
//

import Foundation
import RealmSwift

class WordModel: Object {
    @Persisted(primaryKey: true) var _id: UUID
    @Persisted var word: String
    @Persisted var translate: String
    
 convenience   init( word: String, translate: String) {
        self.init()
        self._id = UUID()
        self.word = word
        self.translate = translate
    }
}

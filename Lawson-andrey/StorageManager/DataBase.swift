//
//  DataBase.swift
//  Lawson-andrey
//
//  Created by Apple on 05.07.2024.
//

import Foundation
import RealmSwift


class DataBase {
    static var shared: DataBase = DataBase()
    private  let realm = try! Realm()
    
    private init(){ }
    
    //1 - get
    
    func getWords() -> [WordModel] {
        let result = realm.objects(WordModel.self)
        
       return Array(result)
    }
    
    //2 - save
    func save(model: WordModel) {
        
      try!  realm.write{
            realm.add(model)
        }
   
    }
    //3 - editing
    func editing(_ editWord:WordModel, word:String, translate:String) {
       
        
        try! realm.write{
            editWord.word = word
            editWord.translate = translate
        }
    }
    //4 - delete
    func delete(model:WordModel){
        try! realm.write{
            realm.delete(model)
        }
    }
}

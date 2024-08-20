
import Foundation
import RealmSwift


class DataBase {
    static var shared: DataBase = DataBase()
    private  let realm = try! Realm()
    
    private init(){ }
    
    //1 - get
    
    func get<T>(type: T.Type) -> [T] where T: Object {
        let result = realm.objects(T.self)
        
       return Array(result)
    }
    
    //2 - save
    func save(_ object: Object) {
        
      try!  realm.write{
            realm.add(object)
        }
   
    }
    
    func save(_ objects: [Object]) {
        
      try!  realm.write{
            realm.add(objects)
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
    func delete(model:Object){
        try! realm.write{
            realm.delete(model)
        }
    }
    
    func delete(model:[Object]){
        try! realm.write{
            realm.delete(model)
        }
    }
}

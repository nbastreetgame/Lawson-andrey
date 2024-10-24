import Foundation

protocol InternetPresenterProtocol: AnyObject {
    func reloadData()
    func saveImageSelectName(_ data: Data)
}


class InternetPresenter { //собстенные методы и свойства
    
    weak var view: InternetPresenterProtocol?
     var arrayPhotos: [PhotoModel] = []
  var isSelectedCell: IndexPath!
    
    private func loading() {
      
        Network.shared.getPhotos { [weak self]  result in
            
            switch result {
            case.success(let array):
                self?.arrayPhotos = array
                
                DispatchQueue.main.async {
                    self?.view?.reloadData()
                }
                
               
                
                
            case.failure (let error):
                print(error.localizedDescription)
                return
            }
            
        }
    }
}


//MARK: - Входящие из контроллера

extension InternetPresenter {
    func setupViewDidLoad() {
        loading()
    }
    
    func saveImage() {
        guard let isSelectedCell,
              let name = arrayPhotos[isSelectedCell.row].urls?.regular,
              let url = URL(string: name)
        else { return }
        
        Network.shared.downloadImage(url: url) { [weak self] result in
            
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self?.view?.saveImageSelectName(data)
                }
                
            case.failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        
        
    }
    
}

//MARK: - Исходящие данные

extension InternetPresenter {
    
}

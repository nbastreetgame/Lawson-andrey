import Foundation

protocol InternetPresenterProtocol: AnyObject {
    func reloadData()
    func saveImageSelectName(_ name: String)
}


class InternetPresenter { //собстенные методы и свойства
    
    weak var view: InternetPresenterProtocol?
     var arrayPhotos: [PhotoModel] = []
  var isSelectedCell: IndexPath!
    
    private func loading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.arrayPhotos = PhotoModel.images
            self.view?.reloadData()
        }
        
    }
}


//MARK: - Входящие из контроллера

extension InternetPresenter {
    func setupViewDidLoad() {
        loading()
    }
    
    func saveImage() {
        guard let isSelectedCell  else { return  }
        let name = arrayPhotos[isSelectedCell.row].name
        view?.saveImageSelectName(name)
        
    }
    
}

//MARK: - Исходящие данные

extension InternetPresenter {
    
}

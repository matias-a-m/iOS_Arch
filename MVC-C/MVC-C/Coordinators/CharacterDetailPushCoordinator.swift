import Foundation
import UIKit

class CharacterDetailPushCoordinator:Coordinator {
    
    let characterModel: CharacterModel
    var navigationController: UINavigationController?
    
    init(characterModel: CharacterModel, navigationController: UINavigationController? = nil) {
        self.characterModel = characterModel
        self.navigationController = navigationController
    }
    
    
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
    
    
}

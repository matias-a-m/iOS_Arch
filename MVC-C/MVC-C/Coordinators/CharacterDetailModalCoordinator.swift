import Foundation
import UIKit

/// Coordinator para manejar la presentación modal de la vista de detalle de un personaje.
class CharacterDetailModalCoordinator: Coordinator {
    
    /// Modelo del personaje que se mostrará en la vista de detalle.
    let characterModel: CharacterModel
    
    /// Vista de controlador que gestionará la presentación modal de la vista de detalle.
    var viewController: UIViewController?
    
    /// Inicializador del coordinador.
    /// - Parameters:
    ///   - characterModel: Modelo del personaje que se mostrará en la vista de detalle.
    ///   - viewController: Vista de controlador que gestionará la presentación modal de la vista de detalle.
    init(characterModel: CharacterModel, viewController: UIViewController? = nil) {
        self.characterModel = characterModel
        self.viewController = viewController
    }

    /// Método para iniciar la presentación modal de la vista de detalle del personaje.
    func start() {
        // Crea la vista de detalle del personaje con el modelo proporcionado.
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        
        // Utiliza la vista de controlador para presentar la vista de detalle de forma modal.
        viewController?.present(characterDetailViewController, animated: true)
    }
}

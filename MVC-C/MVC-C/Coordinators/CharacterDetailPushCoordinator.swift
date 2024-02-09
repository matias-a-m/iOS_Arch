import Foundation
import UIKit

/// Coordinator para manejar la navegación a la vista de detalle de un personaje.
class CharacterDetailPushCoordinator: Coordinator {
    
    /// Modelo del personaje que se mostrará en la vista de detalle.
    let characterModel: CharacterModel
    
    /// Objeto de navegación que gestionará la presentación de la vista de detalle.
    var navigationController: UINavigationController?
    
    /// Inicializador del coordinador.
    /// - Parameters:
    ///   - characterModel: Modelo del personaje que se mostrará en la vista de detalle.
    ///   - navigationController: Objeto de navegación que gestionará la presentación de la vista de detalle.
    init(characterModel: CharacterModel, navigationController: UINavigationController? = nil) {
        self.characterModel = characterModel
        self.navigationController = navigationController
    }
    
    /// Método para iniciar la presentación de la vista de detalle del personaje.
    func start() {
        // Crea la vista de detalle del personaje con el modelo proporcionado.
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        
        // Utiliza el objeto de navegación para presentar la vista de detalle.
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}

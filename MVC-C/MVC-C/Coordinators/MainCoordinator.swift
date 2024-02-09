import Foundation
import UIKit

/// Coordinator encargado de gestionar la navegación principal de la aplicación.
class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    
    /// La instancia del controlador de navega ción que el coordinador utilizará para la navegación.
    var navigationController: UINavigationController?
    
    // MARK: - Initialization
    
    /// Inicializador del coordinador principal.
    /// - Parameter navigationController: El controlador de navegación asociado.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Protocol Methods
    
    /// Método que inicia la navegación principal de la aplicación.
    func start() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let listOfCharactersViewController = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController")
           navigationController?.pushViewController(listOfCharactersViewController, animated: true)
           
       }
}

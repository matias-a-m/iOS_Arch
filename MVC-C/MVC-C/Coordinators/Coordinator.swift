import Foundation
import UIKit

/// **Coordinator Protocol**
///
/// Un protocolo para coordinadores de flujo de navegación en la aplicación.
protocol Coordinator {
    /// La vista principal asociada al coordinador.
    var viewController: UIViewController? { get }
    
    /// El controlador de navegación asociado al coordinador.
    var navigationController: UINavigationController? { get }
    
    /// Inicia el flujo de coordinación.
    func start()
}

/// **Coordinator Extension**
///
/// Extensión del protocolo Coordinator que proporciona implementaciones predeterminadas.
extension Coordinator {
    /// La vista principal asociada al coordinador. Implementación predeterminada: `nil`.
    ///
    /// - Note: Los coordinadores concretos deben proporcionar su propia implementación.
    var viewController: UIViewController? { nil }

    /// El controlador de navegación asociado al coordinador. Implementación predeterminada: `nil`.
    ///
    /// - Note: Los coordinadores concretos deben proporcionar su propia implementación.
    var navigationController: UINavigationController? { nil }
}

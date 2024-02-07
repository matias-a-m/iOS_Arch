import Foundation
import UIKit

// MARK: - ListOfCharactersTableViewDelegate

/// Clase que actúa como delegado de la tabla para gestionar la selección de celdas y la altura de las mismas.
class ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    
    /// Closure que se llama cuando se toca una celda en la tabla. El parámetro representa el índice de la celda seleccionada.
    var didTapOnCell: ((Int) -> Void)?
    
    // MARK: - UITableViewDelegate Methods
    
    /// Método llamado cuando se selecciona una celda en la tabla.
    /// - Parameters:
    ///   - tableView: La tabla que contiene la celda.
    ///   - indexPath: La ubicación de la celda seleccionada.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    
    /// Método que especifica la altura de una celda en la tabla.
    /// - Parameters:
    ///   - tableView: La tabla que contiene la celda.
    ///   - indexPath: La ubicación de la celda.
    /// - Returns: La altura deseada para la celda en la posición especificada.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

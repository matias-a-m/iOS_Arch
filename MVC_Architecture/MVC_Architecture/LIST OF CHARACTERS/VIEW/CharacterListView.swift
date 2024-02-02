import Foundation
import UIKit

// MARK: - Vista de la Lista de Personajes

/// Vista que contiene la tabla para mostrar la lista de personajes.
class CharacterListView: UIView {
    let charactersTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()
    
    // Inicialización de la vista
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método para configurar la apariencia de la vista
    func setupView() {
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

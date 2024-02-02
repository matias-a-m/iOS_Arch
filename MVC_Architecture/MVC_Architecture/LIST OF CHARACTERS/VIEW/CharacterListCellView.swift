import Foundation
import UIKit

// MARK: - Vista de la Celda del Personaje

/// Celda personalizada para mostrar la información de un personaje en la lista.
class CharacterListCellView: UITableViewCell {

    // Propiedades de la celda
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterStatus: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterSpecies: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coded:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    // Método para configurar la apariencia de la celda
    func setupView() {
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterSpecies)

        let margin: CGFloat = 20.0

        // Restricciones para characterImageView
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            characterImageView.widthAnchor.constraint(equalToConstant: 100.0), // Ajusta según tus necesidades
            characterImageView.heightAnchor.constraint(equalToConstant: 100.0), // Ajusta según tus necesidades
        ])

        // Restricciones para characterName
        NSLayoutConstraint.activate([
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: margin),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            characterName.topAnchor.constraint(equalTo: topAnchor, constant: margin),
        ])

        // Restricciones para characterStatus
        NSLayoutConstraint.activate([
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.trailingAnchor.constraint(equalTo: characterName.trailingAnchor),
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: margin),
        ])

        // Restricciones para characterSpecies
        NSLayoutConstraint.activate([
            characterSpecies.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterSpecies.trailingAnchor.constraint(equalTo: characterName.trailingAnchor),
            characterSpecies.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: margin),
            characterSpecies.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -margin),
        ])
    }

    func configure(_ model: CharacterModel){
        // Configura los datos de la celda (patrón MVC: Vista)
        self.characterName.text = model.name
        self.characterStatus.text = model.status
        self.characterSpecies.text = model.species
    }



}

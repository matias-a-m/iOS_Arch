import Foundation
import UIKit

// La clase DetailView representa la vista de detalle para un personaje en el patrón MVC.
class DetailView: UIView {

    // Propiedades de la celda

    // ImageView para mostrar la imagen del personaje.
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Etiqueta para mostrar el nombre del personaje.
    let characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Etiqueta para mostrar el estado del personaje.
    let characterStatus: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Etiqueta para mostrar la especie del personaje.
    let characterSpecies: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Almacén de la tarea de descarga actual para cancelarla si es necesario.
    private var imageDownloadTask: URLSessionDataTask?

    // Almacén de imágenes en caché para evitar descargas repetidas.
    private var imageCache: [String: UIImage] = [:]

    // Método requerido al implementar la inicialización desde un archivo de codificación (archivos xib, storyboards, etc.).
    required init?(coder: NSCoder) {
        fatalError("init(coded:) has not been implemented")
    }

    // Método de inicialización de la vista con un marco específico.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    // Método para configurar la apariencia de la celda.
    func setupViews() {
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterSpecies)

        backgroundColor = .white

        let margin: CGFloat = 20.0

        // Restricciones para characterImageView
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            characterImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: margin),
            characterImageView.widthAnchor.constraint(equalToConstant: 200.0), // Ajusta según tus necesidades
            characterImageView.heightAnchor.constraint(equalToConstant: 200.0), // Ajusta según tus necesidades
        ])

        // Restricciones para characterName
        NSLayoutConstraint.activate([
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: margin),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            characterName.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: margin),
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

    // Método para configurar la vista con los datos del modelo.
    func configure(_ model: CharacterModel) {
        // Configura los datos de la celda (patrón MVC: Vista)
        self.characterName.text = model.name
        self.characterStatus.text = model.status
        self.characterSpecies.text = model.species

        // Cancela la descarga anterior si hay una en curso.
        imageDownloadTask?.cancel()

        // Carga la imagen de forma asíncrona.
        if let cachedImage = imageCache[model.image] {
            // Si la imagen está en caché, úsala directamente.
            characterImageView.image = cachedImage
        } else {
            // Descarga la imagen de forma asíncrona.
            if let imageURL = URL(string: model.image) {
                imageDownloadTask = URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, error in
                    defer {
                        // Libera la referencia a la tarea de descarga después de completarla.
                        self?.imageDownloadTask = nil
                    }

                    if let error = error {
                        print("Error loading image: \(error)")
                        return
                    }

                    if let data = data, let image = UIImage(data: data) {
                        // Almacena la imagen en caché.
                        self?.imageCache[model.image] = image

                        // Actualiza la imagen en el hilo principal.
                        DispatchQueue.main.async {
                            self?.characterImageView.image = image
                        }
                    }
                }
                imageDownloadTask?.resume()
            }
        }
    }
}

import Foundation
import UIKit

// MARK: - Fuente de Datos de la UITableView

/// Clase de origen de datos para la UITableView que maneja la lógica de presentación de la lista de personajes.
final class ListOfCharactersTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Propiedades

    /// La UITableView asociada a la fuente de datos.
    private let tableView: UITableView

    /// Lista de personajes que se mostrarán en la UITableView.
    var characters: [CharacterModel] = []

    /// Almacenamiento en caché de imágenes para evitar descargas repetidas.
    private var imageCache: [String: UIImage] = [:]

    /// Tareas de descarga de imágenes en curso, asociadas a índices de celdas.
    private var imageDownloadTasks: [IndexPath: URLSessionDataTask] = [:]

    // MARK: - Inicialización

    /// Inicializa la fuente de datos con la UITableView asociada.
    /// - Parameter tableView: La UITableView que mostrará la lista de personajes.
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Obtiene una celda reutilizable del identificador "CharacterListCellView".
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView

        // Recupera el personaje en el índice de fila actual.
        let character = characters[indexPath.row]
        // Configura la celda con los datos del personaje.
        cell.configure(character)

        // Utiliza la caché para cargar la imagen de forma asíncrona.
        if let cachedImage = imageCache[character.image] {
            // Si la imagen está en caché, úsala directamente.
            cell.characterImageView.image = cachedImage
        } else {
            // Cancela la descarga anterior para la celda si es necesario.
            if let existingTask = imageDownloadTasks[indexPath] {
                existingTask.cancel()
            }

            // Descarga la imagen de forma asíncrona.
            if let imageURL = URL(string: character.image) {
                let task = URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
                    guard let data = data, let image = UIImage(data: data) else { return }

                    // Almacena la imagen en caché.
                    self?.imageCache[character.image] = image

                    // Actualiza la imagen en la celda en el hilo principal.
                    DispatchQueue.main.async {
                        cell.characterImageView.image = image
                    }
                }
                task.resume()

                // Almacena la tarea de descarga para cancelarla si es necesario.
                imageDownloadTasks[indexPath] = task
            }
        }

        return cell
    }

    func set(characters: [CharacterModel]) {
        // Establece la lista de personajes y recarga la UITableView.
        self.characters = characters
        tableView.reloadData()
    }

    // MARK: - Liberación de Recursos

    /// Cancela las descargas pendientes al desasignar la fuente de datos.
    deinit {
        for (_, task) in imageDownloadTasks {
            task.cancel()
        }
    }
}

import Foundation

// MARK: - Cliente de la API para la Lista de Personajes

/// Cliente que se encarga de realizar la solicitud a la API para obtener la lista de personajes.
final class ListOfCharactersAPIClient {

    // Método que realiza una solicitud asíncrona para obtener la lista de personajes desde la API
    func getListOfCharacters() async throws -> CharacterModelResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!

        // Realiza una solicitud de datos de forma asíncrona
        let (data, _) = try await URLSession.shared.data(from: url)

        // Decodifica los datos obtenidos en una estructura de respuesta de personajes
        return try JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}

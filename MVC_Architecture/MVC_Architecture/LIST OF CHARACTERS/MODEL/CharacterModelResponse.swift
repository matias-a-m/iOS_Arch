import Foundation

// MARK: - Estructura de Respuesta de Personajes

/// Estructura que representa la respuesta de la API que contiene la lista de personajes.
struct CharacterModelResponse: Decodable {
    let results: [CharacterModel]
}


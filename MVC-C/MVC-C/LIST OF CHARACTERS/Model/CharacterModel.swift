import Foundation

//MARK: - Modelo de Datos

/// Estructura que representa un modelo de personajes
struct CharacterModel: Decodable{
    let name: String
    let status: String
    let species: String
    let image: String
    
}

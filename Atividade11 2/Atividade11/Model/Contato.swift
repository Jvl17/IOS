
protocol ContatoProtocol {
    func criar(contato: Contato)
    func alterar(contato: Contato)
    func excluir(id: String)
    func obterTodos() -> [Contato]
}

struct Contato: Encodable, Decodable { //Pode ser apenas Codable
    var id: String
    var nome : String
    var endereco : String
    var numero : String
    var email : String
    var celular : String
}

import Foundation
struct ContatoFactory {
    private var nomes: [String] = ["Julia", "Beatriz", "Tomas", "Vanessa", "Matheus", "Nath"]
    private var sobrenomes: [String] = ["Lopes", "Miranda", "Aquino", "Valle", "Nunes", "Gales"]
    private var enderecos: [String] = ["Rua 1", "Rua 2", "Rua 3", "Rua 4", "Rua 5"]
    private var celulares: [String] = ["31 998213412", "31 998863471", "31 948273412", "31 9982433212", "31 988052029"]
    
    func obterNovoContato() -> Contato {
        let nome = self.nomes.shuffled()[0]
        let sobrenome = self.sobrenomes.shuffled()[0]
        let endereco = self.enderecos.shuffled()[0]
        let celular = self.celulares.shuffled()[0]
        
        let email = "\(nome.lowercased()).\(sobrenome.lowercased())@gmail.com"
        let numero = Int.random(in: 0...1000)
        let nomeCompleto = "\(nome) \(sobrenome)"
        
        let contato = Contato(id: UUID().uuidString,
                              nome: nomeCompleto,
                              endereco: endereco,
                              numero: "\(numero)",
                              email: email,
                              celular: celular)

    
        return contato
        
    }
}

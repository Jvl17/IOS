
import UIKit

class CadastroViewController: UIViewController {
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEndereco: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    
    public var contato: Contato?
    var delegate: ContatoProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Novo Contato"

        if let contato = self.contato {
            self.title = contato.nome
            
            self.txtNome.text = contato.nome
            self.txtEndereco.text = contato.endereco
            self.txtNumero.text = contato.numero
            self.txtEmail.text = contato.email
            self.txtCelular.text = contato.celular
        }
    }
    
    @IBAction func salvarContato(_ sender: Any) {
        if let nome = self.txtNome.text,
           let endereco = self.txtEndereco.text,
           let email = self.txtEmail.text,
           let numero = self.txtNumero.text,
           let telefone = self.txtCelular.text,
           !nome.isEmpty && !endereco.isEmpty && !email.isEmpty && !numero.isEmpty && !telefone.isEmpty
        {
            if var contatoAntigo = self.contato {
                contatoAntigo.nome = nome
                contatoAntigo.endereco = endereco
                contatoAntigo.numero = numero
                contatoAntigo.celular = telefone
                contatoAntigo.email = email
                
                self.delegate?.alterar(contato: contatoAntigo)
                
            } else {
                let novoContato = Contato(id: UUID().uuidString,
                                          nome: nome,
                                          endereco: endereco,
                                          numero: numero,
                                          email: email,
                                          celular: telefone)
                
                self.delegate?.criar(contato: novoContato)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}

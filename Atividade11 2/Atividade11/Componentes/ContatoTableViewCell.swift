import UIKit

class ContatoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNome : UILabel!
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblTelefone : UILabel!
    @IBOutlet weak var lblEndereco : UILabel!
    @IBOutlet weak var lblNumero : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configurar(contato: Contato) {
        self.lblNome.text = contato.nome
        self.lblEmail.text = contato.email
        self.lblTelefone.text = contato.celular
        self.lblEndereco.text = contato.endereco
        self.lblNumero.text = contato.numero
    }

}

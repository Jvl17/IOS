import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tabela: UITableView!
    
    private let contactsKey = "contatos"
    private var userDefaults = UserDefaults.standard
    private var nomes: [Contato] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contatos"
        
        self.nomes = self.obterTodos()
        
        self.tabela.dataSource = self
        self.tabela.delegate = self
        
    }
    
    @IBAction func goToNewItemByUI(_ sender: Any) {
        self.navigate()
    }
    
    private func navigate() {
        let vc = CadastroViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ContatoTableViewCell else {
            return UITableViewCell()
        }
        let contato = self.nomes[indexPath.row]
        cell.configurar(contato: contato)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contato = self.nomes[indexPath.row]
        
        let cadastro = CadastroViewController()
        cadastro.contato = contato
        cadastro.delegate = self
        self.navigationController?.pushViewController(cadastro, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive , title: "Excluir") { [weak self] _,_,_ in
            guard let tela = self else {return}
            tela.nomes.remove(at: indexPath.row)
            tela.tabela.reloadData()
        }
        
        deleteAction.image = .init(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    }

extension ViewController: ContatoProtocol {
    private func gravarLista() {
        do {
            let data = try JSONEncoder().encode(self.nomes)
            userDefaults.setValue(data, forKey: contactsKey)
        } catch {
            print("===> ERRO AO GRAVAR -> ViewController.criar \(error.localizedDescription)" )
                   
        }
    }
    
    func criar(contato: Contato) {
        self.nomes.append(contato)
        self.gravarLista()
        self.tabela.reloadData()
    }
    
    func alterar(contato: Contato) {
        if let index = self.nomes.firstIndex(where: { $0.id == contato.id }) {
            self.nomes[index].nome = contato.nome
            self.nomes[index].celular = contato.celular
            self.nomes[index].numero = contato.numero
            self.nomes[index].endereco = contato.endereco
            self.nomes[index].email = contato.email
            
            // TODO: Salvar a Lista com a ultima atualizacao
            self.gravarLista()
            
            self.tabela.reloadData()
        }
    }
    
    func excluir(id: String) {
        if let index = self.nomes.firstIndex(where: { $0.id == id }) {
            self.nomes.remove(at: index)
            self.gravarLista()
            self.tabela.reloadData()
        }
    }
    
    func obterTodos() -> [Contato] {
        guard let data = userDefaults.value(forKey: contactsKey) as? Data else {
            return []
        }
        var items = [Contato]()
        do {
            items = try JSONDecoder().decode([Contato].self, from: data)
        } catch {
            print("===> ERRO AO CARREGAR ITEMS -> viewController.obterTodos")
        }
        return items
    }
    
    
    
}

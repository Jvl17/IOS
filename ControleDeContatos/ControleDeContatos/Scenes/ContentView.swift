
import SwiftUI

struct ContentView: View {
    var contacts: [Contact] = [
        Contact(id: UUID().uuidString, nome: "Julia ", email: "julia@teste"),
        Contact(id: UUID().uuidString, nome: "Larissa ", email: "larissa@teste"),
    ]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(contacts) { contact in
                    NavigationLink {
                        ContactDetailPage(contact: contact)
                    } label: {
                        SingleLine(contact: contact)
                    }
                
                }
            }
            .padding(5)
        }
    }
}

struct SingleLine: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            Image(systemName: "trash")
            
            VStack (alignment: .leading) {
                
                Text(contact.nome)
                Text(contact.email)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

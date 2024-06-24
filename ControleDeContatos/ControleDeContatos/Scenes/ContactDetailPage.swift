
import SwiftUI

struct ContactDetailPage: View {
    var contact: Contact?
    
    var body: some View {
        Text(contact?.nome ?? "Inexistente")
    }
}

struct ContactDetailPage_Previews: PreviewProvider {
    static let item = Contact(id: UUID().uuidString, nome: "Julia ", email: "julia@teste")
    
    static var previews: some View {
        ContactDetailPage(contact: item)
    }
}

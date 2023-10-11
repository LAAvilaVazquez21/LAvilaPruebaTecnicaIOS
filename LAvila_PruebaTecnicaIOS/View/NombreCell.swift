

import UIKit

class NombreCell: UITableViewCell {
    
    
    @IBOutlet weak var txtNombre: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtNombre.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


// MARK: UITextFieldDelegate
extension NombreCell : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Obtén el nuevo texto después de agregar el texto de reemplazo
        guard let currentText = textField.text, let textRange = Range(range, in: currentText) else {
            return true
        }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        
        // Define la expresión regular para permitir letras mayúsculas, minúsculas, acentos, "ñ", espacios y borrar caracteres
        let regex = "^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\\s]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        // Verifica si el texto cumple con la expresión regular y la longitud máxima de 25 caracteres
        if predicate.evaluate(with: updatedText), updatedText.count <= 25 {
            return true
        } else {
            return false
        }
    }
}

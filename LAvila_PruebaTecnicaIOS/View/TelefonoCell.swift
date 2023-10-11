

import UIKit

class TelefonoCell: UITableViewCell {

    @IBOutlet weak var txtTelefono: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtTelefono.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



// MARK: UITextFieldDelegate

extension TelefonoCell : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        let isNumeric = allowedCharacters.isSuperset(of: characterSet)
        let isBackspace = string.isEmpty && range.length == 1

        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let hasValidLength = updatedText.count <= 10

        return hasValidLength && isNumeric || isBackspace
    }
}

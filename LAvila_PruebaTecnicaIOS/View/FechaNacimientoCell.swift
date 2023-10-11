
import UIKit

class FechaNacimientoCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var lblFechaNacimiento: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        lblFechaNacimiento.text = ""
        
        self.datePicker.setOnDateChangeListener {
            let formattedDate = formatter.string(from: self.datePicker.date)
            self.lblFechaNacimiento.text = formattedDate
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

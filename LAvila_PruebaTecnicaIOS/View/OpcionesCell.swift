

import UIKit

class OpcionesCell: UITableViewCell {

    @IBOutlet weak var lblOpcion: UILabel!
    
    @IBOutlet weak var btnCheck: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
}

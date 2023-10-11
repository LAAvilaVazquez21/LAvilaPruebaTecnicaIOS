

import UIKit

class ColorCell: UITableViewCell {
    
    
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var btnCheck: UIButton!
    
    @IBOutlet weak var lblColor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewColor.layer.cornerRadius = 10
        viewColor.layer.masksToBounds = true
        viewColor.layer.borderWidth = 1
        viewColor.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

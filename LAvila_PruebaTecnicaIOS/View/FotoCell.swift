
import UIKit

class FotoCell: UITableViewCell {
    
    @IBOutlet weak var imageViewFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        imageViewFoto.layer.cornerRadius = 10
        imageViewFoto.layer.masksToBounds = true
        // Initialization code
        let url = URL(string: "https://as01.epimg.net/motor/imagenes/2022/03/26/formula_1/1648307773_265077_1648322111_noticia_normal.jpg")!
        imageViewFoto.load(url: url)
    }
    
}

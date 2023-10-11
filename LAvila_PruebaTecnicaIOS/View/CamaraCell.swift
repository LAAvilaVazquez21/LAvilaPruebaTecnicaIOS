

import UIKit

class CamaraCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCamara: UIImageView!
    
    @IBOutlet weak var selectSourceButton: UIButton!
    
    
    
    var imagePickerController = UIImagePickerController()

    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCamara.layer.cornerRadius = 10
        imageViewCamara.layer.masksToBounds = true
        imageViewCamara.layer.borderWidth = 2
        imageViewCamara.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}



extension CamaraCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            self.imageView!.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
}

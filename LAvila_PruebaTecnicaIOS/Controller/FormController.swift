

import UIKit

class FormController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedRows = [IndexPath]()
    var contador : Int = 0
    
    var imagePickerController = UIImagePickerController()
    var imageLibrary = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.imagePickerController.delegate = self
        
        self.tableView.register(UINib(nibName: "CamaraCell", bundle: .main), forCellReuseIdentifier: "camaraCell")
        self.tableView.register(UINib(nibName: "FotoCell", bundle: .main), forCellReuseIdentifier: "fotoCell")
        self.tableView.register(UINib(nibName: "NombreCell", bundle: .main), forCellReuseIdentifier: "nombreCell")
        self.tableView.register(UINib(nibName: "TelefonoCell", bundle: .main), forCellReuseIdentifier: "telefonoCell")
        self.tableView.register(UINib(nibName: "FechaNacimientoCell", bundle: .main), forCellReuseIdentifier: "fechaNacimientoCell")
        self.tableView.register(UINib(nibName: "SexoCell", bundle: .main), forCellReuseIdentifier: "sexoCell")
        self.tableView.register(UINib(nibName: "ColorFavoritoCell", bundle: .main), forCellReuseIdentifier: "colorFavoritoCell")
        
        for index in 0..<selectedRows.count {
            selectedRows[index].removeFirst()
        }
  
    }


}

extension FormController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.contador = 0
        return selectedRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "camaraCell", for: indexPath)
        

        let t = selectedRows[indexPath.row]
        print("\n\n\nCURRENT INDEX T: \(t)\n\n\n")
                
        switch t[0]{
            
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "camaraCell", for: indexPath) as! CamaraCell
                
      
                cell.selectSourceButton.addTarget(self, action: #selector(selectImageSource), for: .touchUpInside)
            
            return cell

        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "fotoCell", for: indexPath) as! FotoCell
            return cell

        case 2:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "nombreCell", for: indexPath) as! NombreCell
            return cell

        case 3:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "telefonoCell", for: indexPath) as! TelefonoCell
            return cell

        case 4:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "fechaNacimientoCell", for: indexPath) as! FechaNacimientoCell
            return cell

        case 5:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "sexoCell", for: indexPath) as! SexoCell
            
            cell.controller = self
            return cell

        case 6:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "colorFavoritoCell", for: indexPath) as! ColorFavoritoCell
            cell.controller = self
            return cell

        default:
            fatalError("No cell available")
        }

        return cell
    }
    
    @objc func selectImageSource() {
        let alertController = UIAlertController(title: "Seleccionar fuente", message: "Elige la fuente de la imagen", preferredStyle: .actionSheet)

        let cameraAction = UIAlertAction(title: "Cámara", style: .default) { _ in
            self.presentImagePicker(sourceType: .camera)
        }

        let libraryAction = UIAlertAction(title: "Biblioteca de Fotos", style: .default) { _ in
            self.presentImagePicker(sourceType: .photoLibrary)
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.isEditing = false
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension FormController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Actualiza el UIImageView en la celda "camaraCell" con la imagen seleccionada
            if let camaraCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CamaraCell {
                camaraCell.imageViewCamara.image = selectedImage
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

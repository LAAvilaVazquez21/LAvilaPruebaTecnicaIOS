

import UIKit

class MainController: UIViewController {
    
    
    @IBOutlet weak var TableMain: UITableView!
    
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var btnOutlet: UIButton!
    
    var selectedRows = [IndexPath]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableMain.delegate = self
        self.TableMain.dataSource = self
        
        self.TableMain.register(UINib(nibName: "OpcionesCell", bundle: .main), forCellReuseIdentifier: "opcionesCell")
        
        viewBackground.layer.cornerRadius = 20
        viewBackground.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectedRows.removeAll()
        TableMain.reloadData()
    }

    
    @IBAction func btnNextViewController(_ sender: Any) {
        
        if selectedRows.isEmpty{
            let alert = UIAlertController(title: "Aviso", message: "Debes seleccionar al menos una opción", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true)
            })
            
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            self.performSegue(withIdentifier: "formSegue", sender: self)
        }
    }
}
// MARK: TableView

extension MainController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.TableMain.dequeueReusableCell(withIdentifier: "opcionesCell", for: indexPath) as! OpcionesCell
        
        if indexPath.row == 0{

            cell.lblOpcion.text = "Camara"
        }

        else if indexPath.row == 1{
            cell.lblOpcion.text = "Foto"
        }

        else if indexPath.row == 2{
            cell.lblOpcion.text = "Nombre Completo"
        }

        else if indexPath.row == 3{
            cell.lblOpcion.text = "Telefono"
        }

        else if indexPath.row == 4{
            cell.lblOpcion.text = "Fecha de Nacimiento"
        }

        else if indexPath.row == 5{
            cell.lblOpcion.text = "Sexo"
        }

        else if indexPath.row == 6{
            cell.lblOpcion.text = "Color Favorito"
        }
        
        cell.btnCheck.tag = indexPath.row
        cell.btnCheck.addTarget(self, action: #selector(CheckboxClicked(_:)), for: .touchUpInside)
        
        
        cell.btnCheck.isSelected = false
        
        if selectedRows.contains(indexPath) {
            cell.btnCheck.isSelected = true
        }

        return cell
                    
    }
    
    @objc func CheckboxClicked(_ sender : UIButton){
        sender.isSelected = !sender.isSelected
        
        let point = sender.convert(CGPoint.zero, to: TableMain)
        let indxPath = TableMain.indexPathForRow(at: point)
        
        if selectedRows.contains(indxPath!) {
            selectedRows.remove(at: selectedRows.firstIndex(of: indxPath!)!)
        } else {
            selectedRows.append(indxPath!)
        }

        TableMain.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        if selectedRows.isEmpty{
            let alert = UIAlertController(title: "Aviso", message: "Debes seleccionar al menos una opción", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true)
            })
            
            alert.addAction(action)
            self.present(alert, animated: true)
            btnOutlet.isEnabled = false
        }
        else{
            btnOutlet.isEnabled = true
        }
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "formSegue"{
            self.selectedRows = self.selectedRows.sorted()
            let formController = segue.destination as! FormController
            formController.selectedRows = self.selectedRows
        }
    }
    
    
}


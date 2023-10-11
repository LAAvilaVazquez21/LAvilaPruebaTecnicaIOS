

import UIKit

class ColorFavoritoCell: UITableViewCell {
    
    weak var controller : FormController?
    
    @IBOutlet weak var tableViewColores: UITableView!
    
    var selectedRows = [IndexPath]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.tableViewColores.delegate = self
        self.tableViewColores.dataSource = self
        
        self.tableViewColores.register(UINib(nibName: "ColorCell", bundle: .main), forCellReuseIdentifier: "colorCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ColorFavoritoCell : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableViewColores.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorCell
        
        if indexPath.row == 0{
            cell.viewColor.backgroundColor = .green
            cell.lblColor.text = "Verde"
        }
        
        if indexPath.row == 1{
            cell.viewColor.backgroundColor = .red
            cell.lblColor.text = "Rojo"
        }
        
        if indexPath.row == 2{
            cell.viewColor.backgroundColor = .blue
            cell.lblColor.text = "Azul"
        }
        
        if indexPath.row == 3{
            cell.viewColor.backgroundColor = .orange
            cell.lblColor.text = "Naranja"
        }
        
        if indexPath.row == 4{
            cell.viewColor.backgroundColor = .yellow
            cell.lblColor.text = "Amarillo"
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
        
        let point = sender.convert(CGPoint.zero, to: tableViewColores)
        let indxPath = tableViewColores.indexPathForRow(at: point)
        
        if selectedRows.contains(indxPath!) {
            if selectedRows.count == 1{
                
                let alert = UIAlertController(title: "Mensaje", message: "Debes seleccionar al menos un color.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                controller?.present(alert, animated: true)
            }
            else{
                selectedRows.remove(at: selectedRows.firstIndex(of: indxPath!)!)
            }
        }
        else {
            selectedRows.append(indxPath!)
        }
        tableViewColores.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        if selectedRows.count == 1{
            sender.isSelected = true
        }
        
    }
    
}


import UIKit

class SexoCell: UITableViewCell {
    
    @IBOutlet weak var tableViewSexo: UITableView!
    
    weak var controller : FormController?
    var selectedRows = [IndexPath]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableViewSexo.delegate = self
        self.tableViewSexo.dataSource = self
        
        self.tableViewSexo.register(UINib(nibName: "GeneroCell", bundle: .main), forCellReuseIdentifier: "generoCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension SexoCell : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableViewSexo.dequeueReusableCell(withIdentifier: "generoCell", for: indexPath) as! GeneroCell
        
        if indexPath.row == 0{
            cell.lblGenero.text = "Masculino"
        }

        else if indexPath.row == 1{
            cell.lblGenero.text = "Femenino"
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
        
        let point = sender.convert(CGPoint.zero, to: tableViewSexo)
        let indxPath = tableViewSexo.indexPathForRow(at: point)
        
        if selectedRows.contains(indxPath!) {
            selectedRows.remove(at: selectedRows.firstIndex(of: indxPath!)!)
        } else {
            selectedRows.append(indxPath!)
        }
        
        tableViewSexo.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        if selectedRows.count > 1{
            
            selectedRows.removeFirst()

            sender.isSelected = false
            self.tableViewSexo.reloadData()
        }
        
    }
    
    
}

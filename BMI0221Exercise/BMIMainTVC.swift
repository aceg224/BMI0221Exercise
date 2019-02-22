//
//  BMIMainTVC.swift
//  BMI0221Exercise
//
//  Created by min-chia on 2019/2/21.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit
extension UITableViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        tableView.endEditing(true)
    }
}
class BMIMainTVC: UITableViewController ,UINavigationControllerDelegate{
    @IBOutlet weak var heightTf: UITextField!
    @IBOutlet weak var weightTf: UITextField!
    @IBOutlet weak var errorLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.tableView.endEditing(true)
//    }
    @IBAction func submitBt(_ sender: Any) {
    }
    
    @IBAction func clearButton(_ sender: Any) {
        heightTf.text = ""
        weightTf.text = ""
        errorLb.text = ""
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let heightBool = (Double(heightTf.text ?? "-1") ?? -1) > 0
        let weightBool = (Double(weightTf.text ?? "-1") ?? -1) > 0
        let bool = heightBool && weightBool
        if !bool {
            errorLb.text = "error input"
        }
        return bool
    }

    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataUrl = fileInDocuments(fileName: "bMIData")
        do {
            let bMIData = try NSKeyedArchiver.archivedData(withRootObject: BMI(height: heightTf.text!, weight: weightTf.text!), requiringSecureCoding: true)
            try bMIData.write(to: dataUrl)
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

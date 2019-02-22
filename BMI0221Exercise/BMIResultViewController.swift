//
//  BMIResultVCViewController.swift
//  BMI0221Exercise
//
//  Created by min-chia on 2019/2/21.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit

class BMIResultViewController: UIViewController {

    @IBOutlet weak var bMIDescriptionLabel: UILabel!
    @IBOutlet weak var bMIValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager()
        let dataUrl = fileInDocuments(fileName: "bMIData")
        if fileManager.fileExists(atPath: dataUrl.path){
            if let data = try? Data(contentsOf: dataUrl) {
                if let bMIData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? BMI {
//                    String(format: "%.1f",bMIData.bMICount.description)
                    bMIValueLabel.text = String(format: "%.1f",bMIData.bMICount)                    
                    bMIDescriptionLabel.text = bMIData.description
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

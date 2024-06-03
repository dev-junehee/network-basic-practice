//
//  UserViewController.swift
//  network-basic
//
//  Created by junehee on 6/3/24.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    
    var userData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userData = userData else { return }
        userLabel.text = "\(userData.name), \(userData.userAge)"
        view.backgroundColor = userData.bgColor
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

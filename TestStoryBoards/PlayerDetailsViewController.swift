//
//  PlayerDetailsViewController.swift
//  TestStoryBoards
//
//  Created by ydd on 2019/10/15.
//  Copyright © 2019 ydd. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    /**
        TableViewCell content选择static cell(静态cell)时cell上的控件可直接连线值控制器作为控制器的属性
     */
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStep: UIStepper!
    
     // 用于页面间逆向传值
    var player :Player?
    
   
    var game: String = "Chess" {
        didSet {
            detailLabel.text = game
        }
    }
    
    required init?(coder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: coder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    // 页面消失是调用，相当于viewWillAppear,
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDeta", let playerName = nameTextField.text {
            // 保存退出页面时调用
            player = Player(Name: playerName, Game: game, Rating: Int(ratingLabel.text!) ?? 1)
        } else if segue.identifier == "PickGame",
            let gamePickerViewController = segue.destination as? GamerPickerViewController {
            // push到新页面时调用
            gamePickerViewController.selectedGame = game
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlayerDetailsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}

extension PlayerDetailsViewController {
    // 逆向传值方法
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamerPickerViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
}

extension PlayerDetailsViewController {
    @IBAction func ratingValueChange(step:UIStepper) {
        ratingLabel.text = String(Int(step.value))
    }
}

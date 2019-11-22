//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Crayon](){
        didSet {
            tableView.reloadData()
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    tableView.dataSource = self
    
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let DetailViewController = segue.destination as? DetailViewController, let _ = tableView.indexPathForSelectedRow else {
            return
        }
        let sendColors = Crayon(name: "color", red: 0.0, green: 0.0, blue: 0.0, hex: "hex")
        DetailViewController.detailColors = sendColors
    }
    
    func loadData() {
        colors = Crayon.allTheCrayons
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let currentColor = colors[indexPath.row]
        
        cell.textLabel?.text = currentColor.name
        cell.detailTextLabel?.text = currentColor.hex
        cell.backgroundColor = UIColor(red: CGFloat(currentColor.red/255), green: CGFloat(currentColor.green/255), blue: CGFloat(currentColor.blue/255), alpha: 1.0)
        return cell
    }
    
}

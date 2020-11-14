//
//  ViewController.swift
//  bnvm,
//
//  Created by MacBook Air on 31.08.2020.
//  Copyright © 2020 VardanMakhsudyan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewViewControllerDelegate {

    @IBOutlet weak var realTableView: UITableView!
    
    var real = [RealModel(name: "Casillas", number: 1, country: "Spain", imageName: "Casillas", image: nil),
                RealModel(name: "Salgado", number: 2, country: "Spain", imageName: "Salgado", image: nil),
                RealModel(name: "Hierro", number: 4, country: "Spain", imageName: "Hierro", image: nil),
                RealModel(name: "Helguera", number: 6, country: "Spain", imageName: "Helguera", image: nil),
                RealModel(name: "R.Carlos", number: 3, country: "Brazil", imageName: "R.Carlos", image: nil),
                RealModel(name: "Zidane", number: 5, country: "France", imageName: "Zidane", image: nil),
                RealModel(name: "Figo", number: 10, country: "Portugal", imageName: "Figo", image: nil),
                RealModel(name: "Beckham", number: 23, country: "England", imageName: "Beckham", image: nil),
                RealModel(name: "Guti", number: 14, country: "Spain", imageName: "Guti", image: nil),
                RealModel(name: "Raul", number: 7, country: "Spian", imageName: "Raul", image: nil),
                RealModel(name: "Ronaldo", number: 11, country: "Brazil", imageName: "Ronaldo", image: nil)]
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realTableView.delegate = self
        realTableView.dataSource = self
        
        do {
            if let path = Bundle.main.path(forResource: "UEFA CHAMPIONS LEAGUE", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            }
        } catch {
            self.player.pause()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return real.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let model = real[indexPath.row]
        cell?.realName.text = model.name
        cell?.realNumber.text = String(model.number)
        cell?.realCountry.text = model.country
        if let imageName = model.imageName {
            cell?.realImage.image = UIImage(named: imageName)
        } else {
            cell?.realImage.image = model.image
        }
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? NewViewController
        vc?.delegate = self
    }
    
    @IBAction func pauseAction(_ sender: UIBarButtonItem) {
        self.player.pause()
    }
    
    @IBAction func playAction(_ sender: UIBarButtonItem) {
        self.player.play()
    }
    
    @IBAction func searchAction(_ sender: UIBarButtonItem) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = real[indexPath.row]
        let deleteAction = UITableViewRowAction.init(style: .default, title: "Delete") { (_, _) in
            if let index = self.real.firstIndex(where: { (model) -> Bool in
                delete.name == model.name
            }) {
                self.real.remove(at: index)
                self.realTableView.deleteRows(at: [indexPath], with: .automatic)
                
            }
        }
        return [deleteAction]
    }
    
    func newViewController(vc: NewViewController, didAddModel model: RealModel) {
        real.append(model)
        realTableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

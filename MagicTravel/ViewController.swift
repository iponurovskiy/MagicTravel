//
//  ViewController.swift
//  MagicTravel
//
//  Created by Ivan on 07.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var citiesTableView: UITableView!
    
    var cities = ["Paris",
                  "Prague",
                  "Tokyo",
                  "Amsterdam",
                  "Bangkok",
                  "Rio de Janeiro",
                  "Reykjavik",
                  "New York",
                  "Beijing",
                  "Oslo"]
    
    var CountryCity: [String: String] = ["Paris":"France",
                                         "Prague":"Czech",
                                         "Tokyo":"Japan",
                                         "Amsterdam":"Netherlands",
                                         "Bangkok":"Thailand",
                                         "Rio de Janeiro":"Brazil",
                                         "Reykjavik":"Iceland",
                                         "New York":"USA",
                                         "Beijing":"China",
                                         "Oslo":"Norway"]
    
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfig = tableViewCell.defaultContentConfiguration()
        
        let cityName = cities[indexPath.row]
        cellContentConfig.text = cityName
        cellContentConfig.secondaryText = CountryCity[cityName] ?? ""
        
        tableViewCell.contentConfiguration = cellContentConfig
        
        return tableViewCell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cities[indexPath.row]
        let countryName = CountryCity[cityName] ?? ""
        print("user tapped on cell with \(cityName) (\(countryName))")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

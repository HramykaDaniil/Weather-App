//
//  WeatherViewController.swift
//  Weather App
//
//  Created by Daniil on 30.10.22.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Weather View
    
    // create current weather view
    private let currentWeatherView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //view.backgroundColor = .red
        
        return view
    }()
    
    // create image weather view
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.backgroundColor = .gray
        
        return imageView
    }()

    // create weather type label
    private let weatherTypeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .red
        label.text = "Cloudy"
        
        return label
    }()
    
    // create current location label
    private let currentLocationLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .red
        label.text = "Minsk, Belarus"
        
        return label
    }()
    
    // create current temperature label
    private let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .red
        label.text = "12 C"
        
        return label
    }()
    
    // MARK: Weather Table View
    
    // create table view
    
    lazy var weatherTableView: UITableView = {
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.backgroundColor = .white
        
        table.delegate = self
        table.dataSource = self
        
        table.register(<#T##UINib?#>, forCellReuseIdentifier: "cellID")
        
        return table
    }()
    
    // MARK: View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create current weather view
        currentWeatherView.addSubview(weatherImageView)
        currentWeatherView.addSubview(weatherTypeLabel)
        currentWeatherView.addSubview(currentLocationLabel)
        currentWeatherView.addSubview(currentTemperatureLabel)
        
        view.addSubview(currentWeatherView)
        
        setUpAutoLayout()
    }
    
    // MARK: Methods
    
    // create auto layout method
    private func setUpAutoLayout() {
        
        // MARK: WeatherView Layout
        
        // currentWeatherView
        currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        currentWeatherView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        currentWeatherView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        currentWeatherView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        
        // weatherImageView (anytime equal currentWeatherView)
        weatherImageView.topAnchor.constraint(equalTo: currentWeatherView.topAnchor).isActive = true
        weatherImageView.leftAnchor.constraint(equalTo: currentWeatherView.leftAnchor).isActive = true
        weatherImageView.rightAnchor.constraint(equalTo: currentWeatherView.rightAnchor).isActive = true
        weatherImageView.heightAnchor.constraint(equalTo: currentWeatherView.heightAnchor).isActive = true
        
        // weatherTypeLabel
        weatherTypeLabel.centerXAnchor.constraint(equalTo: weatherImageView.centerXAnchor).isActive = true
        weatherTypeLabel.bottomAnchor.constraint(equalTo: currentLocationLabel.topAnchor).isActive = true
        
        // currentLocationLabel
        currentLocationLabel.centerXAnchor.constraint(equalTo: weatherImageView.centerXAnchor).isActive = true
        currentLocationLabel.bottomAnchor.constraint(equalTo: currentTemperatureLabel.topAnchor).isActive = true
        
        // currentTemperatureLabel
        currentTemperatureLabel.centerXAnchor.constraint(equalTo: weatherImageView.centerXAnchor).isActive = true
        currentTemperatureLabel.centerYAnchor.constraint(equalTo: weatherImageView.centerYAnchor).isActive = true
        
        // MARK: WeatherTable Layout
        
        // weatherTableView
        
        weatherTableView.topAnchor.constraint(equalTo: currentWeatherView.bottomAnchor).isActive = true
        weatherTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    // MARK: Cell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        return cell
    }
    
}

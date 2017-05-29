//
//  WeatherVC.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    let client = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrWeather()
    }
    
    @IBAction func getCurrWeather() {
        
        toggleRefreshAnimation(on: true)
        
        let location = Location(latitude: 33.8650, longitude: 151.2094)
        // to avoid reference cycle
        client.getWeather(at: location) { [unowned self] (currentWeather, error) in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on : false)
            }
        }
    }
    
    func toggleRefreshAnimation(on : Bool){
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    
    func displayWeather(using weather: CurrentWeatherViewModel){
        self.currentTemperatureLabel.text = weather.temperatute
        self.currentHumidityLabel.text = weather.humidity
        self.currentPrecipitationLabel.text = weather.precipitationProb
        self.currentWeatherIcon.image = weather.icon
        self.currentSummaryLabel.text = weather.summary
    }

}

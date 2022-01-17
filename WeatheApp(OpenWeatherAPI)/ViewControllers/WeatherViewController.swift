//
//  ViewController.swift
//  WeatheApp(OpenWeatherAPI)
//
//  Created by mogggiii on 13.01.2022.
//

import UIKit

class WeatherViewController: UIViewController {
	@IBOutlet weak var weatherIconImageView: UIImageView!
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var feelsLikeLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!

	private let networkWeatherManager = NetworkWeatherManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
	}

	@IBAction func searchPressed(_ sender: UIButton) {
		self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
			self.networkWeatherManager.fetchCurrentWeather(forCity: city)
		}
	}

}


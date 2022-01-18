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
	
	var networkWeatherManager = NetworkWeatherManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		networkWeatherManager.onCompletion = { [weak self] currentWeather in
			guard let self = self else { return }
			self.updateUI(weather: currentWeather)
		}
		networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
	}
	
	@IBAction func searchPressed(_ sender: UIButton) {
		self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
			self.networkWeatherManager.fetchCurrentWeather(forCity: city)
		}
	}
	
	private func updateUI(weather: CurrentWeather) {
		DispatchQueue.main.async {
			self.cityLabel.text = weather.cityName
			self.temperatureLabel.text = weather.temperatureString
			self.feelsLikeLabel.text = weather.feelsLiketemperatureString
			self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
		}
	}
}


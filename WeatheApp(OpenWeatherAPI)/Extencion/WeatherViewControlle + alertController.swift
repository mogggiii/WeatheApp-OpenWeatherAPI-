//
//  WeatherViewControlle + alertController.swift
//  WeatheApp(OpenWeatherAPI)
//
//  Created by mogggiii on 13.01.2022.
//

import UIKit

extension WeatherViewController {
	func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
		alertController.addTextField { textField in
			let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
			textField.placeholder = cities.randomElement()
		}
		let search = UIAlertAction(title: "Search", style: .default) { action in
			let textField = alertController.textFields?.first
			guard let cityName = textField?.text else { return }
			if cityName != "" {
				print("search info for the \(cityName)")
			}
		}
		let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		
		alertController.addAction(search)
		alertController.addAction(cancel)
		present(alertController, animated: true, completion: nil)
	}
}

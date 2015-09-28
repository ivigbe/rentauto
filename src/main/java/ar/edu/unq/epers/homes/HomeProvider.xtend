package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto

class HomeProvider {
	
	def static getAutoHome() {
		new GenericHome(Auto)
	}
	
}
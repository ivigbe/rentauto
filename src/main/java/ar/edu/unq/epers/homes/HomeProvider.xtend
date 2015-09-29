package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion

class HomeProvider {

	def static getAutoHome() {
		new GenericHome(Auto)
	}

	def static getCategoriaHome() {
		new GenericHome(Categoria)
	}

	def static getUbicacionHome() {
		new GenericHome(Ubicacion)
	}
}
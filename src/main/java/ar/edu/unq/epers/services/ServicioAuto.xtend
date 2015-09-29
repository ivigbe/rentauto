package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Auto

class ServicioAuto {

	GenericHome<Auto> home

	new(GenericHome<Auto> h) {
		home = h
	}

	def void crearAuto(Auto auto) {
		SessionManager.runInSession([
			home.save(auto)
		])
	}

	def getAutoPorId(int id) {
		SessionManager.runInSession [
			home.get(id)
		]
	}
}
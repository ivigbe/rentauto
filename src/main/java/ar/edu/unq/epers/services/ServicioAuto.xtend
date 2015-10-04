package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.model.Categoria

class ServicioAuto {

	GenericHome<Auto> home

	new(GenericHome<Auto> h) {
		home = h
	}

	def void guardarAuto(Auto auto) {
		SessionManager.runInSession([
			home.save(auto)
		])
	}

	def getAutoPorId(int id) {
		SessionManager.runInSession [
			home.get(id)
		]
	}
	
	def autosPorUbicacion(Ubicacion uOrigen)
	{
		SessionManager.runInSession[|
			
			home.getAutosPorUbicacion(uOrigen)
		]
	}
	
	def autosPorCategoria(Categoria c)
	{
		SessionManager.runInSession[|
			
			home.getAutosPorCategoria(c)
		]
	}

}
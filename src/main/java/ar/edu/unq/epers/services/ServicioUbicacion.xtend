package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.homes.SessionManager

class ServicioUbicacion {
	
	GenericHome<Ubicacion> home
	
	new(GenericHome<Ubicacion> h)
	{
		this.home = h
	}
	
	def void guardarUbicacion(Ubicacion u)
	{
		SessionManager.runInSession[|
			
			home.save(u)
		]
	}
	
	def getUbicacionPorId(int id)
	{
		SessionManager.runInSession[|
			
			home.get(id)
		]
	}
}
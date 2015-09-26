package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Ubicacion

class HomeUbicacion {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(Ubicacion) ,id) as Ubicacion
	}
	
	def save(Ubicacion u) {
		SessionManager.getSession().saveOrUpdate(u)
	}
}
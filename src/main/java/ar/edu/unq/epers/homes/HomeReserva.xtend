package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Reserva

class HomeReserva {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(Reserva) ,id) as Reserva
	}
	
	def save(Reserva r) {
		SessionManager.getSession().saveOrUpdate(r)
	}
}
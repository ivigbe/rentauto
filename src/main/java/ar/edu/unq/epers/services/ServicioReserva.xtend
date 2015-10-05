package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.homes.SessionManager

class ServicioReserva {
	
	GenericHome<Reserva> home
	
	new(GenericHome<Reserva> h) {
		home = h
	}
	
	def void guardarReserva(Reserva r) {
		SessionManager.runInSession([
			home.save(r)
		])
	}
	
	def getReservaPorId(int id)
	{
		SessionManager.runInSession[
			home.get(id)
		]
	}
	
	def hacerReserva(Reserva r)
	{
		SessionManager.runInSession[|
			
			r.reservar()
			home.save(r)
		]
	}
}
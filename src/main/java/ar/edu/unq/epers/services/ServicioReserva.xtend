package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeReserva
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Reserva

class ServicioReserva {
	
	HomeReserva home
	
	new(HomeReserva h) {
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
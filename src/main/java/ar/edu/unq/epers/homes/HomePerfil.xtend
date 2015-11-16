package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.services.ServicioReserva
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class HomePerfil {
	
	HomeReserva homeReserva
	ServicioReserva serviceReserva = new ServicioReserva(homeReserva)

	new(){}

	def calificar(Reserva r, Usuario u) {
		
		
	}

}
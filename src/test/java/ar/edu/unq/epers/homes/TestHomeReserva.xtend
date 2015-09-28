package ar.edu.unq.epers.homes

import org.junit.Before
import org.junit.Test
import ar.edu.unq.epers.model.Reserva
import static org.mockito.Mockito.*
import static org.junit.Assert.*

class TestHomeReserva {
	
	Reserva reserva

	@Before
	def void setUp() {
		this.reserva = new Reserva()
	}

}
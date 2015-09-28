package ar.edu.unq.epers.homes

import org.junit.Before
import org.junit.Test
import ar.edu.unq.epers.model.Reserva
import static org.mockito.Mockito.*

class TestHomeReserva {

	HomeReserva home
	Reserva reserva

	@Before
	def void setUp() {
		this.home = new HomeReserva()
		this.reserva = new Reserva()
	}

	@Test
	def void testObtengoUnaReservaPorNumeroDeSolicitud() {
		this.home.getReservaPorNumeroSolicitud(1)
		assertTrue(this.reserva.numeroSolicitud, 1)
	}

}
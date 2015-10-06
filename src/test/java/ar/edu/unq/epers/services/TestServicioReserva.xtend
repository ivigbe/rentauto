package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeReserva
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Deportivo
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.model.Usuario
import java.util.Date
import org.junit.After
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestServicioReserva {

	HomeReserva home
	ServicioReserva s
	Reserva r
	Ubicacion uOrigen
	Ubicacion uDestino
	Date ini
	Date fechaFin
	Auto a
	Usuario u
	Categoria c

	@Before
	def void setUp() {
		home = new HomeReserva()

		uOrigen = new Ubicacion("Quilmes")
		uDestino = new Ubicacion("Puerto Madero")
		ini = new Date()
		fechaFin = new Date()
		u = new Usuario()
		c = new Deportivo()
		a = new Auto("Mazda", "RX", 2009, "xxx123", c, 120000.0, uOrigen)

		r = new Reserva(1, uOrigen, uDestino, ini, fechaFin, a, u)

		s = new ServicioReserva(home)
		
	
		s.guardarReserva(r)
		s.hacerReserva(r)
	}

	@Test
	def void testGuardarReserva() {

		val res = s.getReservaPorId(r.reservaId)
		assertTrue(res.reservaId == r.reservaId)
	}
	@Test
	def void testHacerReserva() {
		assertTrue(a.reservas.contains(r))
	}


	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}

}
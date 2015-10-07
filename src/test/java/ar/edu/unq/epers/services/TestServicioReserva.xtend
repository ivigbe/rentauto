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
	ServicioReserva serviceReserva
	Reserva unaReserva
	Ubicacion uOrigen
	Ubicacion uDestino
	Date finicio
	Date fechaFin
	Auto auto 
	Usuario usuario
	Categoria cateroriaVehiculo

	@Before
	def void setUp() {
		home = new HomeReserva()

		uOrigen = new Ubicacion("Quilmes")
		uDestino = new Ubicacion("Puerto Madero")
		finicio = new Date()
		fechaFin = new Date()
		usuario = new Usuario()
		cateroriaVehiculo = new Deportivo()
		auto = new Auto("Mazda", "RX", 2009, "xxx123", cateroriaVehiculo, 120000.0, uOrigen)

		unaReserva = new Reserva(1, uOrigen, uDestino, finicio, fechaFin, auto, usuario)

		serviceReserva = new ServicioReserva(home)
		
	
		serviceReserva.guardarReserva(unaReserva)
		serviceReserva.hacerReserva(unaReserva)
	}

	@Test
	def void testGuardarReserva() {

		val res = serviceReserva.getReservaPorId(unaReserva.reservaId)
		assertTrue(res.reservaId == unaReserva.reservaId)
	}
	@Test
	def void testHacerReserva() {
		assertTrue(auto.reservas.contains(unaReserva))
	}


	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}

}
package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Reserva
import org.junit.Before
import static org.junit.Assert.*
import ar.edu.unq.epers.homes.HomeProvider
import org.junit.Test
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.IUsuario
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Deportivo
import org.junit.After
import ar.edu.unq.epers.homes.SessionManager

class TestServicioReserva {

	GenericHome<Reserva> home
	ServicioReserva s
	Reserva r
	Ubicacion origen
	Ubicacion destino
	Date inicio
	Date fin
	Auto a
	IUsuario i
	Categoria c

	@Before
	def void setUp() {
		home = HomeProvider.reservaHome
		
		origen = new Ubicacion("Quilmes")
		destino = new Ubicacion("Puerto Madero")
		inicio = new Date()
		fin = new Date()
		c = new Deportivo()
		a = new Auto("Mazda", "RX", 2009, "xxx123", c, 120000.0, origen)
		
		r = new Reserva()
		r.numeroSolicitud = 1
		r.origen = origen
		r.destino = destino
		r.inicio = inicio
		r.fin = fin
		r.auto = a
		r.usuario = i
		
		s = new ServicioReserva(home)
		
		s.crearReserva(r)
	}

	@Test
	def void testCrearReserva() {
		assertEquals(s.getReservaPorId(r.reservaId), r)
	}
	
	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
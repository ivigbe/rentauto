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
	Ubicacion uOrigen
	Ubicacion uDestino
	Date ini
	Date fechaFin
	Auto a
	IUsuario i
	Categoria c

	@Before
	def void setUp() {
		home = HomeProvider.reservaHome
		
		uOrigen = new Ubicacion("Quilmes")
		uDestino = new Ubicacion("Puerto Madero")
		ini = new Date()
		fechaFin = new Date()
		c = new Deportivo()
		a = new Auto("Mazda", "RX", 2009, "xxx123", c, 120000.0, uOrigen)
		
		r = new Reserva(1,uOrigen,uDestino,ini,fechaFin,a,i)
			
		
		a.agregarReserva(r)
		
		s = new ServicioReserva(home)
		
		s.guardarReserva(r)
	}

	@Test
	def void testGuardarReserva() {
	//assertEquals(s.getReservaPorId(r.reservaId), r)
	
	val res = s.getReservaPorId(r.reservaId)
	assertTrue(res.reservaId == r.reservaId)
	}
	
	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
 
 }

}
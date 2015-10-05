package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Ubicacion
import org.junit.Before
import ar.edu.unq.epers.homes.HomeProvider
import org.junit.Test
import static org.junit.Assert.*
import org.junit.After
import ar.edu.unq.epers.homes.SessionManager

class TestServicioUbicacion {
	
	GenericHome<Ubicacion> home
	Ubicacion u
	ServicioUbicacion s
	
	@Before
	def void setUp()
	{
		home = HomeProvider.ubicacionHome
		u = new Ubicacion("Neuquen")
		s = new ServicioUbicacion(home)
		
		s.guardarUbicacion(u)
	}
	
	@Test
	def void testGuardoUnaUbicacion()
	{
		val res = s.getUbicacionPorId(u.ubicacionId)
		assertTrue(res.ubicacionId == u.ubicacionId)
	}
	
	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
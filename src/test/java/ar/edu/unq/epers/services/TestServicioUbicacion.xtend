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
	Ubicacion ubicacion
	ServicioUbicacion serviceHome
	
	@Before
	def void setUp()
	{
		home = HomeProvider.ubicacionHome
		ubicacion = new Ubicacion("Neuquen")
		serviceHome = new ServicioUbicacion(home)
		
		serviceHome.guardarUbicacion(ubicacion)
	}
	
	@Test
	def void testGuardoUnaUbicacion()
	{
		val res = serviceHome.getUbicacionPorId(ubicacion.ubicacionId)
		assertTrue(res.ubicacionId == ubicacion.ubicacionId)
	}
	
	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
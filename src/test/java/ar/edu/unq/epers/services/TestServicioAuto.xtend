package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.homes.HomeProvider
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Turismo
import ar.edu.unq.epers.model.Ubicacion
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.junit.After
import ar.edu.unq.epers.homes.SessionManager

class TestServicioAuto {

	GenericHome<Auto> home
	ServicioAuto s
	Categoria c = new Turismo
	Ubicacion uInicial = new Ubicacion("Capital")
	Auto auto

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		auto = new Auto("Ford", "Focus", 2010, "xls500", c, 15000.0, uInicial)
		s = new ServicioAuto(home)

		s.guardarAuto(auto)
	}

	@Test
	def void testGuardarAuto() {
		assertTrue(s.getAutoPorId(auto.autoId) == auto)
	}
	
	@Test
	def void testObtengoAutosPorUbicacion()
	{
		val autosPorUbicacion = s.autosPorUbicacion(uInicial)
		assertTrue(autosPorUbicacion.size() == 1)
	}
	
	@Test def void testObtengoAutosPorCategoria()
	{
		val autosPorCategoria = s.autosPorCategoria(c)
		assertTrue(autosPorCategoria.size() == 1)
	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
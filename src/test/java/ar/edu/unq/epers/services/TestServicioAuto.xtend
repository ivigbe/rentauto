package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Auto
import org.junit.Before
import ar.edu.unq.epers.homes.HomeProvider
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion

class TestServicioAuto {
	
	GenericHome<Auto> home
	ServicioAuto s
	Categoria c
	Ubicacion uInicial
	
	@Before
	def void setUp()
	{
		home = HomeProvider.autoHome
		s = new ServicioAuto(home)
		s.crearAuto("Ford", "Focus", 2010, "xls500", c, 15000.0, uInicial, 1)
	}
	
	@Test
	def void testCrearAuto()
	{
		assertEquals(s.getAutoPorId(1), "xls500")
	}
}
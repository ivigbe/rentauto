package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Auto
import org.junit.Before
import ar.edu.unq.epers.homes.HomeProvider
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.model.Turismo

class TestServicioAuto {
	
	GenericHome<Auto> homeAuto
	GenericHome<Categoria> homeCat
	GenericHome<Ubicacion> homeUbi
	ServicioAuto s
	Categoria c
	Ubicacion uInicial
	
	@Before
	def void setUp()
	{
		homeAuto = HomeProvider.autoHome
		homeCat = HomeProvider.categoriaHome
		homeUbi = HomeProvider.ubicacionHome
		c = new Turismo()
		uInicial = new Ubicacion("Retiro")
		s = new ServicioAuto(homeAuto, homeCat, homeUbi)
		s.crearAuto("Ford", "Focus", 2010, "xls500", c, 15000.0, uInicial, 1)
	}
	
	@Test
	def void testCrearAuto()
	{
		assertEquals(s.getAutoPorId(1), "xls500")
	}
}
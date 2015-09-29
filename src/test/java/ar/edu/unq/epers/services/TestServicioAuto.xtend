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

class TestServicioAuto {

	GenericHome<Auto> home
	GenericHome<Categoria> home2
	GenericHome<Ubicacion> home3
	ServicioAuto s
	Categoria c = new Turismo
	Ubicacion uInicial = new Ubicacion("Capital")
	Auto auto

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		home2 = HomeProvider.categoria
		home3 = HomeProvider.ubicacion
		auto = new Auto("Ford", "Focus", 2010, "xls500",c , 15000.0, uInicial)
		s = new ServicioAuto(home)

		s.crearAuto(auto)
	}

	@Test
	def void testCrearAuto() {
		assertEquals(s.getAutoPorId(auto.autoId),  auto)
	}
}
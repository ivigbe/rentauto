package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import org.junit.Before

import static org.mockito.Mockito.*

class TestHomeAuto {

	Auto a
	GenericHome<Auto> home
	Categoria c
	Ubicacion u

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		c = mock(Categoria)
		when(c.nombre).thenReturn("Familiar")
		u = mock(Ubicacion)
		when(u.nombre).thenReturn("Retiro")
		//a = new Auto("Kia", "H5", 2009, "xls550", c, 15000.0, u ,1)
	}
}
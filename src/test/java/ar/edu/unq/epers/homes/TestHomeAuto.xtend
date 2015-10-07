package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import org.junit.Before

import static org.mockito.Mockito.*

class TestHomeAuto {

	Auto auto
	GenericHome<Auto> home
	Categoria categoriaVehiculo
	Ubicacion ubicacion

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		categoriaVehiculo = mock(Categoria)
		when(categoriaVehiculo.nombre).thenReturn("Familiar")
		ubicacion = mock(Ubicacion)
		when(ubicacion.nombre).thenReturn("Retiro")
		auto = new Auto("Kia", "H5", 2009, "xls550", categoriaVehiculo, 15000.0, ubicacion)
	}
}
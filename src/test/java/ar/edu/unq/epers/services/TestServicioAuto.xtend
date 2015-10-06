package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeAuto
import ar.edu.unq.epers.homes.HomeProvider
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Turismo
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import org.junit.After
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.model.Usuario

class TestServicioAuto {

	HomeAuto home
	ServicioAuto s
	Categoria c = new Turismo
	Ubicacion uInicial = new Ubicacion("Capital")
	Ubicacion uDestino = new Ubicacion("Villa 31")
	Auto auto1
	Date fechaReservaInicio
	Date fechaReservaFin
	Reserva r
	Usuario u = new Usuario()
	Auto auto2 = new Auto("Fiat", "Uno", 2011, "tle189", c, 60000.0, uInicial)

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		auto1 = new Auto("Ford", "Focus", 2010, "xls500", c, 15000.0, uInicial)
		fechaReservaInicio = new Date(2015, 20, 5)
		fechaReservaFin = new Date(2015, 20, 6)
		r = new Reserva(2, uInicial, uDestino, fechaReservaInicio, fechaReservaFin, auto2, u)

		auto2.agregarReserva(r)

		s = new ServicioAuto(home)

		s.guardarAuto(auto1)
		s.guardarAuto(auto2)
	}

	@Test
	def void testGuardarAuto() {
		assertTrue(s.getAutoPorId(auto1.autoId) == auto1)
	}

	@Test
	def void testObtengoAutosPorUbicacion() {
		val autosPorUbicacion = s.autosPorUbicacion(uInicial)
		assertTrue(autosPorUbicacion.size == 1)
	}

	@Test
	def void testObtengoAutosPorCategoria() {
		val autosPorCategoria = s.autosPorCategoria(c)
		assertTrue(autosPorCategoria.size == 1)
	}

	@Test
	def void testObtengoAutosPorMarca() {
		val autosPorMarca = s.autosPorMarca(auto1.marca)
		assertTrue(autosPorMarca.size == 1)
	}

	@Test
	def void testAutosDisponiblesParaReserva() {
		val disponibles = s.disponibilidadDeAutos(uInicial, fechaReservaInicio, fechaReservaFin)
		assertTrue(disponibles.size == 1)
	}

	@Test
	def void testAutosConReservaDisponibles() {
		val disponibles = s.disponibilidadDeAutos(uDestino, fechaReservaInicio, fechaReservaFin)
		assertTrue(disponibles.size() == 0)
	}

	@Test
	def void sdfsdfdfsd() {
		val disponibles = s.obtenerAutosPor(uInicial, uDestino, new Date(2015, 22, 6), new Date(2015, 30, 6), c)
		assertTrue(disponibles.size() == 1)
		assertTrue(disponibles.contains(auto1))
	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
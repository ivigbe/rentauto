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
	ServicioAuto serviceAuto
	Categoria categoriaVehiculo = new Turismo()
	Ubicacion uInicial = new Ubicacion("Capital")
	Ubicacion uDestino = new Ubicacion("Villa 31")
	Auto auto1 = new Auto("Ford", "Focus", 2010, "xls500", categoriaVehiculo, 15000.0, uInicial)
	Date fechaReservaInicio
	Date fechaReservaFin
	Reserva unaReserva
	Usuario unUsuario = new Usuario()
	Auto auto2 = new Auto("Fiat", "Uno", 2011, "tle189", categoriaVehiculo, 60000.0, uInicial)

	@Before
	def void setUp() {
		home = HomeProvider.autoHome
		fechaReservaInicio = new Date(2015, 20, 5)
		fechaReservaFin = new Date(2015, 20, 6)
		unaReserva = new Reserva(2, uInicial, uDestino, fechaReservaInicio, fechaReservaFin, auto2, unUsuario)

		auto2.agregarReserva(unaReserva)
		
		serviceAuto = new ServicioAuto(home)

		serviceAuto.guardarAuto(auto1)
		serviceAuto.guardarAuto(auto2)
	}

	@Test
	def void testGuardarAuto() {
		assertTrue(serviceAuto.getAutoPorId(auto2.autoId) == auto2)
	}

	@Test
	def void testObtengoAutosPorUbicacion() {
		val autosPorUbicacion = serviceAuto.autosPorUbicacion(uInicial)
		assertTrue(autosPorUbicacion.size == 1)
	}

	@Test
	def void testObtengoAutosPorCategoria() {
		val autosPorCategoria = serviceAuto.autosPorCategoria(categoriaVehiculo)
		assertTrue(autosPorCategoria.size == 2)
	}

	@Test
	def void testObtengoAutosPorMarca() {
		val autosPorMarca = serviceAuto.autosPorMarca(auto1.marca)
		assertTrue(autosPorMarca.size == 1)
	}

	@Test
	def void testAutosDisponiblesParaReserva() {
		val disponibles = serviceAuto.disponibilidadDeAutos(uInicial, fechaReservaInicio, fechaReservaFin)
		assertTrue(disponibles.size == 1)
	}

	@Test
	def void testAutosConReservaDisponibles() {
		val disponibles = serviceAuto.disponibilidadDeAutos(uDestino, fechaReservaInicio, fechaReservaFin)
		assertTrue(disponibles.size() == 0)
	}

	@Test
	def void testParaSaberPor() {
		val disponibles = serviceAuto.obtenerAutosPor(uInicial, uDestino, new Date(2015, 22, 6), new Date(2015, 30, 6), categoriaVehiculo)
		assertTrue(disponibles.size() == 1)
		assertTrue(disponibles.contains(auto1))
	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
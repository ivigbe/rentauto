package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeAuto
import ar.edu.unq.epers.homes.HomeCache
import ar.edu.unq.epers.homes.HomeProvider
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Turismo
import ar.edu.unq.epers.model.Ubicacion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.Date
import org.junit.After

class TestServicioCache {
	
	ServicioCache serviceCache
	HomeCache homeCache
	ServicioAuto serviceAuto
	HomeAuto homeAuto
	Categoria categoriaVehiculo = new Turismo()
	Ubicacion capital = new Ubicacion("Capital")
	Ubicacion quilmes = new Ubicacion("Quilmes")
	Auto mazda = new Auto("Ford", "Focus", 2010, "xls500", categoriaVehiculo, 15000.0, capital)
	Auto fiatCacheado = new Auto("Fiat", "Fire", 2010, "igu500", categoriaVehiculo, 20000.0, quilmes)
	Date fechaIni = new Date(2015, 20, 5)
	Date fechaFin = new Date(2015, 30, 5)
	
	@Before
	def setUp(){
		
		homeAuto = HomeProvider.autoHome
		
		serviceAuto = new ServicioAuto(homeAuto)
		
		homeCache = new HomeCache()
		
		serviceCache = new ServicioCache(homeCache)
		
		serviceAuto.guardarAuto(fiatCacheado)
	}
	
	@Test
	def testAutosNoCacheadosSeGuardanEnCache(){
		val autosDisponibles = serviceCache.obtenerAutosDisponibles(capital, fechaIni, fechaFin)
		
		assertTrue(autosDisponibles.idDeAutosDisponibles.size == 1)
	}
	
	@After
	def eliminarTablas() {
		homeCache.getManagerCassandra.eliminarTablas()
	}
}
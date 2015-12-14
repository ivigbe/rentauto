package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeCache
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.epers.model.BusquedaPorCache

@Accessors
class ServicioCache {
	
	HomeCache home
	
	new(){}
	
	new(HomeCache h){
		
		this.home = h
	}
	
	def estaEnCache(Ubicacion u, Date fechaIni, Date fechaFin){
		true
	}
	
	def guardarAutosDisponibles(List<Integer> autos, Ubicacion ubic, Date fechaIni, Date fechaFin){
		val autoACachear= new BusquedaPorCache()
		autoACachear.idDeAutosDisponibles = autos
		autoACachear.ubicacion = ubic
		autoACachear.fechaInicio = fechaIni
		autoACachear.fechaFin = fechaFin
		home.save(autoACachear)
	}
	
	def obtenerAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){
		home.getAutosDisponibles(ubicacion, fechaInicio, fechaFin)
	}
	
	def actualizarCache(Integer id, Ubicacion ubi, Date fechaInicio, Date fechaFin){
		
		home.updateAutosDisponibles(id, ubi, fechaInicio, fechaFin)
	}
}
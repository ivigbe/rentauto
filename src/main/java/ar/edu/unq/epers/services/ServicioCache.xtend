package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeCache
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import ar.edu.unq.epers.model.Auto
import java.util.List

@Accessors
class ServicioCache {
	
	HomeCache home
	
	new(){}
	
	new(HomeCache h){
		
		this.home = h
	}
	
	def estaEnCache(Ubicacion u, Date fechaIni, Date fechaFin){
		
		return true
	}
	
	def guardarAutosDisponibles(List<Auto> autos, Ubicacion ubic, Date fechaIni, Date fechaFin){
		
		val 
		home.save(autoCacheado)
	}
	
	def obtenerAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){
		
		home.getAutosDisponibles(ubicacion, fechaInicio, fechaFin)
	}
}
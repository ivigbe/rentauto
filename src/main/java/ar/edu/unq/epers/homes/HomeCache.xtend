package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.CacheSystem
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class HomeCache {
	
	private ManagerCassandra managerCassandra
	
	new(){
	}
	
	def void save(CacheSystem cache) {
		
		managerCassandra.mapper.save(cache)
	}
	
	def CacheSystem getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){ 
		
		managerCassandra.mapper.get(ubicacion.toString(), fechaInicio.toString(), fechaFin.toString())
	}
	
	def updateAutosDisponibles(Ubicacion ubi, Date fechaIni, Date fechaFin){
		
		val res = managerCassandra.session.execute("UPDATE simplex.CacheSystem SET ubicacion =:ubi fechaInicio = :fechaIni fechaFin = :fechaFin WHERE algo") //MODIFICAR
		
		res.toList ///VER
	}
	
}
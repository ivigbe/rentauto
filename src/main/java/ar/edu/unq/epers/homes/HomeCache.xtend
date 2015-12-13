package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.CacheSystem
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import java.util.List
import javax.persistence.EntityManager
import javax.persistence.EntityManagerFactory
import javax.persistence.Persistence
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class HomeCache {
	
	private ManagerCassandra managercassandra
	
	new(){}
	
	def void save(CacheSystem cache) {
		
	}
	
	def List<CacheSystem> findByUbication(Ubicacion ubi) {
		
	}
	
	def List<CacheSystem> getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){ 
		
		
	}
	
}
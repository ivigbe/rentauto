package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Ubicacion
import java.util.List
import org.easycassandra.persistence.cassandra.Persistence
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.epers.model.CacheSystem
import java.util.Date

@Accessors
class HomeCache {
	
	private Persistence manager
	
	new(){
		this.manager = CassandraManager.INSTANCE.getPersistence();
	}
	
	def void save(CacheSystem cache) {
		manager.insert(cache);
	}
	
	def void saveAutosDisponibles(List<Auto> autos) {
		
		manager.insert(autos);
	}
	
	def List<Auto> findByUbication(Ubicacion ubi) {
		return manager.findByIndex("ubicacion", ubi, Auto)
	}
	
	def Auto findOne(Ubicacion ubi) {
		return manager.findByKey(ubi, Auto);
	}
	
	def getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){
		
		
	}
}
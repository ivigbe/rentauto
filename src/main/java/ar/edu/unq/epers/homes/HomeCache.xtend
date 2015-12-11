package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.CacheSystem
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.datastax.driver.core.Session

@Accessors
class HomeCache {
	
	//private Persistence manager
	private Session sesion;
	new(){
		//this.manager = CassandraManager.persistence
	}
	
	def void save(CacheSystem cache) {
		//manager.insert(cache);
	}
	
	def List<Integer> findByUbication(Ubicacion ubi) {
		//return manager.findByIndex("ubicacion", ubi, Integer)
		//return manager.findByIndex("ubicacion",ubi,Integer)
	}
	
	def Auto findCompuesto(Ubicacion ubi, Date fechaIni, Date fechaFin) {
		//val rs = sesion.execute('''select value from''');
	}
	
	def getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){
		
		
	}
}
package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.BusquedaPorCache
import ar.edu.unq.epers.model.Ubicacion
import com.datastax.driver.core.querybuilder.QueryBuilder
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class HomeCache {
	
	private ManagerCassandra managerCassandra
	
	new(){
	}
	
	def void save(BusquedaPorCache cache) {
		
		managerCassandra.mapper.save(cache)
	}
	
	def BusquedaPorCache getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){ 
		
		managerCassandra.mapper.get(ubicacion, fechaInicio, fechaFin)
	}
	
	def updateAutosDisponibles(Integer id, Ubicacion ubi, Date fechaIni, Date fechaFin){
		
		val delete = QueryBuilder.delete().from("BusquedaPorCache")
				.where(QueryBuilder.eq("autoId", id))
				.and(QueryBuilder.eq("ubicacion", ubi))
				.and(QueryBuilder.eq("fechaInicio", fechaIni))
				.and(QueryBuilder.eq("fechaFin", fechaFin))
		managerCassandra.session.execute(delete)
	}
	
}
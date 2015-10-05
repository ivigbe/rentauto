package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Ubicacion
import java.util.List
import ar.edu.unq.epers.model.Categoria
import java.util.Date

class HomeAuto<Auto> extends GenericHome<Auto>{
	
	new(Class<Auto> entityType) {
		super(entityType)
	}
	
	def getAutosPorUbicacion(Ubicacion ubicacionOrigen) {

		val query = SessionManager::session.createQuery("from Auto as auto where auto.ubicacionInicial = :ubi")
		query.setEntity("ubi", ubicacionOrigen)
		var autosPorUbicacion = query.list as List<Auto>

		return autosPorUbicacion
	}

	def getAutosPorCategoria(Categoria categoria) {

		val query = SessionManager::session.createQuery("from Auto as auto where auto.categoria = :categ")
		query.setEntity("categ", categoria)
		var autosPorCategoria = query.list as List<Auto>

		return autosPorCategoria
	}

	def getAutosPorMarca(String marca) {

		val query = SessionManager::session.createQuery("from Auto as auto where auto.marca = :m")
		query.setString("m", marca)
		var autosPorMarca = query.list as List<Auto>

		return autosPorMarca
	}

	def getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin) {

		val query = SessionManager::session.createQuery("from Auto as auto left join auto.reservas as reserva where ((reserva = null) or (:finicio > reserva.fin and :ffinal < reserva.inicio)) and 
				((reserva != null) or (auto.ubicacionInicial = :ubi))")
		
		query.setDate("finicio", fechaInicio)
		query.setDate("ffinal", fechaFin)
		query.setEntity("ubi", ubicacion)
		var autosDisponibles = query.list as List<Auto>

		return autosDisponibles
	}
	
	
	def obtenerAutosPor(Ubicacion origen, Ubicacion destino, Date finicio, Date ffin, Categoria categoria) {
		val query = SessionManager::session.createQuery("
			from Auto as auto left join auto.reservas as reserva
				where 
					((reserva = null) or (:finicio > reserva.fin and :ffinal < reserva.inicio) or
					(reserva != null) or (auto.ubicacionInicial = :origen) )
					and auto.categoria = :categoria")

		query.setDate("finicio", finicio)
		query.setDate("ffinal", ffin)
		query.setEntity("origen", origen)
		query.setEntity("categoria", categoria)
		query.list as List<Auto>
	}
}
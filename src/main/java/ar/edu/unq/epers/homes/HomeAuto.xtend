package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import java.util.List

class HomeAuto extends GenericHome<Auto>{
	
	new() {
		super(Auto)
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
			select auto from Auto as auto
				left join fetch auto.reservas as reserva join fetch auto.ubicacionInicial
			where 
				(reserva is null and auto.ubicacionInicial = :origen) or
				(reserva is not null and  (reserva.inicio >:inicio or reserva.fin < :final )) and 
				auto.categoria = :categoria" )

		query.setDate("inicio", finicio)
		query.setDate("final", ffin)
		query.setEntity("origen", origen)
		query.setEntity("categoria", categoria)
		query.list as List<Auto>
	}
}
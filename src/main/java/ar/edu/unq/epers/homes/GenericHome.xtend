package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import java.util.List

class GenericHome<T> implements Home<T> {
	Class<T> entityType

	new(Class<T> entityType) {
		this.entityType = entityType
	}

	override get(int id) {
		return SessionManager.getSession().get(entityType, id) as T
	}

	override save(T o) {
		SessionManager.getSession().saveOrUpdate(o)
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

}
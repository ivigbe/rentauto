package ar.edu.unq.epers.homes

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
	

}
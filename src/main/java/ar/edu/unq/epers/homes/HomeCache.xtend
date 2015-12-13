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
	
	private EntityManagerFactory emf
	private EntityManager em
	
	new(){
		this.emf = Persistence.createEntityManagerFactory("cassandra_pu")
		this.em = emf.createEntityManager()
	}
	
	def void save(CacheSystem cache) {
		em.persist(cache);
	}
	
	def List<CacheSystem> findByUbication(Ubicacion ubi) {
		val query = em.createQuery("select CacheSystem as cache where cache.ubicacion = :ubi")
		
		query.setParameter("ubi", ubi)
		
		val cache = query.resultList
		
		return cache
	}
	
	def List<CacheSystem> getAutosDisponibles(Ubicacion ubicacion, Date fechaInicio, Date fechaFin){ 
		
		val query = em.createQuery("select CacheSystem as cache where cache.ubicacion like :ubi and cache.fechaInicio like :finicio and cache.fechaFin like :ffinal")
		query.setParameter("finicio", fechaInicio)
		query.setParameter("ffinal", fechaFin)
		query.setParameter("ubi", ubicacion)
		
		val cache = query.resultList
		em.close()
		
		return cache
	}
	
}
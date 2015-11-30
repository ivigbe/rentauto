package ar.edu.unq.epers.homes

import javax.persistence.EntityManager
import javax.persistence.EntityManagerFactory
import javax.persistence.Persistence
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtext.xbase.lib.Functions.Function0

@Accessors
class CacheManager {
	
	static EntityManagerFactory entityManagerFactory
	static EntityManager entityManager
	
	
	def synchronized static EntityManagerFactory getEMFactory(){
		
		if(entityManagerFactory == null){
			
			entityManagerFactory = Persistence.createEntityManagerFactory("cassandra_pu");
		}
		entityManagerFactory
	}
	
	def synchronized static EntityManager getEM(){
		
		if(entityManager == null){
			
			entityManager = entityManagerFactory.createEntityManager()
		}
		
		entityManager
	}
	
	def static void runInSession(Runnable  cmd){
		runInSession[
			cmd.run
		]		
	}
	
	def static <T> T runInSession(Function0<T> cmd){
		var emFactory = CacheManager.getEMFactory()
		var em = CacheManager.EM
		var T result = null;
		var transaction = em.transaction
		
		try {
			transaction.begin
			result = cmd.apply()
			transaction.commit()
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback()
			throw new RuntimeException(e)
		} finally {
			if (em != null && emFactory != null)
				em.close()
				emFactory.close()
		}
		
		return result
	}
}
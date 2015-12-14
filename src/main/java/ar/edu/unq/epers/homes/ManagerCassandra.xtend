package ar.edu.unq.epers.homes

import com.datastax.driver.core.Cluster
import com.datastax.driver.core.Host
import com.datastax.driver.core.Session
import com.datastax.driver.mapping.Mapper
import com.datastax.driver.mapping.MappingManager
import ar.edu.unq.epers.model.CacheSystem
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ManagerCassandra {
	Cluster cluster
	Session session
	Mapper<CacheSystem> mapper
	
	new(){
		createSession()
		createCacheSchema()
	}

	def connect(String node) {
		cluster = Cluster.builder().addContactPoint(node).build()
		val metadata = cluster.getMetadata();
		System.out.printf("Connected to cluster: %s\n", metadata.getClusterName());
		for (Host host : metadata.getAllHosts()) {
			System.out.printf("Datatacenter: %s; Host: %s; Rack: %s\n", host.getDatacenter(), host.getAddress(),
				host.getRack());
		}
	}

	def close() {
		cluster.close()
	}
	
	def createCacheSchema(){
		
		session.execute("CREATE KEYSPACE IF NOT EXISTS  simplex WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};")

		session.execute("CREATE TYPE IF NOT EXISTS simplex.CacheSystem (" +
			"cacheId int," + 
			"ubicacion text," +
			"fechaInicio text," +
			"fechaFin text);"
		)

		session.execute("CREATE TABLE IF NOT EXISTS simplex.BusquedaPorCache (" + 
				"ubicacion text, " + 
				"fechaInicio text, " +
				"fechaFin text," +
				"idDeAutosDisponibles list< frozen<CacheSystem> >," +
				"PRIMARY KEY (ubicacion, fechaInicio, fechaFin);"
		)
		mapper = new MappingManager(session).mapper(CacheSystem)
	}

	def getSession() {

		if (session == null) {
			session = createSession()
		}
		return session
	}

	def static Session createSession() {

		val cluster = Cluster.builder().addContactPoint("localhost").build()
		return cluster.connect()
	}
	
	def eliminarTablas(){
		session.execute("DROP KEYSPACE IF EXISTS simplex");
		cluster.close();
	}
}
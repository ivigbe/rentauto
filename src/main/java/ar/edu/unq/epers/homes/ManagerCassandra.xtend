package ar.edu.unq.epers.homes

import com.datastax.driver.core.Cluster
import com.datastax.driver.core.Host
import com.datastax.driver.core.Session
import ar.edu.unq.epers.model.BusquedaPorCache
import com.datastax.driver.mapping.Mapper

class ManagerCassandra {
	Cluster cluster
	Session session
	Mapper<BusquedaPorCache> mapper
	
	new(){
		
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
}
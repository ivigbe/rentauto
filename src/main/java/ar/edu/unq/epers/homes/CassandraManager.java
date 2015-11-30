package ar.edu.unq.epers.homes;

import org.easycassandra.persistence.cassandra.ClusterInformation;
import org.easycassandra.persistence.cassandra.EasyCassandraManager;
import org.easycassandra.persistence.cassandra.Persistence;
import com.datastax.driver.core.Session;
import ar.edu.unq.epers.model.CacheSystem;

public class CassandraManager {
	private static final CassandraManager INSTANCE = new CassandraManager();
	
	private EasyCassandraManager easyCassandraManager;
	private Persistence persistence;
	
	private CassandraManager() {
		easyCassandraManager = new EasyCassandraManager(ClusterInformation.create().addHost("localhost").withKeySpace("cacheDB"));
		easyCassandraManager.addFamilyObject(CacheSystem.class);
		persistence = easyCassandraManager.getPersistence();
	}
	
	public Session session(){
		return easyCassandraManager.getSession();
	}
	
	public Persistence getPersistence() {
		return persistence;
	}
	
	public static CassandraManager getInstance() {
		return INSTANCE;
	}
}

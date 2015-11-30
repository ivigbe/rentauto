package ar.edu.unq.epers.homes;

import org.easycassandra.persistence.cassandra.ClusterInformation;
import org.easycassandra.persistence.cassandra.EasyCassandraManager;
import org.easycassandra.persistence.cassandra.Persistence;

import ar.edu.unq.epers.model.CacheSystem;

public enum CassandraManager {
	INSTANCE;
	private EasyCassandraManager easyCassandraManager;
	private Persistence persistence;
	{
		easyCassandraManager = new EasyCassandraManager(ClusterInformation.create().addHost("localhost").withKeySpace("javabahia"));
		easyCassandraManager.addFamilyObject(CacheSystem.class);
		persistence = easyCassandraManager.getPersistence();
	}
	
	public Persistence getPersistence() {
		return persistence;
	}
}

package ar.edu.unq.epers.model

import javax.persistence.Entity
import javax.persistence.Table
import javax.persistence.Id
import java.util.Date
import javax.persistence.Column
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Table(name = "cache", schema = "CacheEntrega6@cassandra_pu")
@Accessors
class CacheSystem {
	
	@Id
	private String cacheId
	
	@Column(name="ubicacion")
	Ubicacion ubicacion
	
	@Column(name="fecha")
	Date fecha
	
	@Column(name="autosDisponibles")
	List<Auto> autosDisponibles = newArrayList()
}
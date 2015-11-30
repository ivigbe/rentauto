package ar.edu.unq.epers.model

import java.util.Date
import java.util.List
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import org.apache.commons.lang3.builder.EqualsBuilder
import org.apache.commons.lang3.builder.HashCodeBuilder
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Table
import org.apache.commons.lang3.builder.ToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.easycassandra.Index

@Entity(name = "cache")
@Table(name = "cacheTable", schema = "CacheEntrega6@cassandra_pu")
@Accessors
class CacheSystem {
	
	@Id
	@Index
	@Column(name="ubicacion")
	Ubicacion ubicacion
	
	@Id
	@Column(name="fechaInicio")
	Date fechaInicio
	
	@Id
	@Column(name="fechaFin")
	Date fechaFin
	
	@Column(name="autosDisponibles")
	List<Integer> idDeAutosDisponibles = newArrayList()
	
	new(){}
	
	@Override
	override boolean equals(Object obj) {
	 	if(obj instanceof CacheSystem) {
			val other = CacheSystem.cast(obj)
		 	return new EqualsBuilder().append(cacheId, other.cacheId).isEquals()
	 	}
	 	return false
	}
  
	@Override
	override int hashCode() {
		return new HashCodeBuilder().append(cacheId).toHashCode()
	}
	
	@Override
	override String toString() {

		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE)
	}
}
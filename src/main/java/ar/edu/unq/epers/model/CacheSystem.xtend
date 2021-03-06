package ar.edu.unq.epers.model

import com.datastax.driver.mapping.annotations.FrozenValue
import com.datastax.driver.mapping.annotations.PartitionKey
import com.datastax.driver.mapping.annotations.Table
import java.util.Date
import java.util.List
import org.apache.commons.lang3.builder.ToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.EqualsHashCode

@EqualsHashCode
@Table(keyspace = "simplex", name = "BusquedaPorCache")
@Accessors
class BusquedaPorCache{
		
	@PartitionKey()
    Ubicacion ubicacion
    @PartitionKey(1)
	Date fechaInicio
	@PartitionKey(2)
	Date fechaFin
	@FrozenValue
	List<Integer> idDeAutosDisponibles
	
	new(){}
	
	@Override
	override String toString() {

		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE)
	}
}
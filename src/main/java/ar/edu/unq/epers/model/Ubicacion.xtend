package ar.edu.unq.epers.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.EqualsHashCode

@Accessors 
@EqualsHashCode
class Ubicacion {
	String nombre
	Integer ubicacionId
	
	new(){}
	
	new(String nombre){
		this.nombre = nombre
	}
}

@Accessors 
class UbicacionVirtual extends Ubicacion{
	List<Ubicacion> ubicaciones
	
}

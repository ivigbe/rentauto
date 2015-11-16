package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class PublicacionAuto {
	
	@ObjectId
	@JsonProperty("_id")
	
	String id
	String comentario
	NivelVisibilidadAuto nivelVisibilidad
	
	new(String coment){
		
		this.comentario = coment
	}
}
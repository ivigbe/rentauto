package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class ComentarioAuto {
	
	@ObjectId
	@JsonProperty("_id")
	
	String id
	String comentario
	
	new(String coment){
		
		this.comentario = coment
	}
}
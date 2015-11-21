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
	String nombreDeUsuario
	Integer numeroSolicitudDeUnaReserva
	CalificacionAuto calificacion
	NivelVisibilidadAuto visibilidad
	
	new(){}
	 
	new(String unComentario, String unNombreUsuario, Integer unNumeroReserva, CalificacionAuto unaCalificacion, NivelVisibilidadAuto unaPrivacidad){
		
		this.comentario = unComentario
		this.nombreDeUsuario = unNombreUsuario
		this.numeroSolicitudDeUnaReserva = unNumeroReserva
		this.calificacion = unaCalificacion 
		this.visibilidad = unaPrivacidad		
	}
	
	
	
	
}//colecciones de perfiles y dentro coleccion de publicaciones. cada perfil tiene su usuario, 
	//y una coleccion de publicaciones.
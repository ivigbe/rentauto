package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.NivelVisibilidadAuto
import ar.edu.unq.epers.model.PublicacionAuto
import ar.edu.unq.epers.model.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.DBQuery

@Accessors
class HomePublicacion {
		
	Collection<PublicacionAuto> homePublicacion 

	new(){}
	
	def guardarPublicacion(PublicacionAuto publicacion) {
		homePublicacion = SistemDB.instance().collection(PublicacionAuto)
		val result = homePublicacion.insert(publicacion)
		publicacion.id = result.savedId
	}
	
	def verPublicaciones(Usuario usuario, Usuario usuario2, List<NivelVisibilidadAuto> visibilidades) {
		val query1 = DBQuery.is("nombreDeUsuario" , usuario2.nombreUsuario)
		val query2 = DBQuery.in("visibilidad" , visibilidades)  
		val publicaciones = homePublicacion.mongoCollection.find(query1.and(query2))
		return publicaciones.toArray
	}

}
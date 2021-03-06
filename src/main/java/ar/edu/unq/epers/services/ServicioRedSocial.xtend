package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeRedSocial
import ar.edu.unq.epers.model.Mensaje
import ar.edu.unq.epers.model.NivelVisibilidadAuto
import ar.edu.unq.epers.model.PublicacionAuto
import ar.edu.unq.epers.model.TipoDeRelaciones
import ar.edu.unq.epers.model.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import ar.edu.unq.epers.homes.HomePublicacion

@Accessors
class ServicioRedSocial {
	
	HomePublicacion homePublicacion
	
	new (HomePublicacion h){
		this.homePublicacion = h		
	}
	
	private def createHome(GraphDatabaseService graph) {
		new HomeRedSocial(graph)
	}

	def agregarUsuario(Usuario u) {
		
		GraphServiceRunner::run[
			createHome(it).crearNodoUsuario(u); 
			null
		]
	}
	
	def agregarComoAmigo(Usuario u1, Usuario u2) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.relacionar(u1, u2, TipoDeRelaciones.AMIGO)
			home.relacionar(u2, u1, TipoDeRelaciones.AMIGO)
		]
	}
	
	def obtenerAmigos(Usuario u) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.getAmigos(u)
		]
	}
	
	def obtenerPersonasConectadas(Usuario u) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.getAmigosDeAmigos(u)
		]
	}
	
	def obtenerMensajesEnviados(Usuario u){
		GraphServiceRunner::run[
			val home = createHome(it)
			home.getMensajesEnviados(u)
		]
	}
	
	def obtenerMensajesRecibidos(Usuario u){
		GraphServiceRunner::run[
			val home = createHome(it)
			home.getMensajesRecibidos(u)
		]
	}
	
	def void enviarMensajeA(Usuario u1, Usuario u2, Mensaje m){
		
		GraphServiceRunner::run[
			val home = createHome(it)
			if (this.sonAmigos(u1, u2)) 
				home.relacionarMensaje(u1, u2, m)
		]
	}
	
	def sonAmigos(Usuario u1, Usuario u2) {
		GraphServiceRunner::run[
			val home = createHome(it)
			home.getAmigos(u1).contains(u2)
		]
	}
	
	def ingresarPublicacionReserva(PublicacionAuto p){
		homePublicacion.guardarPublicacion(p)
	}
	
	def verPublicaciones(Usuario miUsuario, Usuario otroUsuario){
		
		val List<NivelVisibilidadAuto> visibilities = new ArrayList()
		
		if(miUsuario.equals(otroUsuario)){
			visibilities.add(NivelVisibilidadAuto.SOLOAMIGOS)
			visibilities.add(NivelVisibilidadAuto.PRIVADO)
			visibilities.add(NivelVisibilidadAuto.PUBLICO)
		}else{
			if (sonAmigos (miUsuario, otroUsuario)){
				visibilities.add(NivelVisibilidadAuto.SOLOAMIGOS)
				visibilities.add(NivelVisibilidadAuto.PUBLICO)
			}else{
				visibilities.add(NivelVisibilidadAuto.PUBLICO)
			}
		}
		
		val publicaciones = homePublicacion.verPublicaciones(miUsuario, otroUsuario, visibilities)
		return publicaciones
	}
}
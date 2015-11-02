package ar.edu.unq.epers.services

import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.model.TipoDeRelaciones
import org.neo4j.graphdb.GraphDatabaseService
import ar.edu.unq.epers.homes.HomeRedSocial

class ServicioRedSocial {
	
	private def createHome(GraphDatabaseService graph) {
		new HomeRedSocial(graph)
	}

	def agregarUsuario(Usuario u) {
		
		GraphServiceRunner::run[
			createHome(it).crearNodo(u); 
			null
		]
	}
	
	def amigos(Usuario u1, Usuario u2) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.relacionar(u1, u2, TipoDeRelaciones.AMIGO)
			home.relacionar(u2, u1, TipoDeRelaciones.AMIGO)
		]
	}
	
	def enviarMensajeA(Usuario u, String mensaje){
		
		GraphServiceRunner::run[
			
			val home = createHome(it)
			val destinatario = home.getNodo(u)
			destinatario.enviarMensaje(mensaje)
		]
	}
}
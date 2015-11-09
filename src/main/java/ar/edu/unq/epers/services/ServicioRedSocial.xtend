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
	
	def enviarMensajeA(Usuario u1, Usuario u2, String mensaje){
		
		GraphServiceRunner::run[
			val home = createHome(it)
			if (this.sonAmigos(u1, u2)) 
				home.relacionarMensaje(u1, u2, mensaje)
		]
	}
	
	def sonAmigos(Usuario u1, Usuario u2) {
		GraphServiceRunner::run[
			val home = createHome(it)
			home.getAmigos(u1).contains(u2)
		]
	}
	
}
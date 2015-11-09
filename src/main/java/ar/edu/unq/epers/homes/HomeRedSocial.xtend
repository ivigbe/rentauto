package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.TipoDeRelaciones
import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.services.ServicioUsuario
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.DynamicLabel
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.RelationshipType
import java.util.Calendar
import java.util.Date
class HomeRedSocial {
	
	GraphDatabaseService graph
	HomeUsuario homeUsuario = new HomeUsuario()
	ServicioUsuario serviceUsuario = new ServicioUsuario(homeUsuario)
	Calendar calendar = Calendar.getInstance();
	Date now = calendar.getTime();
	
	new(GraphDatabaseService graph){
		this.graph = graph
	}
	
	private def usuarioLabel() {
		DynamicLabel.label("Usuario")
	}
	
	private def mensajeLabel() {
		DynamicLabel.label("Mensaje")
	}
	
	def crearNodoMensaje(String msj) {
		val node = this.graph.createNode(mensajeLabel)
		node.setProperty("mensaje", msj) 
		node.setProperty("clave",new java.sql.Timestamp(now.getTime()))
		node
	}
	
	def crearNodoUsuario(Usuario u) {
		val node = this.graph.createNode(usuarioLabel)
		node.setProperty("nombreUsuario", u.nombreUsuario)
		//node.setProperty("usuarioId", u.usuarioId)
	}
	
	def getNodo(String userName) {
		this.graph.findNodes(usuarioLabel, "nombreUsuario", userName).head
	}
	
	def getNodo(Usuario u) {
		this.getNodo(u.nombreUsuario)
	}
			
	def relacionarMensaje(Usuario u1, Usuario u2, String msj) {
		val nodo1 = this.getNodo(u1);
		val nodo2 = this.getNodo(u2);
		val nodoMsj = this.crearNodoMensaje(msj);
		nodo1.createRelationshipTo(nodoMsj, TipoDeRelaciones.MENSAJE_A);
		nodo2.createRelationshipTo(nodoMsj, TipoDeRelaciones.MENSAJE_DE);
	}
	
	def relacionar(Usuario u1, Usuario u2, TipoDeRelaciones relacion) {
		val nodo1 = this.getNodo(u1);
		val nodo2 = this.getNodo(u2);
		nodo1.createRelationshipTo(nodo2, relacion);
	}
	
	private def toUsuario(Node nodo) {
		return this.serviceUsuario.getUsuarioPorNombreUsuario(nodo.getProperty("nombreUsuario") as String)
	}
	
	def getAmigos(Usuario u) {
		val nodoUsuario = this.getNodo(u)
		val nodoAmigos = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.AMIGO, Direction.INCOMING)//??????????????????
		return nodoAmigos.map[toUsuario].toSet
	}
	
	def getAmigosDeAmigos(Usuario u) {
		val amigos = this.getAmigos(u)
		return amigos.map[this.getAmigos(it)].flatten.toSet
	}
		
	protected def nodosRelacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
}
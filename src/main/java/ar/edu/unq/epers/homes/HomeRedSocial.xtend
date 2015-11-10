package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Mensaje
import ar.edu.unq.epers.model.TipoDeRelaciones
import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.services.ServicioUsuario
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.DynamicLabel
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.RelationshipType
import org.neo4j.graphdb.traversal.Uniqueness
import org.neo4j.graphdb.traversal.Evaluators

class HomeRedSocial {
	
	GraphDatabaseService graph
	HomeUsuario homeUsuario = new HomeUsuario()
	ServicioUsuario serviceUsuario = new ServicioUsuario(homeUsuario)
	
	new(GraphDatabaseService graph){
		this.graph = graph
	}
	
	private def usuarioLabel() {
		DynamicLabel.label("Usuario")
	}
	
	private def mensajeLabel() {
		DynamicLabel.label("Mensaje")
	}
	
	def crearNodoMensaje(Mensaje msj) {
		val node = this.graph.createNode(mensajeLabel)
		node.setProperty("mensaje", msj.value) 
		node.setProperty("clave",System.currentTimeMillis)
		node
	}
	
	def crearNodoUsuario(Usuario u) {
		val node = this.graph.createNode(usuarioLabel)
		node.setProperty("nombreUsuario", u.nombreUsuario)
	}
	
	def getNodoUsuario(String userName) {
		this.graph.findNodes(usuarioLabel, "nombreUsuario", userName).head
	}
	
	def getNodoMsje(long fecha){
		
		this.graph.findNodes(mensajeLabel, "clave", fecha).head
	}
	
	def getMsje(Mensaje m){
		
		this.getNodoMsje(m.fecha)
	}
	
	def getNodo(Usuario u) {
		this.getNodoUsuario(u.nombreUsuario)
	}
			
	def relacionarMensaje(Usuario u1, Usuario u2, Mensaje msj) {
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
	
	 def toUsuario(Node nodo) {
		return this.serviceUsuario.getUsuarioPorNombreUsuario(nodo.getProperty("nombreUsuario") as String)
	}
	
	def toMsje(Node nodo){
		
		new Mensaje =>[
			value = nodo.getProperty("mensaje") as String
			fecha = nodo.getProperty("clave") as Long
		]
	}
	
	def getAmigos(Usuario u) {
		val nodoUsuario = this.getNodo(u)
		val nodoAmigos = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.AMIGO, Direction.BOTH)
		return nodoAmigos.map[toUsuario].toSet
	}
	
	def getAmigosDeAmigos(Usuario u) {
		val amigosDeAmigos = graph.traversalDescription()
			.depthFirst()
			.relationships(TipoDeRelaciones.AMIGO)
			.uniqueness(Uniqueness.NODE_GLOBAL)
			.evaluator(Evaluators.excludeStartPosition)
		amigosDeAmigos.traverse(getNodo(u)).nodes().map[toUsuario].toSet
	}
	
	def getMensajesEnviados(Usuario u){
		
		val nodoUsuario = this.getNodo(u)
		val nodoMensajes = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.MENSAJE_A, Direction.OUTGOING)
		return nodoMensajes.map[toMsje].toSet
	}
	
	def getMensajesRecibidos(Usuario u){
		
		val nodoUsuario = this.getNodo(u)
		val nodoMensajes = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.MENSAJE_DE, Direction.OUTGOING)
		return nodoMensajes.map[toMsje].toSet
	}
		
	protected def nodosRelacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
}
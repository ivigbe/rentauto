package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.TipoDeRelaciones
import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.services.ServicioUsuario
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.DynamicLabel
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.RelationshipType

class HomeRedSocial {
	
	GraphDatabaseService graph
	ServicioUsuario serviceUsuario
	
	new(GraphDatabaseService graph) {
		this.graph = graph
	}
	
	private def usuarioLabel() {
		DynamicLabel.label("Usuario")
	}
	
	def crearNodo(Usuario u) {
		val node = this.graph.createNode(usuarioLabel)
		node.setProperty("nombreUsuario", u.nombreUsuario)
		node.setProperty("usuarioId", u.usuarioId)
	}
	
	def getNodo(Usuario u) {
		this.getNodo(u.nombreUsuario)
	}
	
	def getNodo(String userName) {
		this.graph.findNodes(usuarioLabel, "nombreUsuario", userName).head
	}
	
	def relacionar(Usuario u1, Usuario u2, TipoDeRelaciones relacion) {
		val nodo1 = this.getNodo(u1);
		val nodo2 = this.getNodo(u2);
		nodo1.createRelationshipTo(nodo2, relacion);
	}
	
	private def toUsuario(Node nodo) {
		this.serviceUsuario.getUsuarioPorId(nodo.getProperty("usuarioId") as Integer)
	}
	
	def getAmigos(Usuario u) {
		val nodoUsuario = this.getNodo(u)
		val nodoAmigos = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.AMIGO, Direction.INCOMING)//??????????????????
		nodoAmigos.map[toUsuario].toSet
	}
	
	protected def nodosRelacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
}
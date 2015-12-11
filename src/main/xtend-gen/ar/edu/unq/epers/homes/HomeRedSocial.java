package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.HomeUsuario;
import ar.edu.unq.epers.model.Mensaje;
import ar.edu.unq.epers.model.TipoDeRelaciones;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioUsuario;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.IteratorExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.neo4j.graphdb.Direction;
import org.neo4j.graphdb.DynamicLabel;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Label;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.RelationshipType;
import org.neo4j.graphdb.ResourceIterable;
import org.neo4j.graphdb.ResourceIterator;
import org.neo4j.graphdb.traversal.Evaluators;
import org.neo4j.graphdb.traversal.PathEvaluator;
import org.neo4j.graphdb.traversal.TraversalDescription;
import org.neo4j.graphdb.traversal.Traverser;
import org.neo4j.graphdb.traversal.Uniqueness;

@SuppressWarnings("all")
public class HomeRedSocial {
  private GraphDatabaseService graph;
  
  private HomeUsuario homeUsuario = new HomeUsuario();
  
  private ServicioUsuario serviceUsuario = new ServicioUsuario(this.homeUsuario);
  
  public HomeRedSocial(final GraphDatabaseService graph) {
    this.graph = graph;
  }
  
  private Label usuarioLabel() {
    return DynamicLabel.label("Usuario");
  }
  
  private Label mensajeLabel() {
    return DynamicLabel.label("Mensaje");
  }
  
  public Node crearNodoMensaje(final Mensaje msj) {
    Node _xblockexpression = null;
    {
      Label _mensajeLabel = this.mensajeLabel();
      final Node node = this.graph.createNode(_mensajeLabel);
      node.setProperty("mensaje", msj.value);
      long _currentTimeMillis = System.currentTimeMillis();
      node.setProperty("clave", Long.valueOf(_currentTimeMillis));
      _xblockexpression = node;
    }
    return _xblockexpression;
  }
  
  public void crearNodoUsuario(final Usuario u) {
    Label _usuarioLabel = this.usuarioLabel();
    final Node node = this.graph.createNode(_usuarioLabel);
    String _nombreUsuario = u.getNombreUsuario();
    node.setProperty("nombreUsuario", _nombreUsuario);
  }
  
  public Node getNodoUsuario(final String userName) {
    Label _usuarioLabel = this.usuarioLabel();
    ResourceIterator<Node> _findNodes = this.graph.findNodes(_usuarioLabel, "nombreUsuario", userName);
    return IteratorExtensions.<Node>head(_findNodes);
  }
  
  public Node getNodoMsje(final long fecha) {
    Label _mensajeLabel = this.mensajeLabel();
    ResourceIterator<Node> _findNodes = this.graph.findNodes(_mensajeLabel, "clave", Long.valueOf(fecha));
    return IteratorExtensions.<Node>head(_findNodes);
  }
  
  public Node getMsje(final Mensaje m) {
    return this.getNodoMsje(m.fecha);
  }
  
  public Node getNodo(final Usuario u) {
    String _nombreUsuario = u.getNombreUsuario();
    return this.getNodoUsuario(_nombreUsuario);
  }
  
  public Relationship relacionarMensaje(final Usuario u1, final Usuario u2, final Mensaje msj) {
    Relationship _xblockexpression = null;
    {
      final Node nodo1 = this.getNodo(u1);
      final Node nodo2 = this.getNodo(u2);
      final Node nodoMsj = this.crearNodoMensaje(msj);
      nodo1.createRelationshipTo(nodoMsj, TipoDeRelaciones.MENSAJE_A);
      _xblockexpression = nodo2.createRelationshipTo(nodoMsj, TipoDeRelaciones.MENSAJE_DE);
    }
    return _xblockexpression;
  }
  
  public Relationship relacionar(final Usuario u1, final Usuario u2, final TipoDeRelaciones relacion) {
    Relationship _xblockexpression = null;
    {
      final Node nodo1 = this.getNodo(u1);
      final Node nodo2 = this.getNodo(u2);
      _xblockexpression = nodo1.createRelationshipTo(nodo2, relacion);
    }
    return _xblockexpression;
  }
  
  public Usuario toUsuario(final Node nodo) {
    Object _property = nodo.getProperty("nombreUsuario");
    return this.serviceUsuario.getUsuarioPorNombreUsuario(((String) _property));
  }
  
  public Mensaje toMsje(final Node nodo) {
    Mensaje _mensaje = new Mensaje();
    final Procedure1<Mensaje> _function = new Procedure1<Mensaje>() {
      @Override
      public void apply(final Mensaje it) {
        Object _property = nodo.getProperty("mensaje");
        it.value = ((String) _property);
        Object _property_1 = nodo.getProperty("clave");
        it.fecha = (((Long) _property_1)).longValue();
      }
    };
    return ObjectExtensions.<Mensaje>operator_doubleArrow(_mensaje, _function);
  }
  
  public Set<Usuario> getAmigos(final Usuario u) {
    final Node nodoUsuario = this.getNodo(u);
    final Iterable<Node> nodoAmigos = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.AMIGO, Direction.BOTH);
    final Function1<Node, Usuario> _function = new Function1<Node, Usuario>() {
      @Override
      public Usuario apply(final Node it) {
        return HomeRedSocial.this.toUsuario(it);
      }
    };
    Iterable<Usuario> _map = IterableExtensions.<Node, Usuario>map(nodoAmigos, _function);
    return IterableExtensions.<Usuario>toSet(_map);
  }
  
  public Set<Usuario> getAmigosDeAmigos(final Usuario u) {
    Set<Usuario> _xblockexpression = null;
    {
      TraversalDescription _traversalDescription = this.graph.traversalDescription();
      TraversalDescription _depthFirst = _traversalDescription.depthFirst();
      TraversalDescription _relationships = _depthFirst.relationships(TipoDeRelaciones.AMIGO);
      TraversalDescription _uniqueness = _relationships.uniqueness(Uniqueness.NODE_GLOBAL);
      PathEvaluator _excludeStartPosition = Evaluators.excludeStartPosition();
      final TraversalDescription amigosDeAmigos = _uniqueness.evaluator(_excludeStartPosition);
      Node _nodo = this.getNodo(u);
      Traverser _traverse = amigosDeAmigos.traverse(_nodo);
      ResourceIterable<Node> _nodes = _traverse.nodes();
      final Function1<Node, Usuario> _function = new Function1<Node, Usuario>() {
        @Override
        public Usuario apply(final Node it) {
          return HomeRedSocial.this.toUsuario(it);
        }
      };
      Iterable<Usuario> _map = IterableExtensions.<Node, Usuario>map(_nodes, _function);
      _xblockexpression = IterableExtensions.<Usuario>toSet(_map);
    }
    return _xblockexpression;
  }
  
  public Set<Mensaje> getMensajesEnviados(final Usuario u) {
    final Node nodoUsuario = this.getNodo(u);
    final Iterable<Node> nodoMensajes = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.MENSAJE_A, Direction.OUTGOING);
    final Function1<Node, Mensaje> _function = new Function1<Node, Mensaje>() {
      @Override
      public Mensaje apply(final Node it) {
        return HomeRedSocial.this.toMsje(it);
      }
    };
    Iterable<Mensaje> _map = IterableExtensions.<Node, Mensaje>map(nodoMensajes, _function);
    return IterableExtensions.<Mensaje>toSet(_map);
  }
  
  public Set<Mensaje> getMensajesRecibidos(final Usuario u) {
    final Node nodoUsuario = this.getNodo(u);
    final Iterable<Node> nodoMensajes = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.MENSAJE_DE, Direction.OUTGOING);
    final Function1<Node, Mensaje> _function = new Function1<Node, Mensaje>() {
      @Override
      public Mensaje apply(final Node it) {
        return HomeRedSocial.this.toMsje(it);
      }
    };
    Iterable<Mensaje> _map = IterableExtensions.<Node, Mensaje>map(nodoMensajes, _function);
    return IterableExtensions.<Mensaje>toSet(_map);
  }
  
  protected Iterable<Node> nodosRelacionados(final Node nodo, final RelationshipType tipo, final Direction direccion) {
    Iterable<Relationship> _relationships = nodo.getRelationships(tipo, direccion);
    final Function1<Relationship, Node> _function = new Function1<Relationship, Node>() {
      @Override
      public Node apply(final Relationship it) {
        return it.getOtherNode(nodo);
      }
    };
    return IterableExtensions.<Relationship, Node>map(_relationships, _function);
  }
}

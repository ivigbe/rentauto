package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomePublicacion;
import ar.edu.unq.epers.homes.HomeRedSocial;
import ar.edu.unq.epers.model.Mensaje;
import ar.edu.unq.epers.model.NivelVisibilidadAuto;
import ar.edu.unq.epers.model.PublicacionAuto;
import ar.edu.unq.epers.model.TipoDeRelaciones;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.GraphServiceRunner;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Relationship;

@Accessors
@SuppressWarnings("all")
public class ServicioRedSocial {
  private HomePublicacion homePublicacion;
  
  public ServicioRedSocial(final HomePublicacion h) {
    this.homePublicacion = h;
  }
  
  private HomeRedSocial createHome(final GraphDatabaseService graph) {
    return new HomeRedSocial(graph);
  }
  
  public Object agregarUsuario(final Usuario u) {
    final Function1<GraphDatabaseService, Object> _function = new Function1<GraphDatabaseService, Object>() {
      @Override
      public Object apply(final GraphDatabaseService it) {
        Object _xblockexpression = null;
        {
          HomeRedSocial _createHome = ServicioRedSocial.this.createHome(it);
          _createHome.crearNodoUsuario(u);
          _xblockexpression = null;
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Object>run(_function);
  }
  
  public Relationship agregarComoAmigo(final Usuario u1, final Usuario u2) {
    final Function1<GraphDatabaseService, Relationship> _function = new Function1<GraphDatabaseService, Relationship>() {
      @Override
      public Relationship apply(final GraphDatabaseService it) {
        Relationship _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          home.relacionar(u1, u2, TipoDeRelaciones.AMIGO);
          _xblockexpression = home.relacionar(u2, u1, TipoDeRelaciones.AMIGO);
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Relationship>run(_function);
  }
  
  public Set<Usuario> obtenerAmigos(final Usuario u) {
    final Function1<GraphDatabaseService, Set<Usuario>> _function = new Function1<GraphDatabaseService, Set<Usuario>>() {
      @Override
      public Set<Usuario> apply(final GraphDatabaseService it) {
        Set<Usuario> _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          _xblockexpression = home.getAmigos(u);
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Set<Usuario>>run(_function);
  }
  
  public Set<Usuario> obtenerPersonasConectadas(final Usuario u) {
    final Function1<GraphDatabaseService, Set<Usuario>> _function = new Function1<GraphDatabaseService, Set<Usuario>>() {
      @Override
      public Set<Usuario> apply(final GraphDatabaseService it) {
        Set<Usuario> _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          _xblockexpression = home.getAmigosDeAmigos(u);
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Set<Usuario>>run(_function);
  }
  
  public Set<Mensaje> obtenerMensajesEnviados(final Usuario u) {
    final Function1<GraphDatabaseService, Set<Mensaje>> _function = new Function1<GraphDatabaseService, Set<Mensaje>>() {
      @Override
      public Set<Mensaje> apply(final GraphDatabaseService it) {
        Set<Mensaje> _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          _xblockexpression = home.getMensajesEnviados(u);
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Set<Mensaje>>run(_function);
  }
  
  public Set<Mensaje> obtenerMensajesRecibidos(final Usuario u) {
    final Function1<GraphDatabaseService, Set<Mensaje>> _function = new Function1<GraphDatabaseService, Set<Mensaje>>() {
      @Override
      public Set<Mensaje> apply(final GraphDatabaseService it) {
        Set<Mensaje> _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          _xblockexpression = home.getMensajesRecibidos(u);
        }
        return _xblockexpression;
      }
    };
    return GraphServiceRunner.<Set<Mensaje>>run(_function);
  }
  
  public void enviarMensajeA(final Usuario u1, final Usuario u2, final Mensaje m) {
    final Function1<GraphDatabaseService, Relationship> _function = new Function1<GraphDatabaseService, Relationship>() {
      @Override
      public Relationship apply(final GraphDatabaseService it) {
        Relationship _xblockexpression = null;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          Relationship _xifexpression = null;
          Boolean _sonAmigos = ServicioRedSocial.this.sonAmigos(u1, u2);
          if ((_sonAmigos).booleanValue()) {
            _xifexpression = home.relacionarMensaje(u1, u2, m);
          }
          _xblockexpression = _xifexpression;
        }
        return _xblockexpression;
      }
    };
    GraphServiceRunner.<Relationship>run(_function);
  }
  
  public Boolean sonAmigos(final Usuario u1, final Usuario u2) {
    final Function1<GraphDatabaseService, Boolean> _function = new Function1<GraphDatabaseService, Boolean>() {
      @Override
      public Boolean apply(final GraphDatabaseService it) {
        boolean _xblockexpression = false;
        {
          final HomeRedSocial home = ServicioRedSocial.this.createHome(it);
          Set<Usuario> _amigos = home.getAmigos(u1);
          _xblockexpression = _amigos.contains(u2);
        }
        return Boolean.valueOf(_xblockexpression);
      }
    };
    return GraphServiceRunner.<Boolean>run(_function);
  }
  
  public void ingresarPublicacionReserva(final PublicacionAuto p) {
    this.homePublicacion.guardarPublicacion(p);
  }
  
  public List<PublicacionAuto> verPublicaciones(final Usuario miUsuario, final Usuario otroUsuario) {
    final List<NivelVisibilidadAuto> visibilities = new ArrayList<NivelVisibilidadAuto>();
    boolean _equals = miUsuario.equals(otroUsuario);
    if (_equals) {
      visibilities.add(NivelVisibilidadAuto.SOLOAMIGOS);
      visibilities.add(NivelVisibilidadAuto.PRIVADO);
      visibilities.add(NivelVisibilidadAuto.PUBLICO);
    } else {
      Boolean _sonAmigos = this.sonAmigos(miUsuario, otroUsuario);
      if ((_sonAmigos).booleanValue()) {
        visibilities.add(NivelVisibilidadAuto.SOLOAMIGOS);
        visibilities.add(NivelVisibilidadAuto.PUBLICO);
      } else {
        visibilities.add(NivelVisibilidadAuto.PUBLICO);
      }
    }
    final List<PublicacionAuto> publicaciones = this.homePublicacion.verPublicaciones(miUsuario, otroUsuario, visibilities);
    return publicaciones;
  }
  
  @Pure
  public HomePublicacion getHomePublicacion() {
    return this.homePublicacion;
  }
  
  public void setHomePublicacion(final HomePublicacion homePublicacion) {
    this.homePublicacion = homePublicacion;
  }
}

package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeUsuario;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioRedSocial;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ServicioUsuario {
  private HomeUsuario home;
  
  private ServicioRedSocial socialService;
  
  public ServicioUsuario() {
  }
  
  public ServicioUsuario(final HomeUsuario h) {
    this.home = h;
  }
  
  public ServicioUsuario(final HomeUsuario h, final ServicioRedSocial social) {
    this.home = h;
    this.socialService = social;
  }
  
  public void guardarUsuario(final Usuario u) {
    final Function0<Object> _function = new Function0<Object>() {
      @Override
      public Object apply() {
        Object _xblockexpression = null;
        {
          ServicioUsuario.this.home.save(u);
          _xblockexpression = ServicioUsuario.this.socialService.agregarUsuario(u);
        }
        return _xblockexpression;
      }
    };
    SessionManager.<Object>runInSession(_function);
  }
  
  public Usuario getUsuarioPorId(final int id) {
    final Function0<Usuario> _function = new Function0<Usuario>() {
      @Override
      public Usuario apply() {
        return ServicioUsuario.this.home.get(id);
      }
    };
    return SessionManager.<Usuario>runInSession(_function);
  }
  
  public Usuario getUsuarioPorNombreUsuario(final String userName) {
    final Function0<Usuario> _function = new Function0<Usuario>() {
      @Override
      public Usuario apply() {
        return ServicioUsuario.this.home.getForUserName(userName);
      }
    };
    return SessionManager.<Usuario>runInSession(_function);
  }
  
  @Pure
  public HomeUsuario getHome() {
    return this.home;
  }
  
  public void setHome(final HomeUsuario home) {
    this.home = home;
  }
  
  @Pure
  public ServicioRedSocial getSocialService() {
    return this.socialService;
  }
  
  public void setSocialService(final ServicioRedSocial socialService) {
    this.socialService = socialService;
  }
}

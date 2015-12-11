package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Ubicacion;
import org.eclipse.xtext.xbase.lib.Functions.Function0;

@SuppressWarnings("all")
public class ServicioUbicacion {
  private GenericHome<Ubicacion> home;
  
  public ServicioUbicacion(final GenericHome<Ubicacion> h) {
    this.home = h;
  }
  
  public void guardarUbicacion(final Ubicacion u) {
    final Runnable _function = new Runnable() {
      @Override
      public void run() {
        ServicioUbicacion.this.home.save(u);
      }
    };
    SessionManager.runInSession(_function);
  }
  
  public Ubicacion getUbicacionPorId(final int id) {
    final Function0<Ubicacion> _function = new Function0<Ubicacion>() {
      @Override
      public Ubicacion apply() {
        return ServicioUbicacion.this.home.get(id);
      }
    };
    return SessionManager.<Ubicacion>runInSession(_function);
  }
}

package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Empresa;
import org.eclipse.xtext.xbase.lib.Functions.Function0;

@SuppressWarnings("all")
public class ServicioEmpresa {
  private GenericHome<Empresa> home;
  
  public ServicioEmpresa(final GenericHome<Empresa> h) {
    this.home = h;
  }
  
  public void guardarEmpresa(final Empresa e) {
    final Runnable _function = new Runnable() {
      @Override
      public void run() {
        ServicioEmpresa.this.home.save(e);
      }
    };
    SessionManager.runInSession(_function);
  }
  
  public Empresa getEmpresaPorId(final int id) {
    final Function0<Empresa> _function = new Function0<Empresa>() {
      @Override
      public Empresa apply() {
        return ServicioEmpresa.this.home.get(id);
      }
    };
    return SessionManager.<Empresa>runInSession(_function);
  }
}

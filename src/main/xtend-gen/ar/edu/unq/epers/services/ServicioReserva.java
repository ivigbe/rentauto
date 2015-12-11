package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeReserva;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Reserva;
import org.eclipse.xtext.xbase.lib.Functions.Function0;

@SuppressWarnings("all")
public class ServicioReserva {
  private HomeReserva home;
  
  public ServicioReserva(final HomeReserva h) {
    this.home = h;
  }
  
  public void guardarReserva(final Reserva r) {
    final Runnable _function = new Runnable() {
      @Override
      public void run() {
        ServicioReserva.this.home.save(r);
      }
    };
    SessionManager.runInSession(_function);
  }
  
  public Reserva getReservaPorId(final int id) {
    final Function0<Reserva> _function = new Function0<Reserva>() {
      @Override
      public Reserva apply() {
        return ServicioReserva.this.home.get(id);
      }
    };
    return SessionManager.<Reserva>runInSession(_function);
  }
  
  public void hacerReserva(final Reserva r) {
    final Runnable _function = new Runnable() {
      @Override
      public void run() {
        r.reservar();
        ServicioReserva.this.home.save(r);
      }
    };
    SessionManager.runInSession(_function);
  }
}

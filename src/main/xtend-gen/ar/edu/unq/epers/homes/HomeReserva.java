package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.model.Reserva;

@SuppressWarnings("all")
public class HomeReserva extends GenericHome<Reserva> {
  public HomeReserva() {
    super(Reserva.class);
  }
}

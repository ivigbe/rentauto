package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Ubicacion;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

@SuppressWarnings("all")
public class HomeAuto extends GenericHome<Auto> {
  public HomeAuto() {
    super(Auto.class);
  }
  
  public List<Auto> getAutosPorUbicacion(final Ubicacion ubicacionOrigen) {
    Session _session = SessionManager.getSession();
    final Query query = _session.createQuery(" from Auto as auto where auto.ubicacionInicial = :ubi");
    query.setEntity("ubi", ubicacionOrigen);
    List _list = query.list();
    List<Auto> autosPorUbicacion = ((List<Auto>) _list);
    return autosPorUbicacion;
  }
  
  public List<Auto> getAutosPorCategoria(final Categoria categoria) {
    Session _session = SessionManager.getSession();
    final Query query = _session.createQuery("from Auto as auto where auto.categoria = :categ");
    query.setEntity("categ", categoria);
    List _list = query.list();
    List<Auto> autosPorCategoria = ((List<Auto>) _list);
    return autosPorCategoria;
  }
  
  public List<Auto> getAutosPorMarca(final String marca) {
    Session _session = SessionManager.getSession();
    final Query query = _session.createQuery("from Auto as auto where auto.marca = :m");
    query.setString("m", marca);
    List _list = query.list();
    List<Auto> autosPorMarca = ((List<Auto>) _list);
    return autosPorMarca;
  }
  
  public List<Auto> getAutosDisponibles(final Ubicacion ubicacion, final Date fechaInicio, final Date fechaFin) {
    Session _session = SessionManager.getSession();
    final Query query = _session.createQuery("from Auto as auto left join auto.reservas as reserva where ((reserva = null) or (:finicio > reserva.fin and :ffinal < reserva.inicio)) and \n\t\t\t\t((reserva != null) or (auto.ubicacionInicial = :ubi))");
    query.setDate("finicio", fechaInicio);
    query.setDate("ffinal", fechaFin);
    query.setEntity("ubi", ubicacion);
    List _list = query.list();
    List<Auto> autosDisponibles = ((List<Auto>) _list);
    return autosDisponibles;
  }
  
  public List<Auto> obtenerAutosPor(final Ubicacion origen, final Ubicacion destino, final Date finicio, final Date ffin, final Categoria categoria) {
    List<Auto> _xblockexpression = null;
    {
      Session _session = SessionManager.getSession();
      final Query query = _session.createQuery("\n\t\t\tselect auto from Auto as auto\n\t\t\t\tleft join fetch auto.reservas as reserva join fetch auto.ubicacionInicial\n\t\t\twhere \n\t\t\t\t(reserva is null and auto.ubicacionInicial = :origen) or\n\t\t\t\t(reserva is not null and  (reserva.inicio >:inicio or reserva.fin < :final )) and \n\t\t\t\tauto.categoria = :categoria");
      query.setDate("inicio", finicio);
      query.setDate("final", ffin);
      query.setEntity("origen", origen);
      query.setEntity("categoria", categoria);
      List _list = query.list();
      _xblockexpression = ((List<Auto>) _list);
    }
    return _xblockexpression;
  }
}

package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeAuto;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Ubicacion;
import com.google.common.base.Objects;
import java.util.Date;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class ServicioAuto {
  private HomeAuto home;
  
  public ServicioAuto(final HomeAuto h) {
    this.home = h;
  }
  
  public void guardarAuto(final Auto auto) {
    final Runnable _function = new Runnable() {
      @Override
      public void run() {
        ServicioAuto.this.home.save(auto);
      }
    };
    SessionManager.runInSession(_function);
  }
  
  public Auto getAutoPorId(final int id) {
    final Function0<Auto> _function = new Function0<Auto>() {
      @Override
      public Auto apply() {
        return ServicioAuto.this.home.get(id);
      }
    };
    return SessionManager.<Auto>runInSession(_function);
  }
  
  public List<Auto> autosPorUbicacion(final Ubicacion uOrigen) {
    final Function0<List<Auto>> _function = new Function0<List<Auto>>() {
      @Override
      public List<Auto> apply() {
        return ServicioAuto.this.home.getAutosPorUbicacion(uOrigen);
      }
    };
    return SessionManager.<List<Auto>>runInSession(_function);
  }
  
  public List<Auto> autosPorCategoria(final Categoria c) {
    final Function0<List<Auto>> _function = new Function0<List<Auto>>() {
      @Override
      public List<Auto> apply() {
        return ServicioAuto.this.home.getAutosPorCategoria(c);
      }
    };
    return SessionManager.<List<Auto>>runInSession(_function);
  }
  
  public List<Auto> autosPorMarca(final String marca) {
    final Function0<List<Auto>> _function = new Function0<List<Auto>>() {
      @Override
      public List<Auto> apply() {
        return ServicioAuto.this.home.getAutosPorMarca(marca);
      }
    };
    return SessionManager.<List<Auto>>runInSession(_function);
  }
  
  public List<Auto> disponibilidadDeAutos(final Ubicacion ubicacion, final Date fechaInicio, final Date fechaFin) {
    final Function0<List<Auto>> _function = new Function0<List<Auto>>() {
      @Override
      public List<Auto> apply() {
        return ServicioAuto.this.home.getAutosDisponibles(ubicacion, fechaInicio, fechaFin);
      }
    };
    return SessionManager.<List<Auto>>runInSession(_function);
  }
  
  public List<Auto> obtenerAutosPor(final Ubicacion origen, final Ubicacion destino, final Date finicio, final Date ffin, final Categoria categoria) {
    final Function0<List<Auto>> _function = new Function0<List<Auto>>() {
      @Override
      public List<Auto> apply() {
        List<Auto> _obtenerAutosPor = ServicioAuto.this.home.obtenerAutosPor(origen, destino, finicio, ffin, categoria);
        final Function1<Auto, Boolean> _function = new Function1<Auto, Boolean>() {
          @Override
          public Boolean apply(final Auto it) {
            Ubicacion _ubicacionParaDia = it.ubicacionParaDia(finicio);
            return Boolean.valueOf(Objects.equal(_ubicacionParaDia, origen));
          }
        };
        Iterable<Auto> _filter = IterableExtensions.<Auto>filter(_obtenerAutosPor, _function);
        return IterableExtensions.<Auto>toList(_filter);
      }
    };
    return SessionManager.<List<Auto>>runInSession(_function);
  }
}

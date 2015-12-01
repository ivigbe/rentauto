package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.Collection;
import ar.edu.unq.epers.homes.SistemDB;
import ar.edu.unq.epers.model.NivelVisibilidadAuto;
import ar.edu.unq.epers.model.PublicacionAuto;
import ar.edu.unq.epers.model.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.mongojack.DBCursor;
import org.mongojack.DBQuery;
import org.mongojack.JacksonDBCollection;
import org.mongojack.WriteResult;

@Accessors
@SuppressWarnings("all")
public class HomePublicacion {
  private Collection<PublicacionAuto> homePublicacion;
  
  public HomePublicacion() {
  }
  
  public void guardarPublicacion(final PublicacionAuto publicacion) {
    SistemDB _instance = SistemDB.instance();
    Collection<PublicacionAuto> _collection = _instance.<PublicacionAuto>collection(PublicacionAuto.class);
    this.homePublicacion = _collection;
    final WriteResult<PublicacionAuto, String> result = this.homePublicacion.insert(publicacion);
    String _savedId = result.getSavedId();
    publicacion.setId(_savedId);
  }
  
  public List<PublicacionAuto> verPublicaciones(final Usuario usuario, final Usuario usuario2, final List<NivelVisibilidadAuto> visibilidades) {
    String _nombreUsuario = usuario2.getNombreUsuario();
    final DBQuery.Query query1 = DBQuery.is("nombreDeUsuario", _nombreUsuario);
    final DBQuery.Query query2 = DBQuery.in("visibilidad", visibilidades);
    JacksonDBCollection<PublicacionAuto, String> _mongoCollection = this.homePublicacion.getMongoCollection();
    DBQuery.Query _and = query1.and(query2);
    final DBCursor<PublicacionAuto> publicaciones = _mongoCollection.find(_and);
    return publicaciones.toArray();
  }
  
  @Pure
  public Collection<PublicacionAuto> getHomePublicacion() {
    return this.homePublicacion;
  }
  
  public void setHomePublicacion(final Collection<PublicacionAuto> homePublicacion) {
    this.homePublicacion = homePublicacion;
  }
}

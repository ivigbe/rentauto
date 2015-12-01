package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.Home;
import ar.edu.unq.epers.homes.SessionManager;
import org.hibernate.Session;

@SuppressWarnings("all")
public class GenericHome<T extends Object> implements Home<T> {
  private Class<T> entityType;
  
  public GenericHome(final Class<T> entityType) {
    this.entityType = entityType;
  }
  
  @Override
  public T get(final int id) {
    Session _session = SessionManager.getSession();
    Object _get = _session.get(this.entityType, Integer.valueOf(id));
    return ((T) _get);
  }
  
  @Override
  public void save(final T o) {
    Session _session = SessionManager.getSession();
    _session.saveOrUpdate(o);
  }
}

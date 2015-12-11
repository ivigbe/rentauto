package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;

@SuppressWarnings("all")
public class HomeUsuario extends GenericHome<Usuario> {
  public HomeUsuario() {
    super(Usuario.class);
  }
  
  public Usuario getForUserName(final String userName) {
    Usuario _xblockexpression = null;
    {
      final Session session = SessionManager.getSession();
      Query _createQuery = session.createQuery("from Usuario u where u.nombreUsuario = :u");
      Query _setParameter = _createQuery.setParameter("u", userName);
      Object _uniqueResult = _setParameter.uniqueResult();
      _xblockexpression = ((Usuario) _uniqueResult);
    }
    return _xblockexpression;
  }
}

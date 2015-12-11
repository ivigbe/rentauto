package ar.edu.unq.epers.homes;

import com.google.common.base.Objects;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

@SuppressWarnings("all")
public class SessionManager {
  private static SessionFactory sessionFactory;
  
  private static ThreadLocal<Session> tlSession = new ThreadLocal<Session>();
  
  public static synchronized SessionFactory getSessionFactory() {
    SessionFactory _xblockexpression = null;
    {
      boolean _equals = Objects.equal(SessionManager.sessionFactory, null);
      if (_equals) {
        Configuration cfg = new Configuration();
        cfg.configure();
        SessionFactory _buildSessionFactory = cfg.buildSessionFactory();
        SessionManager.sessionFactory = _buildSessionFactory;
      }
      _xblockexpression = SessionManager.sessionFactory;
    }
    return _xblockexpression;
  }
  
  public static synchronized SessionFactory resetSessionFactory() {
    SessionFactory _xifexpression = null;
    boolean _notEquals = (!Objects.equal(SessionManager.sessionFactory, null));
    if (_notEquals) {
      SessionFactory _xblockexpression = null;
      {
        SessionManager.sessionFactory.close();
        _xblockexpression = SessionManager.sessionFactory = null;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
  
  public static void runInSession(final Runnable cmd) {
    final Function0<Object> _function = new Function0<Object>() {
      @Override
      public Object apply() {
        Object _xblockexpression = null;
        {
          cmd.run();
          _xblockexpression = null;
        }
        return _xblockexpression;
      }
    };
    SessionManager.<Object>runInSession(_function);
  }
  
  public static <T extends Object> T runInSession(final Function0<T> cmd) {
    SessionFactory sessionFactory = SessionManager.getSessionFactory();
    Transaction transaction = null;
    T result = null;
    Session session = null;
    try {
      org.hibernate.classic.Session _openSession = sessionFactory.openSession();
      session = _openSession;
      Transaction _beginTransaction = session.beginTransaction();
      transaction = _beginTransaction;
      SessionManager.tlSession.set(session);
      T _apply = cmd.apply();
      result = _apply;
      session.flush();
      transaction.commit();
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception e = (Exception)_t;
        boolean _notEquals = (!Objects.equal(transaction, null));
        if (_notEquals) {
          transaction.rollback();
        }
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    } finally {
      boolean _notEquals_1 = (!Objects.equal(session, null));
      if (_notEquals_1) {
        session.close();
      }
      SessionManager.tlSession.set(null);
    }
    return result;
  }
  
  public static Session getSession() {
    return SessionManager.tlSession.get();
  }
}

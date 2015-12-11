package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.Collection;
import com.google.common.base.Objects;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.mongojack.JacksonDBCollection;

@SuppressWarnings("all")
public class SistemDB {
  private static SistemDB INSTANCE;
  
  private MongoClient mongoClient;
  
  private DB db;
  
  public static synchronized SistemDB instance() {
    boolean _equals = Objects.equal(SistemDB.INSTANCE, null);
    if (_equals) {
      SistemDB _sistemDB = new SistemDB();
      SistemDB.INSTANCE = _sistemDB;
    }
    return SistemDB.INSTANCE;
  }
  
  private SistemDB() {
    try {
      MongoClient _mongoClient = new MongoClient("localhost", 27017);
      this.mongoClient = _mongoClient;
    } catch (final Throwable _t) {
      if (_t instanceof UnknownHostException) {
        final UnknownHostException e = (UnknownHostException)_t;
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    DB _dB = this.mongoClient.getDB("TPMongo");
    this.db = _dB;
  }
  
  public <T extends Object> Collection<T> collection(final Class<T> entityType) {
    Collection<T> _xblockexpression = null;
    {
      String _simpleName = entityType.getSimpleName();
      final DBCollection dbCollection = this.db.getCollection(_simpleName);
      JacksonDBCollection<T, String> _wrap = JacksonDBCollection.<T, String>wrap(dbCollection, entityType, String.class);
      _xblockexpression = new Collection<T>(_wrap);
    }
    return _xblockexpression;
  }
}

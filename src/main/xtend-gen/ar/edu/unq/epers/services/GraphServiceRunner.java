package ar.edu.unq.epers.services;

import com.google.common.base.Objects;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Transaction;
import org.neo4j.graphdb.factory.GraphDatabaseBuilder;
import org.neo4j.graphdb.factory.GraphDatabaseFactory;

@SuppressWarnings("all")
public class GraphServiceRunner {
  private static GraphDatabaseService graphDatabaseService;
  
  public static synchronized GraphDatabaseService getGraphDb() {
    GraphDatabaseService _xblockexpression = null;
    {
      boolean _equals = Objects.equal(GraphServiceRunner.graphDatabaseService, null);
      if (_equals) {
        GraphDatabaseFactory _graphDatabaseFactory = new GraphDatabaseFactory();
        GraphDatabaseBuilder _newEmbeddedDatabaseBuilder = _graphDatabaseFactory.newEmbeddedDatabaseBuilder("./target/neo4j");
        GraphDatabaseService _newGraphDatabase = _newEmbeddedDatabaseBuilder.newGraphDatabase();
        GraphServiceRunner.graphDatabaseService = _newGraphDatabase;
        Runtime _runtime = Runtime.getRuntime();
        final Runnable _function = new Runnable() {
          @Override
          public void run() {
            GraphDatabaseService _graphDb = GraphServiceRunner.getGraphDb();
            _graphDb.shutdown();
          }
        };
        Thread _thread = new Thread(_function);
        _runtime.addShutdownHook(_thread);
      }
      _xblockexpression = GraphServiceRunner.graphDatabaseService;
    }
    return _xblockexpression;
  }
  
  public static <T extends Object> T run(final Function1<GraphDatabaseService, T> command) {
    try {
      T _xblockexpression = null;
      {
        GraphDatabaseService _graphDb = GraphServiceRunner.getGraphDb();
        final Transaction tx = _graphDb.beginTx();
        T _xtrycatchfinallyexpression = null;
        try {
          T _xblockexpression_1 = null;
          {
            GraphDatabaseService _graphDb_1 = GraphServiceRunner.getGraphDb();
            final T t = command.apply(_graphDb_1);
            tx.success();
            _xblockexpression_1 = t;
          }
          _xtrycatchfinallyexpression = _xblockexpression_1;
        } catch (final Throwable _t) {
          if (_t instanceof Exception) {
            final Exception e = (Exception)_t;
            tx.failure();
            throw e;
          } else {
            throw Exceptions.sneakyThrow(_t);
          }
        } finally {
          tx.close();
        }
        _xblockexpression = _xtrycatchfinallyexpression;
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}

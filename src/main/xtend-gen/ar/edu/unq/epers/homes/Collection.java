package ar.edu.unq.epers.homes;

import java.util.List;
import org.mongojack.JacksonDBCollection;
import org.mongojack.MapReduce;
import org.mongojack.MapReduceOutput;
import org.mongojack.WriteResult;

@SuppressWarnings("all")
public class Collection<T extends Object> {
  private JacksonDBCollection<T, String> mongoCollection;
  
  public Collection(final JacksonDBCollection<T, String> collection) {
    this.mongoCollection = collection;
  }
  
  public WriteResult<T, String> insert(final T object) {
    return this.mongoCollection.insert(object);
  }
  
  public WriteResult<T, String> insert(final List<T> object) {
    return this.mongoCollection.insert(object);
  }
  
  public JacksonDBCollection<T, String> setMongoCollection(final JacksonDBCollection<T, String> mongoCollection) {
    return this.mongoCollection = mongoCollection;
  }
  
  public <E extends Object, S extends Object> MapReduceOutput<E, S> mapReduce(final String map, final String reduce, final Class<E> entrada, final Class<S> salida) {
    MapReduce.MapReduceCommand<E, S> _mapReduceCommand = this.<E, S>mapReduceCommand(map, reduce, entrada, salida);
    return this.mongoCollection.<E, S>mapReduce(_mapReduceCommand);
  }
  
  public <E extends Object, S extends Object> MapReduceOutput<E, S> mapReduce(final String map, final String reduce, final String finalize, final Class<E> entrada, final Class<S> salida) {
    MapReduce.MapReduceCommand<E, S> _mapReduceCommand = this.<E, S>mapReduceCommand(map, reduce, finalize, entrada, salida);
    return this.mongoCollection.<E, S>mapReduce(_mapReduceCommand);
  }
  
  public <E extends Object, S extends Object> MapReduce.MapReduceCommand<E, S> mapReduceCommand(final String map, final String reduce, final Class<E> entrada, final Class<S> salida) {
    return MapReduce.<E, S>build(map, reduce, MapReduce.OutputType.INLINE, null, entrada, salida);
  }
  
  public <E extends Object, S extends Object> MapReduce.MapReduceCommand<E, S> mapReduceCommand(final String map, final String reduce, final String finalize, final Class<E> entrada, final Class<S> salida) {
    final MapReduce.MapReduceCommand<E, S> command = this.<E, S>mapReduceCommand(map, reduce, entrada, salida);
    command.setFinalize(finalize);
    return command;
  }
  
  public JacksonDBCollection<T, String> getMongoCollection() {
    return this.mongoCollection;
  }
}

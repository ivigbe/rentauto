package ar.edu.unq.epers.homes;

@SuppressWarnings("all")
public interface Home<T extends Object> {
  public abstract T get(final int id);
  
  public abstract void save(final T o);
}

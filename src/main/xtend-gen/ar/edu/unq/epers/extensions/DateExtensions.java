package ar.edu.unq.epers.extensions;

import java.util.Calendar;
import java.util.Date;

@SuppressWarnings("all")
public class DateExtensions {
  public static Date nuevaFecha(final int year, final int month, final int day) {
    Date _xblockexpression = null;
    {
      final Calendar cal = Calendar.getInstance();
      cal.set(year, (month - 1), day, 0, 0, 0);
      cal.set(Calendar.MILLISECOND, 0);
      _xblockexpression = cal.getTime();
    }
    return _xblockexpression;
  }
  
  public static Date hoy() {
    Date _xblockexpression = null;
    {
      final Calendar cal = Calendar.getInstance();
      cal.set(Calendar.MILLISECOND, 0);
      _xblockexpression = cal.getTime();
    }
    return _xblockexpression;
  }
}

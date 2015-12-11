package ar.edu.unq.epers.mailing;

import ar.edu.unq.epers.mailing.Mail;

@SuppressWarnings("all")
public interface EnviadorDeMails {
  public abstract void enviarMail(final Mail m);
}

package ar.edu.unq.epers.mailing;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Mail {
  private String body;
  
  private String subject;
  
  private String to;
  
  private String from;
  
  @Pure
  public String getBody() {
    return this.body;
  }
  
  public void setBody(final String body) {
    this.body = body;
  }
  
  @Pure
  public String getSubject() {
    return this.subject;
  }
  
  public void setSubject(final String subject) {
    this.subject = subject;
  }
  
  @Pure
  public String getTo() {
    return this.to;
  }
  
  public void setTo(final String to) {
    this.to = to;
  }
  
  @Pure
  public String getFrom() {
    return this.from;
  }
  
  public void setFrom(final String from) {
    this.from = from;
  }
}

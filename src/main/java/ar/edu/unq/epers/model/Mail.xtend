package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Mail implements EnviadorDeMails {
	
	String body
	String subject
	String to
	String from
	
	override enviarMail(Mail m) throws EnviarMailException{
		
		
	}
	
}
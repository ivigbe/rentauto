package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import exceptions.UsuarioNoExisteException
import exceptions.UsuarioYaExisteException
import exceptions.ValidacionException
import exceptions.PasswordInvalidoException
//import java.util.Random

@Accessors
class ServicioUsuario {
	Home home
	Mail mail
	EnviadorDeMails em
	
	new (Home h){
		
		this.home=h
	}
	def void registrarUsuario(Usuario usuario) throws UsuarioYaExisteException{
	/*Proposito: Registra a un nuevo usuario en el sistema RentaAuto. */
	
		val u = this.home.getUsuarioPorNombreUsuario(usuario.nombreUsuario)
		if (u != null)
			throw new UsuarioYaExisteException()
		
		//String claveValidacion = new Random()  queria usar random pero por ahora algo simple
		val claveValidacion = generarClave(usuario) 
		this.home.ingresarNuevoUsuario(usuario)
		this.home.guardarCodigoValidacion(usuario.nombreUsuario, claveValidacion)
		
		val mail = new Mail => [ 
			body = "Ayudenos a mejorar la seguridad de nuestro sistema verificando tu direccion de mail. Aqui tiene su codigo de validacion: " + claveValidacion
			subject = "Por favor valida tu mail"
			to = usuario.email
			from = "rentauto@rentauto.com.ar"
		]
		
		em.enviarMail(mail)
	}
	
	def generarClave(Usuario usuario) { //bobada
	//genera la clave para este usuario en particular
		return (usuario.nombreUsuario) + (usuario.email) 
	}
	
	def void validarCuenta(String codigoValidacion) throws ValidacionException{
	/*Proposito: Se valida la cuenta del usuario registrado. */ 
		val usuario = this.home.getUsuarioPorCodigo(codigoValidacion)
		if (usuario == null)
			throw new ValidacionException()

		usuario.validar()
		this.home.actualizar(usuario)
	}

	def ingresarUsuario(String userName, String password) throws UsuarioNoExisteException{ //O CLAVE INCORRECTA, ver esto
	/*Loguea al usuario, por ahora esto es: si el password es correcto, devuelvo al usuario */
//Capaz deberiamos tener en cuenta para poder ingresar si esta validado o no, pero para luego */
		val usuario = this.home.getUsuarioPorLogin(userName, password)
		if (usuario == null)
			throw new UsuarioNoExisteException()
			
		return usuario
	}
	
	def void cambiarPassword(String user, String password, String newPassword) throws PasswordInvalidoException{
/*el usuario y esta logueado, por eso al recibir usuario y contraseña por parametro, solo debemos revisar que no sean
  iguales la nueva y la vieja, para poder updatear directamente*/

		if (password == newPassword)
			throw new PasswordInvalidoException()//no pueden ser iguales, por ahora es lo unico que se pide, 
												 //deberiamos poner mas cosas obvias referentes a las claves. 
// Ademas no se si deberia obtenerlo devuelta al usuario y no sacarlo de otro lado, ya que estoy logueado, por ahora lo obtengo denuevo*/
		val usuario = this.home.getUsuarioPorNombreUsuario(user)//supongo que siempre aparece, 
																//aunque siempre por las dudas deberia tener excepcion
		usuario.upDatePassword(newPassword)
		
		this.home.actualizar(usuario)
	}
}
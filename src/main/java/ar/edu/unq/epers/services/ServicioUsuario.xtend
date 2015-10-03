package ar.edu.unq.epers.services

import ar.edu.unq.epers.exceptions.PasswordInvalidoException
import ar.edu.unq.epers.exceptions.UsuarioNoExisteException
import ar.edu.unq.epers.exceptions.UsuarioYaExisteException
import ar.edu.unq.epers.exceptions.ValidacionException
import ar.edu.unq.epers.homes.HomeUsuario
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.mailing.EnviadorDeMails
import ar.edu.unq.epers.mailing.Mail
import ar.edu.unq.epers.model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

//import java.util.Random
@Accessors
class ServicioUsuario {
	HomeUsuario home
	EnviadorDeMails em


	new(HomeUsuario h, EnviadorDeMails e) {

		this.home = h
		this.em = e
	}

	/**
	 * Proposito: Registra a un nuevo usuario en el sistema RentaAuto.
	 */
	def void registrarUsuario(Usuario usuario) throws UsuarioYaExisteException{
		val u = this.home.getUsuarioPorNombreUsuario(usuario.nombreUsuario)

		if (u != null)
			throw new UsuarioYaExisteException()

		// String claveValidacion = new Random()  queria usar random pero por ahora algo simple
		val claveValidacion = generarClave(usuario)
		this.home.ingresarNuevoUsuario(usuario)
		this.home.guardarCodigoValidacion(usuario.nombreUsuario, claveValidacion)

		val mail = new Mail =>
			[
				body = "Ayudenos a mejorar la seguridad de nuestro sistema verificando tu direccion de mail. Aqui tiene su codigo de validacion: " +
					claveValidacion
				subject = "Por favor valida tu mail"
				to = usuario.email
				from = "rentauto@rentauto.com.ar"
			]

		em.enviarMail(mail)
	}

	private def generarClave(Usuario usuario) {
		// genera la clave para un usuario en particular
		return (usuario.nombreUsuario) + (usuario.email)
	}

	/**
	 * Proposito: Se valida la cuenta del usuario registrado.
	 */
	def void validarCuenta(String codigoValidacion) throws ValidacionException{
		val usuario = this.home.getUsuarioPorCodigo(codigoValidacion)

		if (usuario == null)
			throw new UsuarioNoExisteException()

		if (usuario.validado == false)
			throw new ValidacionException()

		usuario.validar()
		this.home.actualizar(usuario)
	}

	/**
	 * Proposito: Se ingresa al usuario ya registrado y validado al sistema Rentauto.
	 */
	def ingresarUsuario(String userName, String password) throws UsuarioNoExisteException{
		val usuario = this.home.getUsuarioPorNombreUsuario(userName)
		if (usuario == null)
			throw new UsuarioNoExisteException()

		if (usuario.password != password)
			throw new PasswordInvalidoException()

		return usuario
	}

	/**
	 * Proposito: Cambia el password de un usuario ya registrado y validado.
	 */
	def void cambiarPassword(String user, String password, String newPassword) throws PasswordInvalidoException{
		if (password == newPassword)
			throw new PasswordInvalidoException()

		val usuario = this.home.getUsuarioPorNombreUsuario(user)
		usuario.updatePassword(newPassword)

		this.home.actualizar(usuario)
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	def void guardarUsuario(Usuario u)
	{
		SessionManager.runInSession[|
			
			this.home.save(u)
		]
	}
	
	def getUsuarioPorId(int id){
		SessionManager.runInSession[|
			this.home.get(id)
		]		
	}
}
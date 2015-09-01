package ar.edu.unq.epers.model

import exceptions.UsuarioNoExisteException
import exceptions.UsuarioYaExisteException
import exceptions.ValidacionException
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioUsuario implements EnviadorDeMails{
	Home home
	Mail mail
	
	/*Proposito: Registra a un nuevo usuario en el sistema RentAuto. */
	/*DUDA: serviciousuario tiene que implementar la interfaz de enviadordemails? o como interpretarlo??*/
	def void registrarUsuario(Usuario usuario) throws UsuarioYaExisteException
	{
		this.home.registrarUsuario(usuario)
		/*val claveValidacion = new Random()
		val mail = new Mail => [ 

			body = "Ayudenos a mejorar la seguridad de nuestro sistema verificando tu direccion de mail. Aqui tiene su codigo de validacion: " + claveValidacion
			subject = "Por favor valida tu mail"
			to = usuario.email
			from = "rentauto@rentauto.com.ar"
		]*/

		mail.enviarMail(mail)
	}

	/*Proposito: Se valida la cuenta del usuario registrado. */
	def void validarCuenta(String codigoValidacion) throws ValidacionException
	{
		val usuario = this.home.getUsuarioPorCodigo(codigoValidacion)

		if (usuario == null)
			throw new ValidacionException()

		usuario.validar()

		this.home.actualizar(usuario)
	}

	def ingresarUsuario(String userName, String password) throws UsuarioNoExisteException
	{
		home.ingresarUsuarioHome(userName, password)
	}

	def cambiarPassword(String user, String password, String newPassword) {
		home.cambiarPasswordHome(user, password, newPassword)
	}
	
	override enviarMail(Mail m) {
		
	}
	
}
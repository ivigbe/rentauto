package ar.edu.unq.epers.model

import org.junit.Before
import static org.mockito.Mockito.*;
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioUsuarioTest {

	EnviadorDeMails enviadorMails

	Mail mail

	Home home

	ServicioUsuario servicio
	
	Usuario u1

	@Before
	def void setUp() {
		this.home = new Home()

		this.servicio = new ServicioUsuario()
		
		this.u1 = new Usuario => [
			
			nombre = "Manolo"
			apellido = "Perez"
			nombreUsuario = "ManoloPerez"
			email = "manolo@gmail.com"
			fechaNacimiento = new Date(1994, 04, 06)
			password = "pepe"
			validado = false
		]
		
		// Mock instances:
		this.enviadorMails = mock(EnviadorDeMails)
		this.mail = mock(Mail)

	// Mock methods: averiguar como se mockea un metodo void (enviarMail())
	}

	@Test
	def void testEnviarMail() {
	}

	@Test
	def void testRegistrarUsuario() {
		
		servicio.registrarUsuario(u1)
		assertEquals(u1.validado, false)
	}
	
	@Test
	def void testCambiarPassword()
	{
		servicio.cambiarPassword(u1.nombreUsuario, u1.password, "pepito")
		assertEquals(u1.password, "pepito")
	}
}
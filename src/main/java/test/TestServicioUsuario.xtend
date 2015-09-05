package test

import org.junit.Before
import static org.mockito.Mockito.*;
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors

<<<<<<< HEAD:src/test/java/ar/edu/unq/epers/model/ServicioUsuarioTest.xtend
@Accessors
class ServicioUsuarioTest {
=======
import ar.edu.unq.epers.model.Home
import ar.edu.unq.epers.model.ServicioUsuario
import ar.edu.unq.epers.model.EnviadorDeMails
import ar.edu.unq.epers.model.Mail
import ar.edu.unq.epers.model.Usuario


class TestServicioUsuario {
>>>>>>> cff2ff13e6e20051231eed44730a06e0b27ad2a2:src/main/java/test/TestServicioUsuario.xtend

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
		assertFalse(u1.validado)
	}
	
	
	@Test
	def void testGenerarClave() {

		val clave = servicio.generarClave(u1)
		assertTrue(clave == "ManoloPerezmanolo@gmail.com")
	}
	
		@Test
	def void testI() {

		val clave = servicio.generarClave(u1)
		assertTrue(clave == "ManoloPerezmanolo@gmail.com")
	}
	
	/*@Test
	def void testCambiarPassword()
	{
		servicio.cambiarPassword(u1.nombreUsuario, u1.password, "pepito")
		assertEquals(u1.password, "pepito")
	}*/
}
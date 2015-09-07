package test

import org.junit.Before
import static org.mockito.Mockito.*;
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date

import ar.edu.unq.epers.model.Home
import ar.edu.unq.epers.model.ServicioUsuario
import ar.edu.unq.epers.model.EnviadorDeMails
import ar.edu.unq.epers.model.Mail
import ar.edu.unq.epers.model.Usuario
import exceptions.UsuarioYaExisteException

class TestServicioUsuario {

	EnviadorDeMails enviadorMails

	Mail mail

	Home home

	ServicioUsuario servicio
	
	Usuario u1
	Usuario u2

	@Before
	def void setUp() {
		this.home = new Home()

		this.servicio = new ServicioUsuario (home)
		
		this.u1 = new Usuario => [
			
			nombre = "Manolo"
			apellido = "Perez"
			nombreUsuario = "ManoloPerez"
			email = "manolo@gmail.com"
			fechaNacimiento = new Date(2015, 06, 06)
			password = "pepe"
			validado = false
		]
		
		this.u2 = new Usuario => [
			
			nombre = "juan"
			apellido = "pogba"
			nombreUsuario = "jp"
			email = "pogba@gmail.com"
			fechaNacimiento = new Date(1990, 12, 06)
			password = "gol"
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

		servicio.registrarUsuario(u2)
		assertFalse(u2.validado)
	}
	
	@Test(expected = UsuarioYaExisteException)
	def void testExpcepcionUsuarioYaRegistrado() {

		servicio.registrarUsuario(u1)
		assertFalse(u1.validado)
	}
	
	
	@Test
	def void testGenerarClave() {

		val clave = servicio.generarClave(u1)
		assertTrue(clave == "ManoloPerezmanolo@gmail.com")
	}
	
	@Test
	def void testCambiarPassword()
	{
		servicio.cambiarPassword(u1.nombreUsuario, u1.password, "linux")
		val usuario = this.home.getUsuarioPorNombreUsuario("ManoloPerez")
		assertTrue(usuario.password == "linux")
	}
}
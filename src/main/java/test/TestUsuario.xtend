package test

import ar.edu.unq.epers.model.Usuario
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date

class TestUsuario {

	Usuario u

	@Before
	def void setUp() {
		u = new Usuario => [

			nombre = "Alejandro"
			apellido = "Lobos"
			nombreUsuario = "al"
			email = "alobos@gmail.com"
			fechaNacimiento = new Date(1980, 05, 10)
			password = "lobos123"
			validado = false
		]
	}

	@Test
	def void testValidar() {
		u.validar()

		assertEquals(u.validado, true)
	}

	@Test
	def void testUpdatePassword() {
		u.upDatePassword("lobito")

		assertEquals(u.password, "lobito")
	}
}
package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomePublicacion
import ar.edu.unq.epers.homes.HomeUsuario
import ar.edu.unq.epers.model.CalificacionAuto
import ar.edu.unq.epers.model.Mensaje
import ar.edu.unq.epers.model.NivelVisibilidadAuto
import ar.edu.unq.epers.model.PublicacionAuto
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.model.Usuario
import java.util.Date
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestServicioRedSocial {
	Usuario u1
	Usuario u2
	Usuario u3
	Usuario u4
	Mensaje m
	ServicioUsuario service
	HomeUsuario home
	ServicioRedSocial redSocial
	HomePublicacion perfil
	PublicacionAuto publicacionPrivada
	PublicacionAuto publicacionPublica
	PublicacionAuto publicacionAmigos
	Reserva r1
	Reserva r2
	Reserva r3
	
	@Before
	def void setUp(){
		//Red Social
		u1 = new Usuario("Homero", "Simpson", "fv", "1234", "homero@gmail.com", new Date())
		u2 = new Usuario("Bart", "Simpson", "ib", "3456", "bart@gmail.com", new Date())
		u3 = new Usuario("Lisa", "Simpson", "jp", "4567", "lisa@gmail.com", new Date())
		u4 = new Usuario("Marge", "Simpson", "ManoloPerez", "7812", "marge@gmail.com", new Date())
		m = new Mensaje("Hola Mundo!")
		perfil = new HomePublicacion()
		redSocial = new ServicioRedSocial(perfil)
		home = new HomeUsuario()
		service = new ServicioUsuario(home, redSocial)
		service.guardarUsuario(u1)
		service.guardarUsuario(u2)
		service.guardarUsuario(u3)
		service.guardarUsuario(u4)
		redSocial.agregarComoAmigo(u1, u2)
		redSocial.agregarComoAmigo(u2, u3)
		redSocial.agregarComoAmigo(u2, u4)
		
		redSocial.enviarMensajeA(u2, u4, m)
		
		//COMENTARIOS
		r1 = new Reserva(1)
		r2 = new Reserva(2)
		r3 = new Reserva(3)
		
		publicacionPublica = new PublicacionAuto("malisimo el auto", u2.nombreUsuario, r1.numeroSolicitud,
												CalificacionAuto.MALO, NivelVisibilidadAuto.PUBLICO)
		publicacionPrivada = new PublicacionAuto("me lo guardo", u2.nombreUsuario, r2.numeroSolicitud,
												CalificacionAuto.REGULAR, NivelVisibilidadAuto.PRIVADO)
		publicacionAmigos = new PublicacionAuto("solo para amigos", u2.nombreUsuario, r3.numeroSolicitud,
												CalificacionAuto.EXCELENTE, NivelVisibilidadAuto.SOLOAMIGOS)
		redSocial.ingresarPublicacionReserva(publicacionPublica)
		redSocial.ingresarPublicacionReserva(publicacionPrivada)
		redSocial.ingresarPublicacionReserva(publicacionAmigos)
	}
	
	@Test
	def void testObtengoAMisAmigos(){
		
		val amigosU1 = redSocial.obtenerAmigos(u1)
		val amigosU2 = redSocial.obtenerAmigos(u2)
		
		assertEquals(u2.nombreUsuario, amigosU1.head.nombreUsuario)
		assertEquals(u4.nombreUsuario, amigosU2.head.nombreUsuario)
	}
	
	@Test
	def void testPreguntoSiSonAmigos(){
		
		assertTrue(redSocial.sonAmigos(u2, u3))
	}
	
	@Test
	def void testMandoMsjeAMisAmigos(){
		
		val mensajesU2 = redSocial.obtenerMensajesEnviados(u2)
		
		assertTrue(mensajesU2.contains(m))
	}
	
	@Test
	def void testVeoMsjeDeMisAmigos(){
		
		val mensajesU4 = redSocial.obtenerMensajesRecibidos(u4)
		
		assertTrue(mensajesU4.contains(m))
	}
	
	@Test
	def void testObtengoAmigosDeMisAmigos(){
		
		val conectadasU1 = redSocial.obtenerPersonasConectadas(u1)
		
		assertTrue(conectadasU1.contains(u2))
		assertTrue(conectadasU1.contains(u3))
		assertTrue(conectadasU1.contains(u4))
	}
	
	@Test
	def void testCalificoUnAutoQueAlquileExcelente(){
		
		assertTrue(redSocial.verPublicaciones(u2,u2).contains(publicacionPrivada))//PORQUE DA ASSERTION ERROR!!!!!???????????
		
	}
	
	@Test
	def void testEstablezcoUnNivelDeVisibilidadAUnaPublicacion(){
		
		assertEquals(NivelVisibilidadAuto.SOLOAMIGOS, publicacionAmigos.visibilidad)
	}
	
	@Test
	def void testUnUsuarioVeElPerfilDeUnUsuarioAmigo(){
		
		assertTrue(redSocial.verPublicaciones(u1,u2).contains(publicacionAmigos))
		assertTrue(redSocial.verPublicaciones(u1,u2).contains(publicacionPublica))
		assertFalse(redSocial.verPublicaciones(u1,u2).contains(publicacionPrivada))
	}
	
	@Test
	def void testUnUsuarioVeElPerfilDeUnUsuarioDelQueNoEsAmigo(){
		
		assertTrue(redSocial.verPublicaciones(u1,u3).contains(publicacionPublica))
		assertFalse(redSocial.verPublicaciones(u1,u3).contains(publicacionPrivada))
		assertTrue(redSocial.verPublicaciones(u1,u3).contains(publicacionAmigos))
	}
}
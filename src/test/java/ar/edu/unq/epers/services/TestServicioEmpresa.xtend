package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.homes.HomeProvider
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Empresa
import org.junit.After
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestServicioEmpresa {

	GenericHome<Empresa> home
	ServicioEmpresa s
	Empresa e

	@Before
	def void setUp() {
		home = HomeProvider.empresaHome
		e = new Empresa("120", "Los Dragones magicos verdesColorados ", 4.2, 3)
		s = new ServicioEmpresa(home)

		s.guardarEmpresa(e)

	}

	@Test
	def void testParaGuardarEmpresa() {

		val res = s.getEmpresaPorId(e.empresaId)
		assertTrue(res.empresaId == e.empresaId)

	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
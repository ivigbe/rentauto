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
	ServicioEmpresa serviceEmpresa
	Empresa unaEmpresa

	@Before
	def void setUp() {
		home = HomeProvider.empresaHome
		unaEmpresa = new Empresa("120", "Los Dragones magicos verdesColorados ", 4.2, 3)
		serviceEmpresa = new ServicioEmpresa(home)

		serviceEmpresa.guardarEmpresa(unaEmpresa)

	}

	@Test
	def void testParaGuardarEmpresa() {

		val res = serviceEmpresa.getEmpresaPorId(unaEmpresa.empresaId)
		assertTrue(res.empresaId == unaEmpresa.empresaId)

	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}
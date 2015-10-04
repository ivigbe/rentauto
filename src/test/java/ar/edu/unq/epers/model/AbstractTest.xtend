package ar.edu.unq.epers.model

import org.junit.Before
import static org.mockito.Mockito.*

class AbstractTest {
	protected Auto auto
	protected Categoria categoriaFamiliar
	protected Ubicacion retiro
	protected Ubicacion aeroparque
	protected Usuario usuarioPrueba
	protected Usuario usuarioEmpresa
	protected Empresa empresa

	@Before
	def void setUp() {
		categoriaFamiliar = new Familiar
		retiro = new Ubicacion("Retiro")
		aeroparque = new Ubicacion("Aeroparque")
		auto = new Auto("Peugeot", "505", 1990, "XXX123", categoriaFamiliar, 100D, retiro)

		usuarioPrueba = mock(Usuario)
		usuarioEmpresa = mock(Usuario)
		
		empresa = new Empresa => [
			cuit = "30-11223344-90"
			nombreEmpresa = "Empresa Fantasmita"
			cantidadMaximaDeReservasActivas = 2
			valorMaximoPorDia = 1000D
		]
		
		empresa.usuarios.add(usuarioEmpresa)
	}
}

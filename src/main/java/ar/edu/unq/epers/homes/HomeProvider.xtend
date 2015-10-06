package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Empresa
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.model.Usuario

class HomeProvider {

	def static getAutoHome() {
		new HomeAuto()
	}

	def static getCategoriaHome() {
		new GenericHome(Categoria)
	}

	def static getUbicacionHome() {
		new GenericHome(Ubicacion)
	}

	def static getEmpresaHome() {
		new GenericHome(Empresa)
	}

	def static getUsuarioHome() {
		new GenericHome(Usuario)
	}

	def static getReservaHome() {
		new GenericHome(Reserva)
	}
}
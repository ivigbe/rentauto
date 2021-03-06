package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeAuto
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import java.util.Date
import java.util.List

class ServicioAuto {

	HomeAuto home
	ServicioCache cacheService

	new(HomeAuto h) {
		home = h
	}

	def void guardarAuto(Auto auto) {
		SessionManager.runInSession([
			home.save(auto)
		])
	}

	def getAutoPorId(int id) {
		SessionManager.runInSession [
			home.get(id)
		]
	}

	def autosPorUbicacion(Ubicacion uOrigen) {
		SessionManager.runInSession [|

			home.getAutosPorUbicacion(uOrigen)
		]
	}

	def autosPorCategoria(Categoria c) {
		SessionManager.runInSession [|

			home.getAutosPorCategoria(c)
		]
	}

	def autosPorMarca(String marca) {

		SessionManager.runInSession [|

			home.getAutosPorMarca(marca)
		]
	}

	def disponibilidadDeAutos(Ubicacion ubicacion, Date fechaInicio, Date fechaFin) {
		SessionManager.runInSession [|
			if (! (cacheService.estaEnCache(ubicacion, fechaInicio, fechaFin))) {
				val autos = home.getAutosDisponibles(ubicacion, fechaInicio, fechaFin)
				val autosACachear = obtenerIds(autos)
				cacheService.guardarAutosDisponibles(autosACachear, ubicacion, fechaInicio, fechaFin)
				return autos
			} else {

				val autos = cacheService.obtenerAutosDisponibles(ubicacion, fechaInicio, fechaFin)
				return autos
			}
		]
	}

	def obtenerIds(List<Auto> autos) {
		val ids = newArrayList()
		for (Auto a : autos) {
			ids.add(a.autoId)
		}
		return ids
	}

	def obtenerAutosPor(Ubicacion origen, Ubicacion destino, Date finicio, Date ffin, Categoria categoria) {
		SessionManager.runInSession [|
			home.obtenerAutosPor(origen, destino, finicio, ffin, categoria).filter [
				it.ubicacionParaDia(finicio) == origen
			].toList
		]
	}

}
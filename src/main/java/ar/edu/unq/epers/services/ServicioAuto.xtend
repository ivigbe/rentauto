package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.homes.SessionManager

class ServicioAuto {
	
	GenericHome<Auto> homeAuto
	GenericHome<Categoria> homeCategoria
	GenericHome<Ubicacion> homeUbicacion
	
	new(GenericHome<Auto> homeAuto, GenericHome<Categoria> homeCat, GenericHome<Ubicacion> homeUbi){
		
		this.homeAuto = homeAuto
		this.homeCategoria = homeCat
		this.homeUbicacion = homeUbi
		
	}
	
	def void crearAuto(String marca, String modelo, Integer anio, String patente, Integer categoriaId, Double costoBase, Integer ubicacionId, Integer id)
	{
		SessionManager.runInSession([
			var categoria = homeCategoria.get(categoriaId)
			var ubicacion = homeUbicacion.get(ubicacionId)
			var auto = new Auto(marca, modelo, anio, patente, categoria, costoBase, ubicacion, id)
			homeAuto.save(auto)
			auto
		])
	}
	
	def getAutoPorId(int id)
	{
		SessionManager.runInSession[
			
			homeAuto.get(id)
		]
	}
}
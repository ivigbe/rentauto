package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Categoria
import ar.edu.unq.epers.model.Ubicacion
import ar.edu.unq.epers.homes.SessionManager

class ServicioAuto {
	
	GenericHome<Auto> home
	
	new(GenericHome<Auto> h){
		
		home = h
	}
	
	def void crearAuto(String marca, String modelo, Integer anio, String patente, Categoria categoria, Double costoBase, Ubicacion ubicacionInicial, Integer id)
	{
		SessionManager.runInSession([
			var auto = new Auto(marca, modelo, anio, patente, categoria, costoBase, ubicacionInicial, id)
			home.save(auto)
			auto
		])
	}
	
	def getAutoPorId(int id)
	{
		SessionManager.runInSession[
			
			home.get(id)
		]
	}
}
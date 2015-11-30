package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeCache
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioCache {
	
	HomeCache home
	
	new(){}
	
	new(HomeCache h){
		
		this.home = h
	}
	
	
}
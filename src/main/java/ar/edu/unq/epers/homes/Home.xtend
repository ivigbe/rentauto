package ar.edu.unq.epers.homes

interface Home<T> {
	
	def T get(int id)
	
	def void save(T o)
}
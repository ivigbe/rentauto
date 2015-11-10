package ar.edu.unq.epers.model

class Mensaje {
	
	public String value
	public long fecha
	
	new(){}
	
	new(String msje){
		
		this.value = msje
	}
	
	@Override
	override def equals(Object m){
		if (this === m) {
			return true;
		}
		if (m instanceof Mensaje) {
			val other = m as Mensaje;
			return other.value == this.value;
		}
		return false;
	}
	
	@Override
	override hashCode(){
		this.value.hashCode
	}
}
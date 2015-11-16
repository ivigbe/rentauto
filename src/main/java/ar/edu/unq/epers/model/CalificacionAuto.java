package ar.edu.unq.epers.model;

import org.mongojack.ObjectId;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum CalificacionAuto {
	@ObjectId
	@JsonProperty("_id")
	
	EXCELENTE, BUENO, REGULAR, MALO
}

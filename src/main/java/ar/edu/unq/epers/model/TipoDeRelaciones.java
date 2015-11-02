package ar.edu.unq.epers.model;

import org.neo4j.graphdb.RelationshipType;

public enum TipoDeRelaciones implements RelationshipType {
	AMIGO, MENSAJE_A, MENSAJE_DE
}
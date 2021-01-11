package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Localizaciones")
public class Localizaciones {
	
	@Id
	private String id;
	
	private String id_preguntas;
	private String latitud;
	private String longitud;
	
	public Localizaciones(String id, String id_preguntas, String latitud, String longitud) {
		super();
		this.id = id;
		this.id_preguntas = id_preguntas;
		this.latitud = latitud;
		this.longitud = longitud;
	}

	public Localizaciones() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId_preguntas() {
		return id_preguntas;
	}

	public void setId_preguntas(String id_preguntas) {
		this.id_preguntas = id_preguntas;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	
	
	
	

}

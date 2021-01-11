package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Localizacion_usuarios")
public class Localizacion_usuarios {

	@Id
	private String id;
	
	private String id_usuarios;
	
	private String latitud;
	
	private String longitud;

	public Localizacion_usuarios(String id, String id_usuarios, String latitud, String longitud) {
		super();
		this.id = id;
		this.id_usuarios = id_usuarios;
		this.latitud = latitud;
		this.longitud = longitud;
	}

	public Localizacion_usuarios() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId_usuarios() {
		return id_usuarios;
	}

	public void setId_usuarios(String id_usuarios) {
		this.id_usuarios = id_usuarios;
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

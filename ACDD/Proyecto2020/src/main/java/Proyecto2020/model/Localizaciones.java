package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Localizaciones")
public class Localizaciones {
	
	@Id
	private String id;
	
	private String nombre;
	private String latitud;
	private String longitud;
	private String id_ruta;
		
	public Localizaciones() {
		super();
	}

	public Localizaciones(String id, String nombre, String latitud, String longitud, String id_ruta) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.latitud = latitud;
		this.longitud = longitud;
		this.id_ruta = id_ruta;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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

	public String getId_ruta() {
		return id_ruta;
	}

	public void setId_ruta(String id_ruta) {
		this.id_ruta = id_ruta;
	}
	
	
	
	
	

}

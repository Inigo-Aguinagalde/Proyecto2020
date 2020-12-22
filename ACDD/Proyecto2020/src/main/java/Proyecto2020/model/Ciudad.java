package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Ciudades")
public class Ciudad {


	@Id
	private String id;

	private String name;

	private String latitud;

	private String longitud;

	public Ciudad() {

	}

	public Ciudad(String id, String name, String latitud, String longitud) {
		super();
		this.id = id;
		this.name = name;
		this.latitud = latitud;
		this.longitud = longitud;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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

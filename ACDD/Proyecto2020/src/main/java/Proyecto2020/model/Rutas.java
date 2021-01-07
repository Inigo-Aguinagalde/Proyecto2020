package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Rutas")
public class Rutas {

	@Id
	private String id;
	
	private String nombre;
	
	private String tiempo;
	
	private String puntos;

	public Rutas() {
		super();
	}

	public Rutas(String id, String nombre, String tiempo, String puntos) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.tiempo = tiempo;
		this.puntos = puntos;
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

	public String getTiempo() {
		return tiempo;
	}

	public void setTiempo(String tiempo) {
		this.tiempo = tiempo;
	}

	public String getPuntos() {
		return puntos;
	}

	public void setPuntos(String puntos) {
		this.puntos = puntos;
	}
	
	
	
}

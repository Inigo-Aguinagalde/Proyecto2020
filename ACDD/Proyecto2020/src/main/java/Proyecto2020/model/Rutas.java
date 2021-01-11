package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Rutas")
public class Rutas {

	@Id
	private String id;
	
	private String nombre;
	
	private String duracion;
	
	private String id_Localizaciones;

	private String ciudad;
	
	private int km;

	public Rutas(String id, String nombre, String duracion, String id_Localizaciones, String ciudad, int km) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.duracion = duracion;
		this.id_Localizaciones = id_Localizaciones;
		this.ciudad = ciudad;
		this.km = km;
	}

	public Rutas() {
		super();
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

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public String getId_Localizaciones() {
		return id_Localizaciones;
	}

	public void setId_Localizaciones(String id_Localizaciones) {
		this.id_Localizaciones = id_Localizaciones;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public int getKm() {
		return km;
	}

	public void setKm(int km) {
		this.km = km;
	}
	
	
	
}

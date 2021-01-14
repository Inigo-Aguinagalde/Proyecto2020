package Proyecto2020.model;

import java.lang.reflect.Array;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Rutas")
public class Rutas {

	@Id
	private String id;

	private String nombre;

	private String duracion;

	private List lista_puntos;

	private String ciudad;

	private int km;

	private double puntos;

	public Rutas(String nombre, String duracion, String ciudad, int km) {
		super();
		this.nombre = nombre;
		this.duracion = duracion;
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

	public List getlista_puntos() {
		return lista_puntos;
	}

	public void add_location(String id_Localizaciones) {
		this.lista_puntos.add(id_Localizaciones);
	}

	public void remove_location(String id_Localizaciones){
		this.lista_puntos.remove(id_Localizaciones);
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

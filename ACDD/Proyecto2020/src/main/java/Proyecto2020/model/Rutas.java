package Proyecto2020.model;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Rutas")
public class Rutas {

	@Id
	private String id;

	private String nombre;

	private String duracion;

	private ArrayList<String> lista_puntos;

	private String ciudad;

	private int km;

	private int puntos;

	private String descripcion;


	public Rutas(String id, String nombre, ArrayList lista_puntos,String duracion, String ciudad, int km, int puntos) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.duracion = duracion;
		this.lista_puntos = lista_puntos;
		this.ciudad = ciudad;
		this.km = km;
		this.puntos = puntos;
	}



	public Rutas() {
		super();
	}

	public Rutas(String nombre, ArrayList lista_puntos, String duracion, String ciudad, int km, int puntos,String descripcion) {
		this.nombre=nombre;
		this.lista_puntos=lista_puntos;
		this.duracion=duracion;
		this.ciudad=ciudad;
		this.km=km;
		this.puntos=puntos;
		this.descripcion=descripcion;
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

	public ArrayList getLista_puntos() {
		return lista_puntos;
	}

	public void setLista_puntos(ArrayList<String> lista_puntos) {
		this.lista_puntos = lista_puntos;
	}

	public int getKm() {
		return km;
	}

	public void setKm(int km) {
		this.km = km;
	}

	public int getPuntos() {
		return puntos;
	}

	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}






}

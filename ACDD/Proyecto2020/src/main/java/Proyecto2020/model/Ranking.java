package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Ranking")
public class Ranking {

	@Id
	private String id;
	
	private double puntos;
	
	private String idUsuarios;
	
	private String idRuta;

	public Ranking(double puntos, String id_usuarios, String id_ruta) {
		super();
		this.puntos = puntos;
		this.idUsuarios = id_usuarios;
		this.idRuta = id_ruta;
	}

	public Ranking() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getPuntos() {
		return puntos;
	}

	public void setPuntos(double puntos) {
		this.puntos = puntos;
	}

	public String getId_usuarios() {
		return id_usuarios;
	}

	public void setId_usuarios(String id_usuarios) {
		this.id_usuarios = id_usuarios;
	}

	public String getId_ruta() {
		return id_ruta;
	}

	public void setId_ruta(String id_ruta) {
		this.id_ruta = id_ruta;
	}
	
	
	
}

package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Ranking")
public class Ranking {

	@Id
	private String id;

	private double puntuacion;

	private String idUsuario;

	private String idRuta;

	public Ranking(double puntos, String id_usuarios, String id_ruta) {
		super();
		this.puntuacion = puntos;
		this.idUsuario = id_usuarios;
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
		return puntuacion;
	}

	public void setPuntos(double puntos) {
		this.puntuacion = puntos;
	}

	public String getId_usuarios() {
		return idUsuario;
	}

	public void setId_usuarios(String id_usuarios) {
		this.idUsuario = id_usuarios;
	}

	public String getId_ruta() {
		return idRuta;
	}

	public void setId_ruta(String id_ruta) {
		this.idRuta = id_ruta;
	}



}

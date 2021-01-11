package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Ranking")
public class Ranking {

	@Id
	private String id;
	
	private int puntos;
	
	private String id_usuarios;
	
	private String id_ruta;

	public Ranking(String id, int puntos, String id_usuarios, String id_ruta) {
		super();
		this.id = id;
		this.puntos = puntos;
		this.id_usuarios = id_usuarios;
		this.id_ruta = id_ruta;
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

	public int getPuntos() {
		return puntos;
	}

	public void setPuntos(int puntos) {
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

package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Localizaciones")
public class Localizaciones {

	@Id
	private String _id;

	private String latitud;
	private String longitud;
	private String nombre;
	private String pregunta;
	private String respuesta1;
	private String respuesta2;
	private String respuesta3;
	private int solucion;

	public Localizaciones(String id, String latitud, String longitud,String nombre,String pregunta,String respuesta1,String respuesta2,String respuesta3,int solucion) {
		super();
		this._id = id;
		this.latitud = latitud;
		this.longitud = longitud;
		this.nombre = nombre;
		this.pregunta = pregunta;
		this.respuesta1 = respuesta1;
		this.respuesta2 = respuesta2;
		this.respuesta3 = respuesta3;
		this.solucion = solucion;
	}

	public Localizaciones(){
		super();
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPregunta() {
		return pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public String getRespuesta1() {
		return respuesta1;
	}

	public void setRespuesta1(String respuesta1) {
		this.respuesta1 = respuesta1;
	}

	public String getRespuesta2() {
		return respuesta2;
	}

	public void setRespuesta2(String respuesta2) {
		this.respuesta2 = respuesta2;
	}

	public String getRespuesta3() {
		return respuesta3;
	}

	public void setRespuesta3(String respuesta3) {
		this.respuesta3 = respuesta3;
	}

	public int getSolucion() {
		return solucion;
	}

	public void setSolucion(int solucion) {
		this.solucion = solucion;
	}





}

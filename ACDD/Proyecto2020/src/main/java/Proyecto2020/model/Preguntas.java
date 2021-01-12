package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Preguntas")
public class Preguntas {

	@Id
	private String id;

	private String pregunta;

	private String respuesta;

	private String respuesta2;

	private String respuesta3;

	public Preguntas() {
		super();
	}

	public Preguntas(String id, String pregunta, String respuesta, String respuesta2, String repuesta3) {
		super();
		this.id = id;
		this.pregunta = pregunta;
		this.respuesta = respuesta;
		this.respuesta2 = respuesta2;
		this.respuesta3 = repuesta3;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPregunta() {
		return pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public String getRespuesta() {
		return respuesta;
	}

	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
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



}

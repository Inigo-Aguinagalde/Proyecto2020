package Proyecto2020.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Usuarios")
public class Usuarios {

	@Id
	private String id;

	private String name;

	private String password;

	private String email;

	private boolean admin;

	private String rutaActiva ;

	public Usuarios(String name, String email, String password) {
		super();
		this.name = name;
		this.password = password;
		this.email= email;
		this.admin = false;
		this.rutaActiva = "";
	}

	public Usuarios() {
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getAdmin(){
		return admin;
	}

	public void setAdmin(boolean reversa){
		this.admin = reversa;
	}

	public void setRutaActiva(String id_ruta){
		this.rutaActiva = id_ruta;
	}

	public String getRutaActiva() {
		return rutaActiva;
	}

}

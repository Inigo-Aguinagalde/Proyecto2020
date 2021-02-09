package Proyecto2020.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Proyecto2020.Repository.RutasRepository;
import Proyecto2020.Repository.UsuariosRepository;
import Proyecto2020.model.Rutas;
import Proyecto2020.model.Usuarios;

@RequestMapping("/usuario")
@RestController
public class UsuarioController {

	@Autowired
	private UsuariosRepository RR;

	///////		MOSTRAR TODOS LOS USUARIOS	////////
	
	@GetMapping("/todas")
	public List<Usuarios> getUsuario(){

		return RR.findAll();
	}

	///////		REGISTRO DE USUARIO, AÑADIR NUEVO USUARIO	////////
	
	@PostMapping("/add")
	public boolean addUsuario(@RequestParam String username, @RequestParam String email, @RequestParam String password) {

		boolean añadido = false;

		Usuarios s = new Usuarios(username,email,password);
		Long comprobacionEmail = RR.countByEmail(email);

		if(comprobacionEmail == 0){
			RR.save(s);
			System.out.println("guardado con exito");
			añadido = true;
		}

		System.out.println("finalizar "+comprobacionEmail);
		return añadido;

	}

	///////		UPDATE DE UN USUARIO SOLO TIENE UN CAMPO OBLIGATORIO -ID-	////////
	
	@RequestMapping("/updateUsuario")
	public @ResponseBody Usuarios updateUser(@RequestParam String id, String username, String email, String password) {

		Usuarios s = RR.findById(id).orElse(null);

		if(username!=null) {
			s.setName(username);
		}else if(email!=null) {
			s.setEmail(email);
		}else if(password!=null) {
			s.setPassword(password);
		}
		RR.save(s);

		return s;
	}

	///////		LOGIN DE USUARIO PARA LA APLICACIÓN MOVIL	////////
	
	@RequestMapping("/login")
	public @ResponseBody Usuarios username(@RequestParam String email ,@RequestParam String password){

		Usuarios s = RR.findByEmail(email).orElse(null);
		Usuarios s_vuelta = new Usuarios();
		if(s!=null){
			if(s.getPassword().equals(password)){
				s_vuelta.setEmail(s.getEmail());
				s_vuelta.setId(s.getId());
				s_vuelta.setName(s.getName());
			}
		}

		return s_vuelta;
	}

	///////		LOGIN DEL ADMIN PARA LA APLICACIÓN DE ELECTRON	////////
	
	@RequestMapping("/loginAdmin")
	public @ResponseBody boolean admin(@RequestParam String email ,@RequestParam String password){

		Usuarios s = RR.findByEmail(email).orElse(null);
		boolean login = false;

		if(s==null){
			login=false;
		}else{
			if(s.getPassword().equals(password) && s.getAdmin()==true){
				login=true;
			}
		}

		return login;
	}

	///////		INSERTAR RUTA ACTIVA A UN USUARIO MEDIANTE -ID_USUARIO-	Y -ID_RUTA-		////////
	
	@RequestMapping("/updateRutaActiva")
	public @ResponseBody Usuarios updateRutaActiva(@RequestParam String id_ruta ,@RequestParam String id_user){

		Usuarios s = RR.findById(id_user).orElse(null);
		s.setRutaActiva(id_ruta);
		RR.save(s);

		return s;
	}

	///////		ELIMINAR LA RUTA ACTIVA DE UN USUARIO MEDIANTE -ID-	////////
	
	@RequestMapping("/deleteRutaActiva")
	public @ResponseBody Usuarios deleteRutaActiva(@RequestParam String id_user){

		Usuarios s = RR.findById(id_user).orElse(null);
		s.setRutaActiva("");
		RR.save(s);

		return s;
	}
	
	///////		ELIMINAR UN USUARIO MEDIANTE -ID-	////////
	
	@RequestMapping("/delete")
	public @ResponseBody String deleteUser(@RequestParam String id) {
		
		String ejecutado;
		Usuarios s = RR.findById(id).orElse(null);
		RR.delete(s);
		Usuarios comprobacion = RR.findById(id).orElse(null);
		if(comprobacion == null) {
			ejecutado = "correcto";
		}else {
			ejecutado = "No se ha podido eliminar";
		}
		return ejecutado;
	}

}

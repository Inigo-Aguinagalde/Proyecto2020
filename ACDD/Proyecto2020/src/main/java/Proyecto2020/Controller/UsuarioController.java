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

	@GetMapping("/todas")
	public List<Usuarios> getUsuario(){

		return RR.findAll();
	}

	@PostMapping("/añadir")
	public boolean añadirUsuario(@RequestParam String username, @RequestParam String email, @RequestParam String password) {

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

	@RequestMapping("/updateUsuario")
	public @ResponseBody Usuarios updateRuta(@RequestParam String id, String username, String email, String password) {

		Usuarios s = RR.findById(id).orElse(null);

		if(username==null) {
			s.getName();
		}else if(email==null) {
			s.getEmail();
		}else if(password==null) {
			s.getPassword();
		}

		return s;
	}

	@RequestMapping("/login")
	public @ResponseBody boolean username(@RequestParam String email ,@RequestParam String password){

		Usuarios s = RR.findByEmail(email).orElse(null);
		boolean login = false;

		if(s==null){
			login=false;
		}else{
			if(s.getPassword().equals(password)){
				login=true;
			}
		}

		return login;
	}

	@GetMapping("/detalles")
	public Usuarios detalles(@RequestParam String email){
		Usuarios s = RR.findByEmail(email).orElse(null);
		return s;
	}
}

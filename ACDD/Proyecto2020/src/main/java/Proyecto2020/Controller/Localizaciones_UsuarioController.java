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

import Proyecto2020.Repository.Localizacion_usuariosRepository;
import Proyecto2020.model.Localizacion_usuarios;


@RequestMapping("/usuarioGPS")
@RestController
public class Localizaciones_UsuarioController {

	@Autowired
	private Localizacion_usuariosRepository RR;
	
	@GetMapping("/todas")
	public List<Localizacion_usuarios> get(){
				
		return RR.findAll();
	}
	

	
	@RequestMapping("/update")
	public @ResponseBody Localizacion_usuarios updateRuta(@RequestParam String id, String id_usuario , String latitud , String longitud ) {
		
		Localizacion_usuarios gps= RR.findById(id).orElse(null);
		
		if(id_usuario==null) {
			gps.getId_usuarios();
		}else if(latitud==null) {
			gps.getLatitud();
		}else if(longitud==null) {
			gps.getLongitud();
		}
		
		return gps;
	}
	
}

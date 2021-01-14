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
import Proyecto2020.model.Rutas;

@RequestMapping("/rutas")
@RestController
public class RutasController {

	@Autowired
	private RutasRepository RR;

	@GetMapping("/todas")
	public List<Rutas> getRutas(){

		return RR.findAll();
	}

	@PostMapping("/añadir")
	public Rutas añadirRuta(@RequestParam String nombre, @RequestParam String duracion, @RequestParam String id_localizaciones, @RequestParam int km, @RequestParam String ciudad) {

		Rutas r = new Rutas(nombre,duracion,ciudad,km);

		return RR.save(r);
	}

	@RequestMapping("/updateCiudad")
	public @ResponseBody Rutas updateRuta(@RequestParam String id, String nombre, String duracion, String id_localizaciones,int km,String ciudad) {

		Rutas r = RR.findById(id).orElse(null);

		if(nombre==null) {
			r.getNombre();
		}else if(duracion==null) {
			r.getDuracion();
		}else if(id_localizaciones==null) {
			r.getId_Localizaciones();
		}else if(km==0) {
			r.getKm();
		}else if(ciudad==null) {
			r.getCiudad();
		}

		return r;
	}

}

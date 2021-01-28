package Proyecto2020.Controller;


import java.util.ArrayList;
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
	public Rutas añadirRuta(@RequestParam String nombre, @RequestParam String duracion,@RequestParam ArrayList<String> lista_puntos,@RequestParam String ciudad,@RequestParam int km,@RequestParam int puntos) {

		Rutas r = new Rutas(nombre,ciudad, lista_puntos,duracion,ciudad,km,puntos);

		return RR.save(r);
	}

	@GetMapping("/findById")
	public Rutas findById(@RequestParam String id){
		Rutas r = RR.findById(id).orElse(null);
		return r;
	}

	/*@RequestMapping("/updateCiudad")
	public @ResponseBody Rutas updateRuta(@RequestParam String id, String nombre, String duracion, String id_localizaciones,int km,String ciudad) {

		Rutas r = RR.findById(id).orElse(null);

		if(nombre==null) {
			r.getNombre();
		}else if(duracion==null) {
			r.getDuracion();
		}else if(lista_puntos==null) {
			r.getLista_puntos();
		}else if(km==0) {
			r.getKm();
		}else if(ciudad==null) {
			r.getCiudad();
		}

		return r;
	}*/




}

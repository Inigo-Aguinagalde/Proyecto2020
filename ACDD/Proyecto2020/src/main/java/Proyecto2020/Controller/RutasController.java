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
import Proyecto2020.model.Usuarios;

@RequestMapping("/rutas")
@RestController
public class RutasController {

	@Autowired
	private RutasRepository RR;

	///////		MOSTRAR TODAS LAS RUTAS DEL SISTEMA		////////
	
	@GetMapping("/todas")
	public List<Rutas> getRutas(){

		return RR.findAll();
	}
	
	///////		BUSCAR RUTA MEDIANTE -ID-	////////
	
	@GetMapping("/ruta")
	public Rutas detalles(@RequestParam String id){
		Rutas r = RR.findById(id).orElse(null);
		return r;
	}

	///////		AÑADIR NUEVA RUTA	////////
	
	@PostMapping("/add")
	public Rutas addRuta(@RequestParam String nombre, @RequestParam String duracion,@RequestParam String ciudad,@RequestParam int km,@RequestParam int puntos) {

		Rutas r = new Rutas(nombre,ciudad, duracion,ciudad,km,puntos);
		RR.save(r);
		
		return r;
	}

	///////		AÑADIR LOCALIZACION A UNA RUTA	////////
	
	@RequestMapping("/AddLocations")
	public @ResponseBody Rutas addLocations(@RequestParam String id_ruta, @RequestParam String id_location) {
		
		Rutas r = RR.findById(id_ruta).orElse(null);
		
		ArrayList<String> lista_nueva = r.getLista_puntos();
		lista_nueva.add(id_location);
		r.setLista_puntos(lista_nueva);
		RR.save(r);
		
		return r;
	}
	
	
	///////		ELIMINAR LOCALIZACION A UNA RUTA	////////
	
	@RequestMapping("/RemoveLocations")
	public @ResponseBody Rutas RemoveLocation(@RequestParam String id_ruta, @RequestParam String id_location) {
		
		Rutas r = RR.findById(id_ruta).orElse(null);
		
		ArrayList<String> lista_nueva = r.getLista_puntos();
		lista_nueva.remove(id_location);
		r.setLista_puntos(lista_nueva);
		RR.save(r);
		
		return r;
	}
	
	///////		MODIFICAR UNA RUTA EN CONCRETO	////////
	
	@RequestMapping("/updateRuta")
	public @ResponseBody Rutas updateRuta(@RequestParam String id, String nombre, String duracion,double km,String ciudad) {

		Rutas r = RR.findById(id).orElse(null);

		if(nombre!=null) {
			r.setNombre(nombre);
		}else if(duracion!=null) {
			r.setDuracion(duracion);
		}else if(km!=0) {
			r.setKm(km);
		}else if(ciudad!=null) {
			r.setCiudad(ciudad);
		}
		
		RR.save(r);

		return r;
	}

	///////		ELIMINAR UNA RUTA EN CONCRETO	////////
	
	@RequestMapping("/DeleteRuta")
	public @ResponseBody String deleteRuta(@RequestParam String id) {

		String comprobacion;
		Rutas r = RR.findById(id).orElse(null);
		RR.delete(r);
		Rutas c = RR.findById(id).orElse(null);
		if(c == null) {
			comprobacion = "se ha eliminado";
		}else {
			comprobacion = "no se ha podido eliminar";
		}

		return comprobacion;
	}


}

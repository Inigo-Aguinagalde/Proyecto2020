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
	public List<Rutas>getRutas(){
				
		return RR.findAll();
	}
	
	@PostMapping("/añadir")
	public Rutas añadirRuta(@RequestBody Rutas r) {
		
		
		return RR.save(r);
	}
	
	@RequestMapping("/updateCiudad")
	public @ResponseBody Rutas updateRuta(@RequestParam String id, String nombre, String tiempo, String puntos) {
		
		Rutas r = RR.findById(id).orElse(null);
		
		if(nombre==null) {
			r.getNombre();
		}else if(tiempo==null) {
			r.getTiempo();
		}else if(puntos==null) {
			r.getPuntos();
		}
		
		return r;
	}
	
}

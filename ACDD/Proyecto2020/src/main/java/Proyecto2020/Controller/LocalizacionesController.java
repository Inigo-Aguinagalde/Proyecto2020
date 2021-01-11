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

import Proyecto2020.Repository.LocalizacionesRepository;
import Proyecto2020.model.Localizaciones;


@RequestMapping("/localizaciones")
@RestController
public class LocalizacionesController{

	@Autowired
	private LocalizacionesRepository RR;
	
	@GetMapping("/todas")
	public List<Localizaciones> getLocalizaciones(){
				
		return RR.findAll();
	}
	
	@PostMapping("/añadir")
	public Localizaciones añadirLocalizaciones(@RequestBody Localizaciones l ) {
		
		
		return RR.save(l);
	}
	
	@RequestMapping("/update")
	public @ResponseBody Localizaciones updateLocalizacion(@RequestParam String id, String id_preguntas, String latitud , String longitud ) {
		
		Localizaciones l = RR.findById(id).orElse(null);
		
		if(id_preguntas==null) {
			l.getId_preguntas();
		}else if(latitud==null) {
			l.getLatitud();
		}else if(longitud==null) {
			l.getLongitud();
		}
		
		return l;
	}
	
}

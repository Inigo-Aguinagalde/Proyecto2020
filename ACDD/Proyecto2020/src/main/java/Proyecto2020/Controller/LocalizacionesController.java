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

import Proyecto2020.Repository.LocalizacionesRepository;
import Proyecto2020.model.Localizaciones;
import Proyecto2020.model.Usuarios;


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

	@GetMapping("/findByID")
	public Localizaciones seleccionarLoc(@RequestParam String id){
		Localizaciones l = RR.findById(id).orElse(null);
		return l;
	}

	@RequestMapping("/update")
	public @ResponseBody Localizaciones updateLocalizacion(@RequestParam String id,double latitud, double longitud,String nombre,String pregunta,String respuesta1,String respuesta2,String respuesta3,int solucion ) {

		Localizaciones l = RR.findById(id).orElse(null);

		if(latitud != 0) {
			l.setLatitud(latitud);
		}
		if(longitud != 0) {
			l.setLongitud(longitud);
		}
		if(nombre != null) {
			l.setNombre(nombre);
		}
		if(pregunta != null) {
			l.setPregunta(pregunta);
		}
		if(respuesta1 != null) {
			l.setRespuesta1(respuesta1);
		}
		if(respuesta2 != null){
			l.setRespuesta2(respuesta2);
		}
		if(respuesta3 != null){
			l.setRespuesta3(respuesta3);
		}
		if(solucion == 0){
			l.setSolucion(solucion);
		}

		return l;
	}

}

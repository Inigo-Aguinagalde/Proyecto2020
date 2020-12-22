package Proyecto2020.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Proyecto2020.Repository.CiudadesRepository;
import Proyecto2020.model.Ciudad;



@RequestMapping("/ciudad")
@RestController
public class CiudadController {

	@Autowired
    private CiudadesRepository DR;


    @GetMapping("/todos")
    public List<Ciudad>getDepartamentos(){

        return DR.findAll();
    }


    @PostMapping("/añadir")
    public Ciudad añadirCiudad(@RequestBody Ciudad ciudad){


    	return DR.save(ciudad);
    }


    @RequestMapping(path="/updateAlumno")
	public @ResponseBody Ciudad updateCiudad (@RequestParam String id,String nombre, String latitud, String longitud) {

		Ciudad a = DR.findById(id).orElse(null);

		if(nombre == null) {
			nombre = a.getName();
		}
		if(latitud == null) {
			latitud = a.getLatitud();
		}
		if(longitud == null) {
			longitud =a.getLongitud();
		}

		a.setId(id);
		a.setLatitud(latitud);
		a.setLongitud(longitud);
		DR.save(a);

		return a;
	}


    @DeleteMapping
    public Ciudad deleteCiudad(@RequestParam String id){

    	Ciudad a = DR.findById(id).orElse(null);

    	DR.delete(a);
    	return a;
    }


}

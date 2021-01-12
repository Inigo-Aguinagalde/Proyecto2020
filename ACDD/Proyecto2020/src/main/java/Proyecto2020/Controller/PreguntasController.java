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

import Proyecto2020.Repository.PreguntasRepository;
import Proyecto2020.model.Preguntas;



@RequestMapping("/preguntas")
@RestController
public class PreguntasController {

	@Autowired
	private PreguntasRepository RR;

	@GetMapping("/todas")
	public List<Preguntas> get(){

		return RR.findAll();
	}

	@PostMapping("/añadir")
	public Preguntas añadirPreguntas(@RequestBody Preguntas p ) {


		return RR.save(p);
	}

	@RequestMapping("/update")
	public @ResponseBody Preguntas updateRuta(@RequestParam String id, String pregunta, String repuesta1, String respuesta2,String respuesta3 ) {

		Preguntas p = RR.findById(id).orElse(null);

		if(pregunta==null) {
			p.getPregunta();
		}else if(repuesta1==null) {
			p.getRespuesta();
		}else if(respuesta2==null) {
			p.getRespuesta2();
		}else if(respuesta3==null) {
			p.getRespuesta3();
		}

		return p;
	}

}

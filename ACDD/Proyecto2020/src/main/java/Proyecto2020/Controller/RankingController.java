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

import Proyecto2020.Repository.RankingRepository;
import Proyecto2020.model.Ranking;
import Proyecto2020.model.Rutas;
import Proyecto2020.model.Usuarios;


@RequestMapping("/ranking")
@RestController
public class  RankingController {

	@Autowired
	private RankingRepository RR;

	///////		MOSTRAR TODAS LAS RUTAS DEL SISTEMA		////////
	
	@GetMapping("/todas")
	public List<Ranking> getRanking(){

		return RR.findAll();
	}

	///////		AÑADIR REGISTRO EN EL RANKING		////////
	
	@PostMapping("/add")
	public  Ranking addPuntuacuin(@RequestParam double puntos,@RequestParam String id_usuario ,@RequestParam String id_ruta) {

		Ranking marca = new Ranking(puntos,id_usuario,id_ruta);
		RR.save(marca);

		return marca;
	}

	///////		ELIMINAR REGISTRO DEL RANKING		////////
	
	@RequestMapping("/deleteRegistro")
	public @ResponseBody String deleteRegistro(@RequestParam String id) {
		String comprobacion;
		Ranking r = RR.findById(id).orElse(null);
		RR.delete(r);
		Ranking c = RR.findById(id).orElse(null);
		if(c == null) {
			comprobacion = "se ha eliminado";
		}else {
			comprobacion = "no se ha podido eliminar";
		}
		
		return comprobacion;
	}

///////		LISTA DE REGISTROS POR RUTAS		////////
	
	@GetMapping("/getByRouteId")
	public @ResponseBody List<Ranking> getByRouteID(@RequestParam String id_ruta){

		List<Ranking> lista_ranking = RR.findByIdRuta(id_ruta);

		return lista_ranking;
	}
}

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


@RequestMapping("/ranking")
@RestController
public class  RankingController {

	@Autowired
	private RankingRepository RR;
	
	@GetMapping("/todas")
	public List<Ranking> getRanking(){
				
		return RR.findAll();
	}
	
	@PostMapping("/añadir")
	public  Ranking añadirPuntuacuin(@RequestBody Ranking r ) {
		
		
		return RR.save(r);
	}
	
	@RequestMapping("/update")
	public @ResponseBody Ranking updateRanking(@RequestParam String id, int puntos, String id_usuarios , String id_ruta) {
		
		Ranking r = RR.findById(id).orElse(null);
		
		if(puntos==0) {
			r.getPuntos();
		}else if(id_usuarios==null) {
			r.getId_usuarios();
		}else if(id_ruta==null) {
			r.getId_ruta();
		}
		
		return r;
	}
	
}

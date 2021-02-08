package Proyecto2020.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Ranking;
import Proyecto2020.model.Rutas;

public interface RankingRepository extends MongoRepository<Ranking, String>{
	public List<Ranking> findByIdRuta(String id_ruta);
}

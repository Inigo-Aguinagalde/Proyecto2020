package Proyecto2020.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Ranking;

public interface RankingRepository extends MongoRepository<Ranking, String>{

}

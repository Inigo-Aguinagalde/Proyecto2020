package Proyecto2020.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Preguntas;

public interface PreguntasRepository extends MongoRepository<Preguntas, String> {

}

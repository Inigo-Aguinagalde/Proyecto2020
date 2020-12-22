package Proyecto2020.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Localizaciones;

public interface LocalizacionesRepository extends MongoRepository<Localizaciones, String>{

}

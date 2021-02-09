package Proyecto2020.Repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Localizaciones;
import Proyecto2020.model.Rutas;

public interface LocalizacionesRepository extends MongoRepository<Localizaciones, String>{
	public Optional<Localizaciones> findById(String id);
}

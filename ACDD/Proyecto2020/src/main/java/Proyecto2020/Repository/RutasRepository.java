package Proyecto2020.Repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Rutas;

public interface RutasRepository extends MongoRepository<Rutas, String>{

	public Optional<Rutas> findById(String id);
}

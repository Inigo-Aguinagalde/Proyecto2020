package Proyecto2020.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Ciudad;

public interface CiudadesRepository extends MongoRepository<Ciudad, String> {

	public Optional<Ciudad> findById(String id);










}
package Proyecto2020.Repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;


import Proyecto2020.model.Usuarios;

public interface UsuariosRepository extends MongoRepository<Usuarios, String>{

	public Optional<Usuarios> findById(String id);
}

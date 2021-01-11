package Proyecto2020.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import Proyecto2020.model.Localizacion_usuarios;

public interface Localizacion_usuariosRepository extends MongoRepository<Localizacion_usuarios, String>{
}

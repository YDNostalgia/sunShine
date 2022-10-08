package gxa.dao;




import gxa.entity.Pet;

import java.util.List;

public interface PetDao {
    List<Pet> queryPet(Integer page, Integer limit, String memberName);
    Integer count(String memberName);
    void save(Pet pet);
    void delete(int id);

    Pet queryById(int id);

    void update(Pet pet);
}

package com.zed.homerecipes.repository;

import com.zed.homerecipes.domain.Recipe;

import org.springframework.data.jpa.repository.*;

import java.util.List;

/**
 * Spring Data JPA repository for the Recipe entity.
 */
@SuppressWarnings("unused")
public interface RecipeRepository extends JpaRepository<Recipe,Long> {

}

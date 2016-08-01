package com.zed.homerecipes.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.zed.homerecipes.domain.Recipe;
import com.zed.homerecipes.repository.RecipeRepository;
import com.zed.homerecipes.web.rest.util.HeaderUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

/**
 * REST controller for managing Recipe.
 */
@RestController
@RequestMapping("/api")
public class RecipeResource {

    private final Logger log = LoggerFactory.getLogger(RecipeResource.class);
        
    @Inject
    private RecipeRepository recipeRepository;
    
    /**
     * POST  /recipes : Create a new recipe.
     *
     * @param recipe the recipe to create
     * @return the ResponseEntity with status 201 (Created) and with body the new recipe, or with status 400 (Bad Request) if the recipe has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/recipes",
        method = RequestMethod.POST,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Recipe> createRecipe(@Valid @RequestBody Recipe recipe) throws URISyntaxException {
        log.debug("REST request to save Recipe : {}", recipe);
        if (recipe.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert("recipe", "idexists", "A new recipe cannot already have an ID")).body(null);
        }
        Recipe result = recipeRepository.save(recipe);
        return ResponseEntity.created(new URI("/api/recipes/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("recipe", result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /recipes : Updates an existing recipe.
     *
     * @param recipe the recipe to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated recipe,
     * or with status 400 (Bad Request) if the recipe is not valid,
     * or with status 500 (Internal Server Error) if the recipe couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/recipes",
        method = RequestMethod.PUT,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Recipe> updateRecipe(@Valid @RequestBody Recipe recipe) throws URISyntaxException {
        log.debug("REST request to update Recipe : {}", recipe);
        if (recipe.getId() == null) {
            return createRecipe(recipe);
        }
        Recipe result = recipeRepository.save(recipe);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert("recipe", recipe.getId().toString()))
            .body(result);
    }

    /**
     * GET  /recipes : get all the recipes.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of recipes in body
     */
    @RequestMapping(value = "/recipes",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<Recipe> getAllRecipes() {
        log.debug("REST request to get all Recipes");
        List<Recipe> recipes = recipeRepository.findAll();
        return recipes;
    }

    /**
     * GET  /recipes/:id : get the "id" recipe.
     *
     * @param id the id of the recipe to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the recipe, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/recipes/{id}",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Recipe> getRecipe(@PathVariable Long id) {
        log.debug("REST request to get Recipe : {}", id);
        Recipe recipe = recipeRepository.findOne(id);
        return Optional.ofNullable(recipe)
            .map(result -> new ResponseEntity<>(
                result,
                HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * DELETE  /recipes/:id : delete the "id" recipe.
     *
     * @param id the id of the recipe to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @RequestMapping(value = "/recipes/{id}",
        method = RequestMethod.DELETE,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Void> deleteRecipe(@PathVariable Long id) {
        log.debug("REST request to delete Recipe : {}", id);
        recipeRepository.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("recipe", id.toString())).build();
    }

}

package com.zed.homerecipes.web.rest;

import com.zed.homerecipes.HomeRecipesApp;
import com.zed.homerecipes.domain.Recipe;
import com.zed.homerecipes.repository.RecipeRepository;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import static org.hamcrest.Matchers.hasItem;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.IntegrationTest;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.zed.homerecipes.domain.enumeration.TypeOfRecipe;

/**
 * Test class for the RecipeResource REST controller.
 *
 * @see RecipeResource
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = HomeRecipesApp.class)
@WebAppConfiguration
@IntegrationTest
public class RecipeResourceIntTest {

    private static final String DEFAULT_NAME = "AAAAA";
    private static final String UPDATED_NAME = "BBBBB";
    private static final String DEFAULT_COMMENT = "AAAAA";
    private static final String UPDATED_COMMENT = "BBBBB";
    private static final String DEFAULT_LINK = "AAAAA";
    private static final String UPDATED_LINK = "BBBBB";
    private static final String DEFAULT_INGREDIENTS = "AAAAA";
    private static final String UPDATED_INGREDIENTS = "BBBBB";

    private static final TypeOfRecipe DEFAULT_TYPE_OF_RECIPE = TypeOfRecipe.ENTREE;
    private static final TypeOfRecipe UPDATED_TYPE_OF_RECIPE = TypeOfRecipe.PLAT;

    private static final byte[] DEFAULT_IMAGE = TestUtil.createByteArray(1, "0");
    private static final byte[] UPDATED_IMAGE = TestUtil.createByteArray(2, "1");
    private static final String DEFAULT_IMAGE_CONTENT_TYPE = "image/jpg";
    private static final String UPDATED_IMAGE_CONTENT_TYPE = "image/png";

    @Inject
    private RecipeRepository recipeRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    private MockMvc restRecipeMockMvc;

    private Recipe recipe;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        RecipeResource recipeResource = new RecipeResource();
        ReflectionTestUtils.setField(recipeResource, "recipeRepository", recipeRepository);
        this.restRecipeMockMvc = MockMvcBuilders.standaloneSetup(recipeResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    @Before
    public void initTest() {
        recipe = new Recipe();
        recipe.setName(DEFAULT_NAME);
        recipe.setComment(DEFAULT_COMMENT);
        recipe.setLink(DEFAULT_LINK);
        recipe.setIngredients(DEFAULT_INGREDIENTS);
        recipe.setTypeOfRecipe(DEFAULT_TYPE_OF_RECIPE);
        recipe.setImage(DEFAULT_IMAGE);
        recipe.setImageContentType(DEFAULT_IMAGE_CONTENT_TYPE);
    }

    @Test
    @Transactional
    public void createRecipe() throws Exception {
        int databaseSizeBeforeCreate = recipeRepository.findAll().size();

        // Create the Recipe

        restRecipeMockMvc.perform(post("/api/recipes")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(recipe)))
                .andExpect(status().isCreated());

        // Validate the Recipe in the database
        List<Recipe> recipes = recipeRepository.findAll();
        assertThat(recipes).hasSize(databaseSizeBeforeCreate + 1);
        Recipe testRecipe = recipes.get(recipes.size() - 1);
        assertThat(testRecipe.getName()).isEqualTo(DEFAULT_NAME);
        assertThat(testRecipe.getComment()).isEqualTo(DEFAULT_COMMENT);
        assertThat(testRecipe.getLink()).isEqualTo(DEFAULT_LINK);
        assertThat(testRecipe.getIngredients()).isEqualTo(DEFAULT_INGREDIENTS);
        assertThat(testRecipe.getTypeOfRecipe()).isEqualTo(DEFAULT_TYPE_OF_RECIPE);
        assertThat(testRecipe.getImage()).isEqualTo(DEFAULT_IMAGE);
        assertThat(testRecipe.getImageContentType()).isEqualTo(DEFAULT_IMAGE_CONTENT_TYPE);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = recipeRepository.findAll().size();
        // set the field null
        recipe.setName(null);

        // Create the Recipe, which fails.

        restRecipeMockMvc.perform(post("/api/recipes")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(recipe)))
                .andExpect(status().isBadRequest());

        List<Recipe> recipes = recipeRepository.findAll();
        assertThat(recipes).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllRecipes() throws Exception {
        // Initialize the database
        recipeRepository.saveAndFlush(recipe);

        // Get all the recipes
        restRecipeMockMvc.perform(get("/api/recipes?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.[*].id").value(hasItem(recipe.getId().intValue())))
                .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())))
                .andExpect(jsonPath("$.[*].comment").value(hasItem(DEFAULT_COMMENT.toString())))
                .andExpect(jsonPath("$.[*].link").value(hasItem(DEFAULT_LINK.toString())))
                .andExpect(jsonPath("$.[*].ingredients").value(hasItem(DEFAULT_INGREDIENTS.toString())))
                .andExpect(jsonPath("$.[*].typeOfRecipe").value(hasItem(DEFAULT_TYPE_OF_RECIPE.toString())))
                .andExpect(jsonPath("$.[*].imageContentType").value(hasItem(DEFAULT_IMAGE_CONTENT_TYPE)))
                .andExpect(jsonPath("$.[*].image").value(hasItem(Base64Utils.encodeToString(DEFAULT_IMAGE))));
    }

    @Test
    @Transactional
    public void getRecipe() throws Exception {
        // Initialize the database
        recipeRepository.saveAndFlush(recipe);

        // Get the recipe
        restRecipeMockMvc.perform(get("/api/recipes/{id}", recipe.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id").value(recipe.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME.toString()))
            .andExpect(jsonPath("$.comment").value(DEFAULT_COMMENT.toString()))
            .andExpect(jsonPath("$.link").value(DEFAULT_LINK.toString()))
            .andExpect(jsonPath("$.ingredients").value(DEFAULT_INGREDIENTS.toString()))
            .andExpect(jsonPath("$.typeOfRecipe").value(DEFAULT_TYPE_OF_RECIPE.toString()))
            .andExpect(jsonPath("$.imageContentType").value(DEFAULT_IMAGE_CONTENT_TYPE))
            .andExpect(jsonPath("$.image").value(Base64Utils.encodeToString(DEFAULT_IMAGE)));
    }

    @Test
    @Transactional
    public void getNonExistingRecipe() throws Exception {
        // Get the recipe
        restRecipeMockMvc.perform(get("/api/recipes/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateRecipe() throws Exception {
        // Initialize the database
        recipeRepository.saveAndFlush(recipe);
        int databaseSizeBeforeUpdate = recipeRepository.findAll().size();

        // Update the recipe
        Recipe updatedRecipe = new Recipe();
        updatedRecipe.setId(recipe.getId());
        updatedRecipe.setName(UPDATED_NAME);
        updatedRecipe.setComment(UPDATED_COMMENT);
        updatedRecipe.setLink(UPDATED_LINK);
        updatedRecipe.setIngredients(UPDATED_INGREDIENTS);
        updatedRecipe.setTypeOfRecipe(UPDATED_TYPE_OF_RECIPE);
        updatedRecipe.setImage(UPDATED_IMAGE);
        updatedRecipe.setImageContentType(UPDATED_IMAGE_CONTENT_TYPE);

        restRecipeMockMvc.perform(put("/api/recipes")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedRecipe)))
                .andExpect(status().isOk());

        // Validate the Recipe in the database
        List<Recipe> recipes = recipeRepository.findAll();
        assertThat(recipes).hasSize(databaseSizeBeforeUpdate);
        Recipe testRecipe = recipes.get(recipes.size() - 1);
        assertThat(testRecipe.getName()).isEqualTo(UPDATED_NAME);
        assertThat(testRecipe.getComment()).isEqualTo(UPDATED_COMMENT);
        assertThat(testRecipe.getLink()).isEqualTo(UPDATED_LINK);
        assertThat(testRecipe.getIngredients()).isEqualTo(UPDATED_INGREDIENTS);
        assertThat(testRecipe.getTypeOfRecipe()).isEqualTo(UPDATED_TYPE_OF_RECIPE);
        assertThat(testRecipe.getImage()).isEqualTo(UPDATED_IMAGE);
        assertThat(testRecipe.getImageContentType()).isEqualTo(UPDATED_IMAGE_CONTENT_TYPE);
    }

    @Test
    @Transactional
    public void deleteRecipe() throws Exception {
        // Initialize the database
        recipeRepository.saveAndFlush(recipe);
        int databaseSizeBeforeDelete = recipeRepository.findAll().size();

        // Get the recipe
        restRecipeMockMvc.perform(delete("/api/recipes/{id}", recipe.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate the database is empty
        List<Recipe> recipes = recipeRepository.findAll();
        assertThat(recipes).hasSize(databaseSizeBeforeDelete - 1);
    }
}

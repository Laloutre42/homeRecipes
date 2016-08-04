package com.zed.homerecipes.web.rest;

import com.zed.homerecipes.HomeRecipesApp;
import com.zed.homerecipes.domain.Wine;
import com.zed.homerecipes.repository.WineRepository;

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
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.zed.homerecipes.domain.enumeration.TypeOfWine;

/**
 * Test class for the WineResource REST controller.
 *
 * @see WineResource
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = HomeRecipesApp.class)
@WebAppConfiguration
@IntegrationTest
public class WineResourceIntTest {

    private static final String DEFAULT_NAME = "AAAAA";
    private static final String UPDATED_NAME = "BBBBB";
    private static final String DEFAULT_APPELLATION = "AAAAA";
    private static final String UPDATED_APPELLATION = "BBBBB";

    private static final Integer DEFAULT_YEAR = 1;
    private static final Integer UPDATED_YEAR = 2;

    private static final TypeOfWine DEFAULT_TYPE_OF_WINE = TypeOfWine.BLANC;
    private static final TypeOfWine UPDATED_TYPE_OF_WINE = TypeOfWine.ROUGE;

    private static final Double DEFAULT_PRICE = 1D;
    private static final Double UPDATED_PRICE = 2D;

    private static final Integer DEFAULT_STOCK = 1;
    private static final Integer UPDATED_STOCK = 2;

    private static final Integer DEFAULT_NOTE = 1;
    private static final Integer UPDATED_NOTE = 2;
    private static final String DEFAULT_COMMENT = "AAAAA";
    private static final String UPDATED_COMMENT = "BBBBB";

    private static final byte[] DEFAULT_IMAGE = TestUtil.createByteArray(1, "0");
    private static final byte[] UPDATED_IMAGE = TestUtil.createByteArray(2, "1");
    private static final String DEFAULT_IMAGE_CONTENT_TYPE = "image/jpg";
    private static final String UPDATED_IMAGE_CONTENT_TYPE = "image/png";
    private static final String DEFAULT_COUNTRY = "AAAAA";
    private static final String UPDATED_COUNTRY = "BBBBB";
    private static final String DEFAULT_REGION = "AAAAA";
    private static final String UPDATED_REGION = "BBBBB";

    private static final LocalDate DEFAULT_PURCHASE_DATE = LocalDate.ofEpochDay(0L);
    private static final LocalDate UPDATED_PURCHASE_DATE = LocalDate.now(ZoneId.systemDefault());
    private static final String DEFAULT_LINK = "AAAAA";
    private static final String UPDATED_LINK = "BBBBB";

    @Inject
    private WineRepository wineRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    private MockMvc restWineMockMvc;

    private Wine wine;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        WineResource wineResource = new WineResource();
        ReflectionTestUtils.setField(wineResource, "wineRepository", wineRepository);
        this.restWineMockMvc = MockMvcBuilders.standaloneSetup(wineResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    @Before
    public void initTest() {
        wine = new Wine();
        wine.setName(DEFAULT_NAME);
        wine.setAppellation(DEFAULT_APPELLATION);
        wine.setYear(DEFAULT_YEAR);
        wine.setTypeOfWine(DEFAULT_TYPE_OF_WINE);
        wine.setPrice(DEFAULT_PRICE);
        wine.setStock(DEFAULT_STOCK);
        wine.setNote(DEFAULT_NOTE);
        wine.setComment(DEFAULT_COMMENT);
        wine.setImage(DEFAULT_IMAGE);
        wine.setImageContentType(DEFAULT_IMAGE_CONTENT_TYPE);
        wine.setCountry(DEFAULT_COUNTRY);
        wine.setRegion(DEFAULT_REGION);
        wine.setPurchaseDate(DEFAULT_PURCHASE_DATE);
        wine.setLink(DEFAULT_LINK);
    }

    @Test
    @Transactional
    public void createWine() throws Exception {
        int databaseSizeBeforeCreate = wineRepository.findAll().size();

        // Create the Wine

        restWineMockMvc.perform(post("/api/wines")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(wine)))
                .andExpect(status().isCreated());

        // Validate the Wine in the database
        List<Wine> wines = wineRepository.findAll();
        assertThat(wines).hasSize(databaseSizeBeforeCreate + 1);
        Wine testWine = wines.get(wines.size() - 1);
        assertThat(testWine.getName()).isEqualTo(DEFAULT_NAME);
        assertThat(testWine.getAppellation()).isEqualTo(DEFAULT_APPELLATION);
        assertThat(testWine.getYear()).isEqualTo(DEFAULT_YEAR);
        assertThat(testWine.getTypeOfWine()).isEqualTo(DEFAULT_TYPE_OF_WINE);
        assertThat(testWine.getPrice()).isEqualTo(DEFAULT_PRICE);
        assertThat(testWine.getStock()).isEqualTo(DEFAULT_STOCK);
        assertThat(testWine.getNote()).isEqualTo(DEFAULT_NOTE);
        assertThat(testWine.getComment()).isEqualTo(DEFAULT_COMMENT);
        assertThat(testWine.getImage()).isEqualTo(DEFAULT_IMAGE);
        assertThat(testWine.getImageContentType()).isEqualTo(DEFAULT_IMAGE_CONTENT_TYPE);
        assertThat(testWine.getCountry()).isEqualTo(DEFAULT_COUNTRY);
        assertThat(testWine.getRegion()).isEqualTo(DEFAULT_REGION);
        assertThat(testWine.getPurchaseDate()).isEqualTo(DEFAULT_PURCHASE_DATE);
        assertThat(testWine.getLink()).isEqualTo(DEFAULT_LINK);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = wineRepository.findAll().size();
        // set the field null
        wine.setName(null);

        // Create the Wine, which fails.

        restWineMockMvc.perform(post("/api/wines")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(wine)))
                .andExpect(status().isBadRequest());

        List<Wine> wines = wineRepository.findAll();
        assertThat(wines).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllWines() throws Exception {
        // Initialize the database
        wineRepository.saveAndFlush(wine);

        // Get all the wines
        restWineMockMvc.perform(get("/api/wines?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.[*].id").value(hasItem(wine.getId().intValue())))
                .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())))
                .andExpect(jsonPath("$.[*].appellation").value(hasItem(DEFAULT_APPELLATION.toString())))
                .andExpect(jsonPath("$.[*].year").value(hasItem(DEFAULT_YEAR)))
                .andExpect(jsonPath("$.[*].typeOfWine").value(hasItem(DEFAULT_TYPE_OF_WINE.toString())))
                .andExpect(jsonPath("$.[*].price").value(hasItem(DEFAULT_PRICE.doubleValue())))
                .andExpect(jsonPath("$.[*].stock").value(hasItem(DEFAULT_STOCK)))
                .andExpect(jsonPath("$.[*].note").value(hasItem(DEFAULT_NOTE)))
                .andExpect(jsonPath("$.[*].comment").value(hasItem(DEFAULT_COMMENT.toString())))
                .andExpect(jsonPath("$.[*].imageContentType").value(hasItem(DEFAULT_IMAGE_CONTENT_TYPE)))
                .andExpect(jsonPath("$.[*].image").value(hasItem(Base64Utils.encodeToString(DEFAULT_IMAGE))))
                .andExpect(jsonPath("$.[*].country").value(hasItem(DEFAULT_COUNTRY.toString())))
                .andExpect(jsonPath("$.[*].region").value(hasItem(DEFAULT_REGION.toString())))
                .andExpect(jsonPath("$.[*].purchaseDate").value(hasItem(DEFAULT_PURCHASE_DATE.toString())))
                .andExpect(jsonPath("$.[*].link").value(hasItem(DEFAULT_LINK.toString())));
    }

    @Test
    @Transactional
    public void getWine() throws Exception {
        // Initialize the database
        wineRepository.saveAndFlush(wine);

        // Get the wine
        restWineMockMvc.perform(get("/api/wines/{id}", wine.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id").value(wine.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME.toString()))
            .andExpect(jsonPath("$.appellation").value(DEFAULT_APPELLATION.toString()))
            .andExpect(jsonPath("$.year").value(DEFAULT_YEAR))
            .andExpect(jsonPath("$.typeOfWine").value(DEFAULT_TYPE_OF_WINE.toString()))
            .andExpect(jsonPath("$.price").value(DEFAULT_PRICE.doubleValue()))
            .andExpect(jsonPath("$.stock").value(DEFAULT_STOCK))
            .andExpect(jsonPath("$.note").value(DEFAULT_NOTE))
            .andExpect(jsonPath("$.comment").value(DEFAULT_COMMENT.toString()))
            .andExpect(jsonPath("$.imageContentType").value(DEFAULT_IMAGE_CONTENT_TYPE))
            .andExpect(jsonPath("$.image").value(Base64Utils.encodeToString(DEFAULT_IMAGE)))
            .andExpect(jsonPath("$.country").value(DEFAULT_COUNTRY.toString()))
            .andExpect(jsonPath("$.region").value(DEFAULT_REGION.toString()))
            .andExpect(jsonPath("$.purchaseDate").value(DEFAULT_PURCHASE_DATE.toString()))
            .andExpect(jsonPath("$.link").value(DEFAULT_LINK.toString()));
    }

    @Test
    @Transactional
    public void getNonExistingWine() throws Exception {
        // Get the wine
        restWineMockMvc.perform(get("/api/wines/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateWine() throws Exception {
        // Initialize the database
        wineRepository.saveAndFlush(wine);
        int databaseSizeBeforeUpdate = wineRepository.findAll().size();

        // Update the wine
        Wine updatedWine = new Wine();
        updatedWine.setId(wine.getId());
        updatedWine.setName(UPDATED_NAME);
        updatedWine.setAppellation(UPDATED_APPELLATION);
        updatedWine.setYear(UPDATED_YEAR);
        updatedWine.setTypeOfWine(UPDATED_TYPE_OF_WINE);
        updatedWine.setPrice(UPDATED_PRICE);
        updatedWine.setStock(UPDATED_STOCK);
        updatedWine.setNote(UPDATED_NOTE);
        updatedWine.setComment(UPDATED_COMMENT);
        updatedWine.setImage(UPDATED_IMAGE);
        updatedWine.setImageContentType(UPDATED_IMAGE_CONTENT_TYPE);
        updatedWine.setCountry(UPDATED_COUNTRY);
        updatedWine.setRegion(UPDATED_REGION);
        updatedWine.setPurchaseDate(UPDATED_PURCHASE_DATE);
        updatedWine.setLink(UPDATED_LINK);

        restWineMockMvc.perform(put("/api/wines")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedWine)))
                .andExpect(status().isOk());

        // Validate the Wine in the database
        List<Wine> wines = wineRepository.findAll();
        assertThat(wines).hasSize(databaseSizeBeforeUpdate);
        Wine testWine = wines.get(wines.size() - 1);
        assertThat(testWine.getName()).isEqualTo(UPDATED_NAME);
        assertThat(testWine.getAppellation()).isEqualTo(UPDATED_APPELLATION);
        assertThat(testWine.getYear()).isEqualTo(UPDATED_YEAR);
        assertThat(testWine.getTypeOfWine()).isEqualTo(UPDATED_TYPE_OF_WINE);
        assertThat(testWine.getPrice()).isEqualTo(UPDATED_PRICE);
        assertThat(testWine.getStock()).isEqualTo(UPDATED_STOCK);
        assertThat(testWine.getNote()).isEqualTo(UPDATED_NOTE);
        assertThat(testWine.getComment()).isEqualTo(UPDATED_COMMENT);
        assertThat(testWine.getImage()).isEqualTo(UPDATED_IMAGE);
        assertThat(testWine.getImageContentType()).isEqualTo(UPDATED_IMAGE_CONTENT_TYPE);
        assertThat(testWine.getCountry()).isEqualTo(UPDATED_COUNTRY);
        assertThat(testWine.getRegion()).isEqualTo(UPDATED_REGION);
        assertThat(testWine.getPurchaseDate()).isEqualTo(UPDATED_PURCHASE_DATE);
        assertThat(testWine.getLink()).isEqualTo(UPDATED_LINK);
    }

    @Test
    @Transactional
    public void deleteWine() throws Exception {
        // Initialize the database
        wineRepository.saveAndFlush(wine);
        int databaseSizeBeforeDelete = wineRepository.findAll().size();

        // Get the wine
        restWineMockMvc.perform(delete("/api/wines/{id}", wine.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate the database is empty
        List<Wine> wines = wineRepository.findAll();
        assertThat(wines).hasSize(databaseSizeBeforeDelete - 1);
    }
}

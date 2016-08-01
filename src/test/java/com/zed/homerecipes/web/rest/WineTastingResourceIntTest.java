package com.zed.homerecipes.web.rest;

import com.zed.homerecipes.HomeRecipesApp;
import com.zed.homerecipes.domain.WineTasting;
import com.zed.homerecipes.repository.WineTastingRepository;

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

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.time.Instant;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.ZoneId;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


/**
 * Test class for the WineTastingResource REST controller.
 *
 * @see WineTastingResource
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = HomeRecipesApp.class)
@WebAppConfiguration
@IntegrationTest
public class WineTastingResourceIntTest {

    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").withZone(ZoneId.of("Z"));


    private static final ZonedDateTime DEFAULT_DATE = ZonedDateTime.ofInstant(Instant.ofEpochMilli(0L), ZoneId.systemDefault());
    private static final ZonedDateTime UPDATED_DATE = ZonedDateTime.now(ZoneId.systemDefault()).withNano(0);
    private static final String DEFAULT_DATE_STR = dateTimeFormatter.format(DEFAULT_DATE);

    private static final Integer DEFAULT_NOTE = 1;
    private static final Integer UPDATED_NOTE = 2;
    private static final String DEFAULT_COMMENT = "AAAAA";
    private static final String UPDATED_COMMENT = "BBBBB";

    @Inject
    private WineTastingRepository wineTastingRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    private MockMvc restWineTastingMockMvc;

    private WineTasting wineTasting;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        WineTastingResource wineTastingResource = new WineTastingResource();
        ReflectionTestUtils.setField(wineTastingResource, "wineTastingRepository", wineTastingRepository);
        this.restWineTastingMockMvc = MockMvcBuilders.standaloneSetup(wineTastingResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    @Before
    public void initTest() {
        wineTasting = new WineTasting();
        wineTasting.setDate(DEFAULT_DATE);
        wineTasting.setNote(DEFAULT_NOTE);
        wineTasting.setComment(DEFAULT_COMMENT);
    }

    @Test
    @Transactional
    public void createWineTasting() throws Exception {
        int databaseSizeBeforeCreate = wineTastingRepository.findAll().size();

        // Create the WineTasting

        restWineTastingMockMvc.perform(post("/api/wine-tastings")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(wineTasting)))
                .andExpect(status().isCreated());

        // Validate the WineTasting in the database
        List<WineTasting> wineTastings = wineTastingRepository.findAll();
        assertThat(wineTastings).hasSize(databaseSizeBeforeCreate + 1);
        WineTasting testWineTasting = wineTastings.get(wineTastings.size() - 1);
        assertThat(testWineTasting.getDate()).isEqualTo(DEFAULT_DATE);
        assertThat(testWineTasting.getNote()).isEqualTo(DEFAULT_NOTE);
        assertThat(testWineTasting.getComment()).isEqualTo(DEFAULT_COMMENT);
    }

    @Test
    @Transactional
    public void getAllWineTastings() throws Exception {
        // Initialize the database
        wineTastingRepository.saveAndFlush(wineTasting);

        // Get all the wineTastings
        restWineTastingMockMvc.perform(get("/api/wine-tastings?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.[*].id").value(hasItem(wineTasting.getId().intValue())))
                .andExpect(jsonPath("$.[*].date").value(hasItem(DEFAULT_DATE_STR)))
                .andExpect(jsonPath("$.[*].note").value(hasItem(DEFAULT_NOTE)))
                .andExpect(jsonPath("$.[*].comment").value(hasItem(DEFAULT_COMMENT.toString())));
    }

    @Test
    @Transactional
    public void getWineTasting() throws Exception {
        // Initialize the database
        wineTastingRepository.saveAndFlush(wineTasting);

        // Get the wineTasting
        restWineTastingMockMvc.perform(get("/api/wine-tastings/{id}", wineTasting.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id").value(wineTasting.getId().intValue()))
            .andExpect(jsonPath("$.date").value(DEFAULT_DATE_STR))
            .andExpect(jsonPath("$.note").value(DEFAULT_NOTE))
            .andExpect(jsonPath("$.comment").value(DEFAULT_COMMENT.toString()));
    }

    @Test
    @Transactional
    public void getNonExistingWineTasting() throws Exception {
        // Get the wineTasting
        restWineTastingMockMvc.perform(get("/api/wine-tastings/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateWineTasting() throws Exception {
        // Initialize the database
        wineTastingRepository.saveAndFlush(wineTasting);
        int databaseSizeBeforeUpdate = wineTastingRepository.findAll().size();

        // Update the wineTasting
        WineTasting updatedWineTasting = new WineTasting();
        updatedWineTasting.setId(wineTasting.getId());
        updatedWineTasting.setDate(UPDATED_DATE);
        updatedWineTasting.setNote(UPDATED_NOTE);
        updatedWineTasting.setComment(UPDATED_COMMENT);

        restWineTastingMockMvc.perform(put("/api/wine-tastings")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedWineTasting)))
                .andExpect(status().isOk());

        // Validate the WineTasting in the database
        List<WineTasting> wineTastings = wineTastingRepository.findAll();
        assertThat(wineTastings).hasSize(databaseSizeBeforeUpdate);
        WineTasting testWineTasting = wineTastings.get(wineTastings.size() - 1);
        assertThat(testWineTasting.getDate()).isEqualTo(UPDATED_DATE);
        assertThat(testWineTasting.getNote()).isEqualTo(UPDATED_NOTE);
        assertThat(testWineTasting.getComment()).isEqualTo(UPDATED_COMMENT);
    }

    @Test
    @Transactional
    public void deleteWineTasting() throws Exception {
        // Initialize the database
        wineTastingRepository.saveAndFlush(wineTasting);
        int databaseSizeBeforeDelete = wineTastingRepository.findAll().size();

        // Get the wineTasting
        restWineTastingMockMvc.perform(delete("/api/wine-tastings/{id}", wineTasting.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate the database is empty
        List<WineTasting> wineTastings = wineTastingRepository.findAll();
        assertThat(wineTastings).hasSize(databaseSizeBeforeDelete - 1);
    }
}

package com.zed.homerecipes.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.zed.homerecipes.domain.Wine;
import com.zed.homerecipes.repository.WineRepository;
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
 * REST controller for managing Wine.
 */
@RestController
@RequestMapping("/api")
public class WineResource {

    private final Logger log = LoggerFactory.getLogger(WineResource.class);
        
    @Inject
    private WineRepository wineRepository;
    
    /**
     * POST  /wines : Create a new wine.
     *
     * @param wine the wine to create
     * @return the ResponseEntity with status 201 (Created) and with body the new wine, or with status 400 (Bad Request) if the wine has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/wines",
        method = RequestMethod.POST,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Wine> createWine(@Valid @RequestBody Wine wine) throws URISyntaxException {
        log.debug("REST request to save Wine : {}", wine);
        if (wine.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert("wine", "idexists", "A new wine cannot already have an ID")).body(null);
        }
        Wine result = wineRepository.save(wine);
        return ResponseEntity.created(new URI("/api/wines/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("wine", result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /wines : Updates an existing wine.
     *
     * @param wine the wine to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated wine,
     * or with status 400 (Bad Request) if the wine is not valid,
     * or with status 500 (Internal Server Error) if the wine couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/wines",
        method = RequestMethod.PUT,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Wine> updateWine(@Valid @RequestBody Wine wine) throws URISyntaxException {
        log.debug("REST request to update Wine : {}", wine);
        if (wine.getId() == null) {
            return createWine(wine);
        }
        Wine result = wineRepository.save(wine);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert("wine", wine.getId().toString()))
            .body(result);
    }

    /**
     * GET  /wines : get all the wines.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of wines in body
     */
    @RequestMapping(value = "/wines",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<Wine> getAllWines() {
        log.debug("REST request to get all Wines");
        List<Wine> wines = wineRepository.findAll();
        return wines;
    }

    /**
     * GET  /wines/:id : get the "id" wine.
     *
     * @param id the id of the wine to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the wine, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/wines/{id}",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Wine> getWine(@PathVariable Long id) {
        log.debug("REST request to get Wine : {}", id);
        Wine wine = wineRepository.findOne(id);
        return Optional.ofNullable(wine)
            .map(result -> new ResponseEntity<>(
                result,
                HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * DELETE  /wines/:id : delete the "id" wine.
     *
     * @param id the id of the wine to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @RequestMapping(value = "/wines/{id}",
        method = RequestMethod.DELETE,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Void> deleteWine(@PathVariable Long id) {
        log.debug("REST request to delete Wine : {}", id);
        wineRepository.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("wine", id.toString())).build();
    }

}

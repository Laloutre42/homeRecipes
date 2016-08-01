package com.zed.homerecipes.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.zed.homerecipes.domain.WineTasting;
import com.zed.homerecipes.repository.WineTastingRepository;
import com.zed.homerecipes.web.rest.util.HeaderUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

/**
 * REST controller for managing WineTasting.
 */
@RestController
@RequestMapping("/api")
public class WineTastingResource {

    private final Logger log = LoggerFactory.getLogger(WineTastingResource.class);
        
    @Inject
    private WineTastingRepository wineTastingRepository;
    
    /**
     * POST  /wine-tastings : Create a new wineTasting.
     *
     * @param wineTasting the wineTasting to create
     * @return the ResponseEntity with status 201 (Created) and with body the new wineTasting, or with status 400 (Bad Request) if the wineTasting has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/wine-tastings",
        method = RequestMethod.POST,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<WineTasting> createWineTasting(@RequestBody WineTasting wineTasting) throws URISyntaxException {
        log.debug("REST request to save WineTasting : {}", wineTasting);
        if (wineTasting.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert("wineTasting", "idexists", "A new wineTasting cannot already have an ID")).body(null);
        }
        WineTasting result = wineTastingRepository.save(wineTasting);
        return ResponseEntity.created(new URI("/api/wine-tastings/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("wineTasting", result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /wine-tastings : Updates an existing wineTasting.
     *
     * @param wineTasting the wineTasting to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated wineTasting,
     * or with status 400 (Bad Request) if the wineTasting is not valid,
     * or with status 500 (Internal Server Error) if the wineTasting couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/wine-tastings",
        method = RequestMethod.PUT,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<WineTasting> updateWineTasting(@RequestBody WineTasting wineTasting) throws URISyntaxException {
        log.debug("REST request to update WineTasting : {}", wineTasting);
        if (wineTasting.getId() == null) {
            return createWineTasting(wineTasting);
        }
        WineTasting result = wineTastingRepository.save(wineTasting);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert("wineTasting", wineTasting.getId().toString()))
            .body(result);
    }

    /**
     * GET  /wine-tastings : get all the wineTastings.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of wineTastings in body
     */
    @RequestMapping(value = "/wine-tastings",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<WineTasting> getAllWineTastings() {
        log.debug("REST request to get all WineTastings");
        List<WineTasting> wineTastings = wineTastingRepository.findAll();
        return wineTastings;
    }

    /**
     * GET  /wine-tastings/:id : get the "id" wineTasting.
     *
     * @param id the id of the wineTasting to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the wineTasting, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/wine-tastings/{id}",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<WineTasting> getWineTasting(@PathVariable Long id) {
        log.debug("REST request to get WineTasting : {}", id);
        WineTasting wineTasting = wineTastingRepository.findOne(id);
        return Optional.ofNullable(wineTasting)
            .map(result -> new ResponseEntity<>(
                result,
                HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * DELETE  /wine-tastings/:id : delete the "id" wineTasting.
     *
     * @param id the id of the wineTasting to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @RequestMapping(value = "/wine-tastings/{id}",
        method = RequestMethod.DELETE,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Void> deleteWineTasting(@PathVariable Long id) {
        log.debug("REST request to delete WineTasting : {}", id);
        wineTastingRepository.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("wineTasting", id.toString())).build();
    }

}

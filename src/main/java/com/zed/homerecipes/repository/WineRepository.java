package com.zed.homerecipes.repository;

import com.zed.homerecipes.domain.Wine;

import org.springframework.data.jpa.repository.*;

import java.util.List;

/**
 * Spring Data JPA repository for the Wine entity.
 */
@SuppressWarnings("unused")
public interface WineRepository extends JpaRepository<Wine,Long> {

}

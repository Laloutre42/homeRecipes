package com.zed.homerecipes.repository;

import com.zed.homerecipes.domain.WineTasting;

import org.springframework.data.jpa.repository.*;

import java.util.List;

/**
 * Spring Data JPA repository for the WineTasting entity.
 */
@SuppressWarnings("unused")
public interface WineTastingRepository extends JpaRepository<WineTasting,Long> {

}

package com.namanraj.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.namanraj.demo.model.Complaint;

@Repository
public interface CompliantRepo extends JpaRepository<Complaint , Integer> 
{
	List<Complaint> findByCtype(String ctype);
	
	Page<Complaint> findByRollOrderByTimestampDesc(String roll, Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'Food Commitee'", nativeQuery=true)
	Page<Complaint> findByFcom(Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'SAC'", nativeQuery=true)
	Page<Complaint> findBySac(Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'SAC' and t.hostel = 'Bhaskara'", nativeQuery=true)
	Page<Complaint> findByWardenAndMen(Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'SAC' and t.hostel = 'Lilavati'", nativeQuery=true)
	Page<Complaint> findByWardenAndWomen(Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'Sports Committee'", nativeQuery=true)
	Page<Complaint> findByScom(Pageable pageable);
	
	@Query(value = "SELECT * FROM complaint t WHERE t.ctype = 'Internet Commitee'", nativeQuery=true)
	Page<Complaint> findByNetcom(Pageable pageable);
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value = "UPDATE complaint t set t.status = ?1 , t.message = ?2 WHERE t.id=?3 ", nativeQuery=true)
	int updateComplaint(String status , String message ,  int id);
	


}

package com.ezen.myproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.myproject.domain.CommentVO;
import com.ezen.myproject.domain.MemberVO;
import com.ezen.myproject.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/comment/*")
@RestController
public class CommentController {
	@Inject
	private CommentService csv;
	
	//ResponseEntity 객체 사용
	//@RequestBody : body값 추출
	//value="mapping name", consumes="가져오는 데이터의 형태", produces="보내는 데이터의 형태"
	//produces : 보내는 데이터 형식 / 나가는 데이터 타입 => MediaType
	//json : application/json, text : text_plain
	@PostMapping(value="/post", consumes="application/json" , produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> post(@RequestBody CommentVO cvo){
		//DB연결
		int isOk = csv.post(cvo);
		if(isOk>0) {
			int count = csv.Count(cvo.getBno());
			csv.updateCount(count, cvo.getBno());
		}
		//리턴시 response의 통신상태를 같이 리턴
		return isOk>0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{bno}", produces = MediaType.APPLICATION_JSON_VALUE)
	   public ResponseEntity<List<CommentVO>> spread(@PathVariable("bno") int bno) {

	      List<CommentVO> list = csv.getlist(bno);
	      return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);

	   }

	   @PutMapping(value = "/{cno}", produces = MediaType.TEXT_PLAIN_VALUE, consumes = "application/json")
	   public ResponseEntity<String> edit(@PathVariable("cno") int cno, @RequestBody CommentVO cvo, HttpServletRequest req) {
		  HttpSession ses = req.getSession();
		  int isOk = 0;
		  if(ses!=null) {
			  MemberVO mvo = (MemberVO) ses.getAttribute("ses");
			  if(mvo.getId().equals(cvo.getWriter())) {
				  isOk = csv.modi(cvo);
				  log.info("isOK" + isOk);
			  }else {
				  return new ResponseEntity<String>("2", HttpStatus.OK);
			  }
		  }

	      return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
	            : new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);

	   }

	   @DeleteMapping(value = "/del", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	   public ResponseEntity<String> del(@RequestBody CommentVO cvo,  HttpServletRequest req) {
		   
		   HttpSession ses = req.getSession();
			  int isOk = 0;
			  if(ses!=null) {
				  MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				  if(mvo.getId().equals(cvo.getWriter())) {
					  isOk = csv.remove(cvo.getCno());
					  int count = csv.Count(cvo.getBno());
					  csv.updateCount(count, cvo.getBno());
				  }else {
					  return new ResponseEntity<String>("2", HttpStatus.OK);
				  }

			  }
			  return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
					  : new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	   }
}
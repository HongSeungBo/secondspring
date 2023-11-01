package com.ezen.myproject.handler;

import com.ezen.myproject.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class PagingHandler {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totalCount;
	private PagingVO pgvo;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)Math.ceil(pgvo.getPageNo() / (double)pgvo.getQty())*pgvo.getQty();
		
		this.startPage = endPage - 9;
		
		int realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
		if(realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		//srartPage : 1, 11, 21 ...
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
	
}

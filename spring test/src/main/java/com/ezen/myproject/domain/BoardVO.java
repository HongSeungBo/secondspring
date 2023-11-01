package com.ezen.myproject.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
//	create table board(
//			bno int not null auto_increment,
//			writer varchar(100),
//			title varchar(200),
//			content text,
//			isDel varchar(10) default 'N',
//			registerDate datetime default now(),
//			read_count int,
//			primary key(bno));


	private int bno;
	private String writer;
	private String title;
	private String content;
	private String isDel;
	private String registerDate;
	private int read_count;
	private int commentCount;
	private int fileCount;
}

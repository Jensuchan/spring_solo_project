package com.myweb.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@NoArgsConstructor
@ToString
@Setter
@Getter
public class BoardDTO {
	
	private BoardVO bvo;
	private List<FileVO> flist;
	private String nickName;
	
	public BoardDTO(BoardVO bvo, List<FileVO> flist) {
		this.bvo = bvo;
		this.flist = flist;
	}

}

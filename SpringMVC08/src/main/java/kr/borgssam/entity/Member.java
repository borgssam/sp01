package kr.borgssam.entity;

import lombok.Data;

@Data
public class Member {
	String memId;
	String memPwd;
	String memName;
	String memPhone; 
	String memAddr;
	long latitued; 
	long ongitude;
}

create table myboard(
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
); 


INSERT INTO com.myboard	(	title,	content,	writer	)
VALUES ('제목1','내용1','글쓴이1');
INSERT INTO com.myboard	(	title,	content,	writer	)
VALUES ('제목2','내용2','글쓴이2');
INSERT INTO com.myboard	(	title,	content,	writer	)
VALUES ('제목3','내용3','글쓴이3');

select * from myboard
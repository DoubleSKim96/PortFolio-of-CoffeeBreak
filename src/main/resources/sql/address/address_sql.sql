CREATE TABLE addr_one(
	reg_no INT PRIMARY KEY AUTO_INCREMENT,
	postcode VARCHAR(50) NOT NULL,
	road_address VARCHAR(50) NOT NULL,
	jibun_address VARCHAR(50) NOT NULL,
    detail_address VARCHAR(100) NOT NULL,
	extra_adㅇress VARCHAR(100),
	reg_date TIMESTAMP DEFAULT NOW()
);

-- 페이지 제한 조회
SELECT *
FROM addr_one
LIMIT 0,5;

--조회 with 페이징
select*from addr_one limit 5,5;

-- 게시주소 숫자
select count(*) from addr_one;

--게시글 번호(PRIMARY KEY)밀어올리기
set sql_safe_updates=0; --안전모드 해제
ALTER TABLE addr_one auto_increment=1;
SET @COUNT =0;
UPDATE addr_one SET reg_no=@COUNT:=@COUNT+1;


CREATE TABLE market_addr(
	market_reg_no INT PRIMARY KEY AUTO_INCREMENT,
    market_tel1 VARCHAR(10) NOT NULL,
    market_tel2 VARCHAR(10) NOT NULL,
    market_tel3 VARCHAR(10) NOT NULL,
	market_postcode VARCHAR(50) NOT NULL,
	market_road_address VARCHAR(50) NOT NULL,
	market_jibun_address VARCHAR(50) NOT NULL,
    market_detail_address VARCHAR(100) NOT NULL,
	market_extra_address VARCHAR(100),
    market_result_x DOUBLE,
    market_result_y DOUBLE,
	market_reg_date TIMESTAMP DEFAULT NOW()
);
select *from market_addr;
DROP table market_addr;
INSERT INTO market_addr(market_tel1,market_tel2,market_tel3,market_postcode,market_road_address,market_jibun_address,market_detail_address,
market_extra_address,market_result_x,market_result_y) VALUES();

select*from market_addr where market_road_address like ('%용%');
ALTER TABLE market_addr ADD market_detail_info VARCHAR(3000);
ALTER TABLE market_addr ADD market_running_time VARCHAR(100);
ALTER TABLE market_addr ADD market_location_info VARCHAR(200);

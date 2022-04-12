# MySQL01
## 01 복습
### DDL(Data Definition Language)
데이터정의어, 테이블에 관련된 쿼리문
* RDBMS (관계형 데이터베이스 관리 시스템)
  * 테이블기리 서로 관계를 맺고 있는 데이터베이스 관리 시스템
* Primary Key(PK)
  * 각 제이터들의 고유한 값(구분점 역할) 
  * 중복이 없고 비어있지 않음
  * unique는 개발자의 중복 실수를 막고 pk는 서비스 이용 시 고유식별을 위한 데이터
* 자료형 
  * 숫자(int, decimal)
  * 문자열(char, varchar, enum)
  * 시간(date, datetime)
* 테이블 생성
  * ```sql
  create table 테이블명(
  	컬럼명1 자료형 [제약조건],
    	컬럼명2 자료형 [제약조건],
    	컬럼명3 자료형 [제약조건],
       ...
  );
  ```
* 테이블 삭제
  * ```sql
  		drop table 테이블 명; 
  ```
* 테이블 수정
  * ```sql
  테이블 명 수정
  alter table 테이블명 rename to 새로운 이름;
  테이블 컬럼추가
  alter table 테이블명 add(컬럼명 자료형 [제약조건]);
  테이블 컬럼수정
  alter table 테이블명 modify 기존컬럼명 새로운자료형;
  테이블 컬럼명 수정
  alter table 테이블명 change 기존컬럼명 새로운컬럼명 새로운자료형;
  테이블 컬럼 삭제
  alter table 테이블명 drop 컬럼명;
  ```
* Foreign Key
  * 보통 데이터에서 부모-자식관계를 형성시킬 때 자식테이블에서 부모테이블을 참조함.
```sql
  #부모테이블
create table owner(
	id varchar(300) primary key,
	name varchar(300),
    phone varchar(300),
    age int, 
    addr varchar(1000)
);
#자식테이블 
create table Car(
	carnum varchar(300) primary key,
    brand varchar(300),
    color varchar(300),
    price int,
    id varchar(300),
    constraint car_owner_fk foreign key(id) references owner(id)
);
```
위와 같이 보통의 관계는 종속관계이다. 

## DML(Data Mainpulation Language)
데이터조작어
실질적으로 데이터들을 CRUD작업을 하는 언어
* 데이터 추가
  * 테이블 컬럼생략 시 모든 데이터를 넣음 
```sql
insert into 테이블명 [(컬럼명1, 컬럼명2,...)] valuses(값1, 값2,...);

#여러개 추가
insert into customer values
	(1, '이강민', 30, '부산시 영도구', 'VIP'),
    (2, '김혜화', 30, '강남구 테헤란로', 'VVIP'),
	(3, '김수수', 24, '경기 남양주시', 'GOLD'),
	(4, '박곽우', 26, '경기 구리시', 'MVP'),
	(5, '심이수', 31, '강북구 압구정', 'VIP');
```

* 데이터 삭제
```sql
delete from 테이블명 where 조건식;
delete from product where product_idx = 1;
삭제를 하면 데이터 한줄을 모두 삭제함
```

* 데이터 수정
```sql
update 테이블명 set 컬럼명 = 새로운값, [ 컬럼명 = 새로운값] where 조건식;
update product set product_price = null where product_idx =1;
위와 같이 일부 데이터를 수정가능함, 곧 일부 데이터를 삭제하고 싶으면 null을 넣음.
```

* 데이터 검색
```sql
select 컬럼명1, 컬럼명2.... from 테이블명 where 조건식;
select * from product;
모든 데이터를 가져옴. 
```

### 실습 
```sql
/**********************************실 습********************************/
use web0315;
select * from car;
# owner에 두명 더 추가하기(banana, cherry)
insert into owner values('banana', '반하나', '01025511515',30,'울릉시 울릉구 울릉동');
insert into owner values('cherry', '체리하', '01025555252',65,'제주시 서귀포구 공항동');

# car에 3대 더 추가하기
insert into car values('205하2020', 'Lamborugini', 'Yellow', 300000000, 'banana');
insert into car values('205하2023', 'Tico', 'Yellow', 50000000, 'banana');
insert into car values('23라5222', 'bmw520d', 'black', 60000000, 'cherry');
insert into car values('223가5555', 'accent', 'white', 18000000, 'cherry');

# car에서 banana의 자동차 중 4000만원 이상 1억원 이하의 자동차만 색깔을 gold로 바꾸기
update car set color = 'Gold' where id='banana' and price >= 40000000 and price <= 100000000;

# car에서 cherry의 자동차 중 2000만원 이하의 자동차 삭제하기 
delete from car where id = 'cherry' and price <= 20000000;

#☆★☆★☆★☆★			database : world			☆★☆★☆★☆★☆★☆★
#country 테이블
use world;
select * from country;
#소속 대륙(Continent)이 Asia인 나라 검색
select Name,Continent from country where Continent = 'Asia';

#소속 대륙(Continent)이 Europe이 아닌 나라 검색
select Name,Continent from country where Continent != 'Europe';

#인구수(Population)가 1000만 이하인 나라 검색
select Name,Population from country where Population <= 10000000;

#인구수(Population)가 7000만 이상인 나라 검색
select Name,Population from country where Population <= 70000000;

#인구수(Population)는 4500만 이상이면서 넓이(SurfaceArea)가 10만제곱km이하인 나라 검색
select Name,Population, SurfaceArea from country 
where Population >= 45000000 and SurfaceArea <= 100000;

#소속 대륙(Continent)은 Asia 이고 건국 연도(IndepYear)가 1948인 나라 검색
select * from country where Continent = 'Asia' and IndepYear = 1948;

#지역(Region)이 동아프리카(Eastern Africa) 이고 건국 연도 가 1970~1980인 나라 검색
select Name, Region,IndepYear from country 
	where Region = 'Eastern Africa' and IndepYear between 1970 and 1980; 

select Name, Region,IndepYear from country 
	where Region = 'Eastern Africa' and IndepYear >= 1970 and IndepYear <= 1980;
```

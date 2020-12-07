drop table wine_basket;
drop table product_basket;
drop table recommend_product;
drop table wine;
drop table product;
drop table user_member;

drop sequence p_seq;
drop sequence w_seq;
drop sequence rp_seq;

--와인 테이블
create table wine(
   wine_name varchar(100) not null primary key,
   use varchar(100) not null, 
    sort varchar(100) not null , 
    country varchar(100) not null ,
    area varchar(100) default ' ',
    grape varchar(100) not null ,
    grade varchar(100) default ' ',
    sugar NUMBER not null,
    acidity number not null,
    body number not null,
    alcohol varchar(100) not null,
    price varchar(100) not null,
    picture varchar(150) default ' ',
    info varchar(500) not null
)

select * from wine;
-- //화이트와인,아페리티프와인,1,3,2
select wine_name,picture from wine where sort = '화이트와인' and use = '아페리티프와인' and sugar = 1 and acidity = 3 and body=2

--상품 테이블
create table product(
   catagory varchar(100) not null,
   product_name varchar(100) not null primary key
)

--회원 테이블
create table user_member(
   id varchar(100) primary key not null,
   pw varchar(100) not null ,
   email varchar(100) not null ,
   name varchar(100) not null ,
   tel varchar(100) not null 
)

--와인 장바구니 테이블
create table wine_basket(
   w_seq number primary key not null,
   id varchar(100) not null,
   wine_name varchar(100),
   count number,
   constraint WB_id_fk foreign key(id) references user_member(id),
   constraint WB_wine_fk foreign key(wine_name) references wine(wine_name)
)
--상품 장바구니 테이블
create table product_basket(
   p_seq number primary key,   
   product_name varchar(100),
   id varchar(100) not null,
   count number,
   constraint PB_id_fk foreign key(id) references user_member(id),
   constraint PB_product_fk foreign key(product_name) references product(product_name)
)

--추천상품 테이블
create table recommend_product(
   rp_seq number primary key,
   wine_name varchar(100) not null,
   product_name varchar(100) not null,
   constraint rp_pn_fk foreign key(product_name) references product(product_name),
   constraint rp_wn_fk foreign key(wine_name) references wine(wine_name)
)

--추천상품 시퀀스
create sequence rp_seq
 increment by 1
 start with 1001
 minvalue 1001 
 maxvalue 1500;

--상품 장바구니 시퀀스
create sequence p_seq
 increment by 1
 start with 501
 minvalue 501
 maxvalue 1000;

--와인 장바구니 시퀀스
create sequence w_seq
 increment by 1
 start with 1
 minvalue 1
 maxvalue 500;

insert into wine values('클라우디 베이 소비뇽 블랑','아페리티프와인','화이트와인','뉴질랜드(New Zealand)','Marlborough','Sauvignon Blanc 100%','',1,3,2,'14도','50,000','images/white_wine/white01.jpg',
'엷은 초록색을 띄고 있으며, 신선한 열대과일과 라임향,풋풋한 풀내음이 느껴진다. 입안에서는 산뜻함과 깔끔한 여운이 특징적이다.');
insert into wine values('테를란 빙클 소비뇽 블랑','테이블와인','화이트와인','이탈리아(Italy)','Trentino-Alto Adige','Sauvignon Blanc 100%','',1,3,3,'13.5도','45,000','images/white_wine/white02.PNG',
'진한 과일 풍미와 함께 산뜻한 산미가 입에서 기분좋게 어우러진다. 향긋한 향과 탄탄한 짜임새를 갖춘 화이트 와인이다.');
insert into wine values('라포스톨 그랑 셀렉션 쇼비뇽 블랑','테이블와인','화이트와인','칠레(Chile)','Rapel Valley','Sauvignon Blanc 85%, Semillon 8%, Sauvignon Gris 7% ','',1,4,3,'13.5도','35,000','images/white_wine/white03.PNG',
'매우 집중적인 열대과일향과 시트러스 향 그리고 허브 톤이 느껴지며 입안에서 산도와 볼륨감이 균형이 잘 잡혀 인상적이다.');
insert into wine values('도스 코파스 샤르도네','테이블와인','화이트와인','칠레(Chile)','','Chardonnay 100%','',1,3,3,'13도','4,900','images/white_wine/white04.PNG',
'밝은 옐로우 빛을 띠고 열대 과일의 진한 향이 느껴진다. 복숭아와 파인애플의 맛이 프레시하게 조화를 이루며 지속력이 뛰어나고 향이 돋보이는 와인이다.');
insert into wine values('오이스터 베이 쇼비뇽 블랑','테이블와인','화이트와인','뉴질랜드(New Zealand)','South Island','Sauvignon Blanc 100% ','',1,3,2,'13도','35,000','images/white_wine/white05.PNG',
'풍부하고 우아한 아로마가 입안에서 전해지며 산도와 고급스러운 미네랄 터치가 훌륭한 밸런스를 이룬다. 특유의 청량감과 발랄함이 돋보이는 와인이다.');
insert into wine values('포르타 6 블랑코','테이블와인','화이트와인','포르투갈(Portugal)','Lisboa','Fernao Pires 60%, Arinto 30%, Moscatel 10%','',2,3,3,'13도','19,000','images/white_wine/white06.PNG',
'파인애플,망고 등의 열대과일향과 패션푸르트의 강렬한 풍미가 매력적인 와인으로 산뜻한 미네랄리티와 산도가 느껴지며 모스까뗄의 부드럽고 달달한 마무리가 인상적인 와인이다.');
insert into wine values('벨탁스 리슬링','테이블와인','화이트와인','독일(Germany)','Weltachs','Riesling 100%','',4,3,2,'13도','9,800','images/white_wine/white07.PNG',
'라이트와 무거운 맛 중간정도 이며, 드라이한 편이고, 부드럽기보단 신맛이 많이 난다.');
insert into wine values('폰타나프레다 르프롱드 모스카토 다스티','디저트와인', '화이트와인','이탈리아(Italy)','Piemonte','Moscato 100%','',4,2,3,'6.5도','19,800','images/white_wine/white08.PNG',
'사향,오렌지 꽃,꿀의 달콤하고 신선한 노트가 매우 돋보이는 와인이다. 전체적으로 균형을 잘 이루었으며 벌꿀의 달콤한과 신선한 맛이 잘 어우러진 기분을 유쾌하게 만들어주는 모스카토 와인이다.');
insert into wine values('엠 샤푸티에 꼬뜨 뒤 론 블랑','테이블와인','화이트와인','프랑스(France)','Rhone','Grenache Blanc, Bourboulenc, Clairette','',1,2,1,'13도','22,800','images/white_wine/white09.PNG',
'레몬향,미네랄리티가 느껴지는 와인으로 꿀 향도 옅게나마 느낄 수 있다. 미디엄 산도감을 가지고 있으며 전체적으로 비교적 신선한 느낌을 주는 와인이다.');
insert into wine values('G7 리저브 샤도네이','테이블와인','화이트와인','칠레(Chile)','Maule Valley','Chardonnay 100%','',1,3,3,'10도','14,000','images/white_wine/white10.PNG',
'밝은 황금색을 띠고 있으며 복숭아,바나나,리치,시트러스의 신선하고 달콤한 향과 함께 고소한 헤이즐넛, 바닐라 아로마를 즐길 수 있다. 풍부한 과즙맛과 산뜻하게 마무리해주는 산미의 균형감이 뛰어난 와인이다.');

insert into wine values('코노수르 싱글빈야드 쉬라','테이블와인','레드와인','칠레(Chile)','Aconcagua','Syrah/Shiraz 100%','',1,4,5,'16도','32,800','images/red_wine/red01.PNG',
'포도밭 내에서도 가장 좋은 구획의 포도만을 엄선해 각 포도 품종이 지닌 매력을 극대화 시킨 와인이다. 라벨에 포도가 재배된 구획의 번호,이름,위치를 기재함으로써 구대륙 컨셉인 떼루아를 부각 시킨다.');
insert into wine values('1865 싱글빈야드 까베르네 소비뇽','테이블와인','레드와인','칠레(Chile)','Maipo Valley','Cabernet Sauvignon 100%','',1,3,4,'14도','32,800','images/red_wine/red02.jpg',
'2003년부터 2016년까지 국내 총 누적 판매량 400만병을 돌파한 국내 최고의 칠레와인으로 모든 사람들이 좋아하는 와인이다.');
insert into wine values('도스 코파스 레드','테이블와인','레드와인','칠레(Chile)','Maule Valley/Central Valley ','Tempranillo, Garnatxa','',2,2,3,'12도','4,900','images/red_wine/red03.PNG',
'스페인을 대표하는 두 품종인 템프라니요와 가르나차를 블렌딩해 만든 레드와인으로 전형적이 스페인 와인의 특징을 가진다. 풍부한 과실향과 균형 잡힌 맛을 자랑하고 어떤 음삭과도 무난하게 잘 어울린다.');
insert into wine values('트라피체 오크캐스크 말벡','테이블와인','레드와인','칠레(Chile)','Mendoza','Malbec 100%','',1,3,4,'13도','19,800','images/red_wine/red04.PNG',
'트라피체의 플래그쉽 리저브 와인으로 13개월 동안 오크 숙성하여 아르헨티나의 전형적인 떼루아를 보여준다. 이제 막 와인의 세계에 입문한 초보자들이나 매일 마실수 있는 편안하고 뛰어난 품질의 와인을 찾는 소비자들에게 적합하다.');
insert into wine values('세븐 폴스 카베르네 소비뇽','테이블와인','레드와인','미국(U.S.A)','Wahluke Slope','Cabernet Sauvignon 100%','',1,4,5,'14도','19,800','images/red_wine/red05.PNG',
'미국 와인 기준을 세운 최초의 워싱턴 프리미엄 와인 브랜드 이다.1967년부터 유럽 전통 포도 품종으로 다채로운 스타일의 워신텅 와인을 선보였으며, 현재 워싱턴 지역의 AVA 등급 체계의 기반이 된 혁신적인 와이너리로 유명하다.');
insert into wine values('롤라이오 상그리아 레드','아페리티프와인','레드와인','스페인(Spain)','Madrid','Tempranillo','',3,2,2,'14도','7,800','images/red_wine/red06.PNG',
'지중해 과일들을 으깨어 만든 즙에 스페인 토착 품종인 템프라니와 보발로 만든 와인을 혼합하여 스페인 전통적인 방식으로 만든 샹그리아 입니다.');
insert into wine values('엠 샤푸티에 코트 뒤 론 루즈','테이블와인','레드와인','프랑스(France)','Rhone','Grenache, Syrah/Shiraz, Mourvedre','',1,3,4,'14도','14,800','images/red_wine/red07.PNG',
'M.샤푸티에의 많은 포트폴리오들 중 가장 가성비가 뛰어난 와인들로만 구성된 GMS레인지로 불가피한 이라는 뜻을 가지고 있으며 모든 사람들이 한번씩 먹어봐야할 와인이라는 뜻을 내포하고 있다.');
insert into wine values('아싸 크리안자','테이블와인','레드와인','스페인(Spain)','Ribera del Duero','Tempranillo 100%','',1,5,4,'14도','23,000','images/red_wine/red08.PNG',
'블랙커런트,블랙베리 등 검은 과일의 진한 아로마와 향신료 향이 느껴지며, 잘 다듬어진 탄닌 맛과 볼륨감, 텐션을 잡아주는 산미가 어우러진 맛을 즐길수 있다.');
insert into wine values('샤또 기봉 레드','테이블와인','레드와인','프랑스(France)','Bordeaux','Cabernet Sauvignon 50%, Merlot 50%','',1,3,3,'16도','17,000','images/red_wine/red09.PNG',
'진한 보라 빛이 감도는 루비 컬러에 블랙 커런트,자두, 체리와 같은 과일향이 지속적으로 느껴지며 입안에서는 부드러운 탄닌과 산뜻한 산도가 훌륭한 밸런스를 이룬다.');
insert into wine values('들라스 꼬뜨 방뚜 하프','테이블와인','레드와인','프랑스(France)','Rhone','Crenache 80%, Syrah/Shiraz 20%','',1,3,4,'13도','8,800','images/red_wine/red10.PNG',
'블랙베리,라스베리 과실의 신선함이 돋보이며 스파이시한 아로마가 밸런스를 이루어 진하지만 누구나 쉽게 마실 수 있는 가성비 좋은 와인이다.');

insert into wine values('뵈브클리코 옐로우라벨','아페리티프와인','스파클링와인','프랑스(France)','Champagne','Pinot Noir(50~55%), Pinot Meunier(15~20%), Chardonnay(28~33%)','',1,5,4,'12도','74,500','images/sparkling_wine/sp01.PNG',
'미세한 기포가 입안을 감싸면서 기분좋게 해주며, 2차 발효로 인한 이스트 아로마가 특징적이다. 입안에서는 감귤류, 미네랄향이 감돌며, 마지막 한모금까지 우아하게 마실수 있는 샴페인이다.');
insert into wine values('발레벨보 모스까또 다스띠','디저트와인','스파클링와인','이탈리아(Italy)','Piemonte','Moscato 100%','',4,2,2,'5.5도','14,800','images/sparkling_wine/sp02.PNG',
'어우러지는 와인, 기분 좋은 당도와 신선함의 하모니가 두드러지며 과일 향의 향긋함이 인상적이다.');
insert into wine values('아바지아, 허니문 모스카토','디저트와인','스파클링와인','이탈리아(Italy)','Piemonte','Moscato 100%','',4,1,2,'6도','10,800','images/sparkling_wine/sp03.PNG',
'장미와 같은 꽃향기와 달콤한 과실의 향이 피어오른다. 기분 좋은 달콤함이 입안 가득 퍼지며 적당한 산도감과 어우러진 과실의 풍미가 매력적이다.');
insert into wine values('빌라엠 로쏘','디저트와인','스파클링와인','이탈리아(Italy)','Piemonte','Brachetto 100%','',4,1,3,'5도','24,000','images/sparkling_wine/sp04.PNG',
'로맨틱한 붉은 장미 빛깔을 가지고 있으며 부드러운 기포와 잘 익은 붉은 과일향이 매력적인 스위트 와인이다. 식전주나 간단한 샐러드,식후 디저트 와인으로 좋으며 달콤한 향과 맛이 디저트류와 환상적인 궁합이다.');
insert into wine values('엘렉트라 화이트','디저트와인','스파클링와인','미국(U.S.A)','California','Blend','',3,2,3,'5도','14,000','images/sparkling_wine/sp05.PNG',
'밝은 골드색을 띄는 이 와인은 신선한 오렌지의 시트러스한 아로마와 가벼운 산도와 당도가 어우러진 스위트 화이트 와인이다.');
insert into wine values('찰스 하이직 브뤼 밀레짐','아페리티프와인','스파클링와인','프랑스(France)','Champagne','Pinot Noir 60%, Chardonnay 40%','Champagne AOC',1,5,3,'6도','178,200','images/sparkling_wine/sp06.PNG',
'로맨틱한 붉은 장미 빛깔을 가지고 있으며 부드러운 기포와 잘 익은 붉은 과일향이 매력적인 스위트 와인 식전주나 간단한 샐러드, 식후 디저트 와인으로 좋으며 달콤한 향과 맛이 디저트류와 환상적인 궁합이다.');
insert into wine values('찰스 하이직, 로제 리저브','아페리티프와인','스파클링와인','프랑스(France)','Champagne','Pinot Noir 44%, Chardonnay 38%, Pinot Meunier 18%','Champagne AOC',1,4,3,'6도','151,200','images/sparkling_wine/sp07.PNG',
'신선한 복숭아가 섞인 집에서 만든 딸기잼을 생각나게 하는 향이 난다. 시나몬과 생강쿠키의 풍성한 따스함도 느낄수 있다. 입안에서 깊고 파워풀한 느낌을 얻을 수 있다.');
insert into wine values('앙드레 끌루에 상파뉴 브뤼 그랑 리저브','아페리티프와인','스파클링와인','프랑스(France)','Champagne','Pinot Noir','Champagne AOC',1,4,4,'12도','49,500','images/sparkling_wine/sp08.PNG',
'100% 그랑 크뤼 부지에서 재배한 피노누아로 양조해 6년 숙성시킨 샴페인으로, 적당한 산미와 우아한 미네랄 여윤이 균형있는 여운을 남긴다.');
insert into wine values('소피아 블랑 드 블랑','아페리티프와인','스파클링와인','미국(U.S.A)','California','Pinot Blanc 70%, Riesling 15%, Muscat 15%','',1,3,3,'7도','42,300','images/sparkling_wine/sp09.PNG',
'프란시스 포드 코폴라 감독이 그의 딸 소피아 코폴라를 위해 만든 와인이다. 그린애플과 같은 시트러스 계열의 상큼한 아로마가 느껴지고 파인애플의 과실 풍미와 기분좋은 산도감이 청량감을 주는 와인이다.');
insert into wine values('발레벨보 핑크 모스까또 스푸만떼','아페리티프와인','스파클링와인','이탈리아(Italy)','Piemonte','Moscato 100%','',4,2,2,'7도','18,000','images/sparkling_wine/sp10.PNG',
'산뜻한 플로럴 향을 맡을 수 있으며, 밝고 연한 핑크빛과 기분좋은 당도가 어우러져 사랑스럽고 발랄한 이미지를 내뿜는다. 벨벳 같은 목넘김과 거품들이 입안을 기분좋게 자극하는 스파클링 와인이다.');

insert into wine values('모엣샹동 임페리얼', '아페리티프와인', '스파클링와인','프랑스(France)', 'Champagne', 'Pinot Noir, Pinot Meunier, Chardonnay', 'Champagne AOC', 1,4,2, '12도', '74,800', 'images/sparkling_wine/sp11.PNG',
'밝은 노란색 색상의 와인으로 신선한 사과, 감귤류의 뉘앙스가 느껴지며 브리오슈, 씨리얼, 견과의 특징이 잘 어우러져있다.');
insert into wine values('카멜로드 몬테레이 피노누아', '테이블와인', '레드와인', '미국(U.S.A)', 'California', 'Pinot Noir 100%','', 2, 3, 3, '13.5도', '35,000', 'images/red_wine/red11.PNG',
'밝은 루비의 빛깔과 함께, 블랙체리, 딸기 등의 붉은 과일향과 스파이스, 가벼운 꽃향기를 느낄 수 있으며, 풍부하며 부드러운 질감과 긴 피니쉬가 특징이다')

select * from wine


--product 테이블 값
insert into product values('샐러드','친환경 프리미엄 반반 샐러드');
insert into product values('흰살생선','손질필요없는 국산 자연산 고급 흰살생선 달고기');
insert into product values('훈제연어', '썸씽 스페셜 훈제연어');
insert into product values('새우', '국산 생새우');
insert into product values('치즈', '8가지맛 레인보우큐브치즈');
insert into product values('해산물', '노브랜드 해물 모듬');
insert into product values('리조또', '고기듬뿍 크림리조또');
insert into product values('조개', '조개구이모듬');
insert into product values('스테이크', '호주산 냉장 척아이롤 스테이크');
insert into product values('파스타', '앤초비 오일 파스타');
insert into product values('감바스', '바질페스토 감바스 알 아히요');
insert into product values('닭가슴살', '푸드원 훈제 닭가슴살');
insert into product values('까나페', '크라운 아이비');
insert into product values('디저트', '쿠키프렌즈');
insert into product values('디저트', '콰트로 치즈케익');
insert into product values('파스타', '봉골레 크림 빠네');
insert into product values('스테이크', '프라임 척아이롤 구이용');
insert into product values('돼지고기', '더건강한통삼겹스테이크');
insert into product values('갈비찜', '국내산돈갈비찜용');
insert into product values('튀김', '옛날 모듬튀김');
insert into product values('디저트', '피코크 마몰로 마카롱');
insert into product values('과일', '패션후르츠/리치/망고스틴/블루베리 등 13종');
insert into product values('립갈비', '오리지널 바비큐 폭립');
insert into product values('디저트', '파베 초콜릿 다크');
insert into product values('디저트' , '마몰로 티라미수');
insert into product values('디저트', '리얼프렌치 크로크무슈 오리지널');
insert into product values('디저트', '미니 크림퍼프');
insert into product values('견과류', '리얼 데일리너츠');
insert into product values('디저트', '노브랜드티라미수');
insert into product values('디저트', '피코크 마몰로 초콜렛타르트');


select * from recommend_product;

--recommend_product 테이블 값
insert into recommend_product values(rp_seq.nextval,'클라우디 베이 소비뇽 블랑', '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'클라우디 베이 소비뇽 블랑','손질필요없는 국산 자연산 고급 흰살생선 달고기');
insert into recommend_product values(rp_seq.nextval,'테를란 빙클 소비뇽 블랑', '썸씽 스페셜 훈제연어');
insert into recommend_product values(rp_seq.nextval,'테를란 빙클 소비뇽 블랑',  '국산 생새우');
insert into recommend_product values(rp_seq.nextval,'라포스톨 그랑 셀렉션 쇼비뇽 블랑','8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'라포스톨 그랑 셀렉션 쇼비뇽 블랑','노브랜드 해물 모듬');
insert into recommend_product values(rp_seq.nextval,'도스 코파스 샤르도네',  '노브랜드 해물 모듬');
insert into recommend_product values(rp_seq.nextval,'도스 코파스 샤르도네',  '고기듬뿍 크림리조또');
insert into recommend_product values(rp_seq.nextval,'오이스터 베이 쇼비뇽 블랑',  '조개구이모듬');
insert into recommend_product values(rp_seq.nextval,'오이스터 베이 쇼비뇽 블랑',  '호주산 냉장 척아이롤 스테이크');
insert into recommend_product values(rp_seq.nextval,'포르타 6 블랑코',  '앤초비 오일 파스타');
insert into recommend_product values(rp_seq.nextval,'포르타 6 블랑코',  '바질페스토 감바스 알 아히요');
insert into recommend_product values(rp_seq.nextval,'벨탁스 리슬링',  '푸드원 훈제 닭가슴살');
insert into recommend_product values(rp_seq.nextval,'벨탁스 리슬링',  '크라운 아이비');
insert into recommend_product values(rp_seq.nextval,'폰타나프레다 르프롱드 모스카토 다스티',  '쿠키프렌즈');
insert into recommend_product values(rp_seq.nextval,'폰타나프레다 르프롱드 모스카토 다스티',  '콰트로 치즈케익');
insert into recommend_product values(rp_seq.nextval,'엠 샤푸티에 꼬뜨 뒤 론 블랑',  '호주산 냉장 척아이롤 스테이크');
insert into recommend_product values(rp_seq.nextval,'엠 샤푸티에 꼬뜨 뒤 론 블랑',  '노브랜드 해물 모듬');
insert into recommend_product values(rp_seq.nextval,'G7 리저브 샤도네이',  '봉골레 크림 빠네');
insert into recommend_product values(rp_seq.nextval,'G7 리저브 샤도네이',  '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'코노수르 싱글빈야드 쉬라',  '호주산 냉장 척아이롤 스테이크');
insert into recommend_product values(rp_seq.nextval,'코노수르 싱글빈야드 쉬라',  '8가지맛 레인보우큐브치즈'); 
insert into recommend_product values(rp_seq.nextval,'1865 싱글빈야드 까베르네 소비뇽',  '프라임 척아이롤 구이용');
insert into recommend_product values(rp_seq.nextval,'1865 싱글빈야드 까베르네 소비뇽', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'도스 코파스 레드',  '더건강한통삼겹스테이크');
insert into recommend_product values(rp_seq.nextval,'도스 코파스 레드',  '국내산돈갈비찜용');
insert into recommend_product values(rp_seq.nextval,'트라피체 오크캐스크 말벡',  '프라임 척아이롤 구이용');
insert into recommend_product values(rp_seq.nextval,'트라피체 오크캐스크 말벡',  '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'세븐 폴스 카베르네 소비뇽',  '호주산 냉장 척아이롤 스테이크');
insert into recommend_product values(rp_seq.nextval,'세븐 폴스 카베르네 소비뇽',  '옛날 모듬튀김');
insert into recommend_product values(rp_seq.nextval,'롤라이오 상그리아 레드',  '피코크 마몰로 마카롱');
insert into recommend_product values(rp_seq.nextval,'롤라이오 상그리아 레드',  '패션후르츠/리치/망고스틴/블루베리 등 13종');
insert into recommend_product values(rp_seq.nextval,'엠 샤푸티에 코트 뒤 론 루즈', '더건강한통삼겹스테이크');
insert into recommend_product values(rp_seq.nextval,'엠 샤푸티에 코트 뒤 론 루즈', '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'아싸 크리안자',  '호주산 냉장 척아이롤 스테이크');
insert into recommend_product values(rp_seq.nextval,'아싸 크리안자', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'샤또 기봉 레드',  '오리지널 바비큐 폭립');
insert into recommend_product values(rp_seq.nextval,'샤또 기봉 레드',  '국내산돈갈비찜용');
insert into recommend_product values(rp_seq.nextval,'들라스 꼬뜨 방뚜 하프',  '봉골레 크림 빠네');
insert into recommend_product values(rp_seq.nextval,'들라스 꼬뜨 방뚜 하프',  '프라임 척아이롤 구이용');
insert into recommend_product values(rp_seq.nextval,'뵈브클리코 옐로우라벨', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'뵈브클리코 옐로우라벨',  '파베 초콜릿 다크');
insert into recommend_product values(rp_seq.nextval,'발레벨보 모스까또 다스띠',  '마몰로 티라미수');
insert into recommend_product values(rp_seq.nextval,'발레벨보 모스까또 다스띠',  '콰트로 치즈케익');
insert into recommend_product values(rp_seq.nextval,'아바지아, 허니문 모스카토',  '리얼프렌치 크로크무슈 오리지널');
insert into recommend_product values(rp_seq.nextval,'아바지아, 허니문 모스카토', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'빌라엠 로쏘',  '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'빌라엠 로쏘',  '미니 크림퍼프');
insert into recommend_product values(rp_seq.nextval,'엘렉트라 화이트', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'엘렉트라 화이트',  '리얼 데일리너츠');
insert into recommend_product values(rp_seq.nextval,'찰스 하이직 브뤼 밀레짐',  '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'찰스 하이직 브뤼 밀레짐', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'찰스 하이직, 로제 리저브',  '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'찰스 하이직, 로제 리저브', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'앙드레 끌루에 상파뉴 브뤼 그랑 리저브', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'앙드레 끌루에 상파뉴 브뤼 그랑 리저브',  '크라운 아이비');
insert into recommend_product values(rp_seq.nextval,'소피아 블랑 드 블랑',  '친환경 프리미엄 반반 샐러드');
insert into recommend_product values(rp_seq.nextval,'소피아 블랑 드 블랑', '8가지맛 레인보우큐브치즈');
insert into recommend_product values(rp_seq.nextval,'발레벨보 핑크 모스까또 스푸만떼',  '노브랜드티라미수');
insert into recommend_product values(rp_seq.nextval,'발레벨보 핑크 모스까또 스푸만떼',  '피코크 마몰로 초콜렛타르트');
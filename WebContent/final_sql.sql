drop table wine_basket;
drop table product_basket;
drop table recommend_product;
drop table wine;
drop table product;
drop table user_member;

drop sequence p_seq;
drop sequence w_seq;
drop sequence rp_seq;

--���� ���̺�
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
-- //ȭ��Ʈ����,���丮Ƽ������,1,3,2
select wine_name,picture from wine where sort = 'ȭ��Ʈ����' and use = '���丮Ƽ������' and sugar = 1 and acidity = 3 and body=2

--��ǰ ���̺�
create table product(
   catagory varchar(100) not null,
   product_name varchar(100) not null primary key
)

--ȸ�� ���̺�
create table user_member(
   id varchar(100) primary key not null,
   pw varchar(100) not null ,
   email varchar(100) not null ,
   name varchar(100) not null ,
   tel varchar(100) not null 
)

--���� ��ٱ��� ���̺�
create table wine_basket(
   w_seq number primary key not null,
   id varchar(100) not null,
   wine_name varchar(100),
   count number,
   constraint WB_id_fk foreign key(id) references user_member(id),
   constraint WB_wine_fk foreign key(wine_name) references wine(wine_name)
)
--��ǰ ��ٱ��� ���̺�
create table product_basket(
   p_seq number primary key,   
   product_name varchar(100),
   id varchar(100) not null,
   count number,
   constraint PB_id_fk foreign key(id) references user_member(id),
   constraint PB_product_fk foreign key(product_name) references product(product_name)
)

--��õ��ǰ ���̺�
create table recommend_product(
   rp_seq number primary key,
   wine_name varchar(100) not null,
   product_name varchar(100) not null,
   constraint rp_pn_fk foreign key(product_name) references product(product_name),
   constraint rp_wn_fk foreign key(wine_name) references wine(wine_name)
)

--��õ��ǰ ������
create sequence rp_seq
 increment by 1
 start with 1001
 minvalue 1001 
 maxvalue 1500;

--��ǰ ��ٱ��� ������
create sequence p_seq
 increment by 1
 start with 501
 minvalue 501
 maxvalue 1000;

--���� ��ٱ��� ������
create sequence w_seq
 increment by 1
 start with 1
 minvalue 1
 maxvalue 500;

insert into wine values('Ŭ���� ���� �Һ� ���','���丮Ƽ������','ȭ��Ʈ����','��������(New Zealand)','Marlborough','Sauvignon Blanc 100%','',1,3,2,'14��','50,000','images/white_wine/white01.jpg',
'���� �ʷϻ��� ��� ������, �ż��� ������ϰ� ������,ǲǲ�� Ǯ������ ��������. �Ծȿ����� ����԰� ����� ������ Ư¡���̴�.');
insert into wine values('�׸��� ��Ŭ �Һ� ���','���̺����','ȭ��Ʈ����','��Ż����(Italy)','Trentino-Alto Adige','Sauvignon Blanc 100%','',1,3,3,'13.5��','45,000','images/white_wine/white02.PNG',
'���� ���� ǳ�̿� �Բ� ����� ��̰� �Կ��� ������� ��췯����. ����� ��� źź�� ¥�ӻ��� ���� ȭ��Ʈ �����̴�.');
insert into wine values('�������� �׶� ������ ��� ���','���̺����','ȭ��Ʈ����','ĥ��(Chile)','Rapel Valley','Sauvignon Blanc 85%, Semillon 8%, Sauvignon Gris 7% ','',1,4,3,'13.5��','35,000','images/white_wine/white03.PNG',
'�ſ� �������� ���������� ��Ʈ���� �� �׸��� ��� ���� �������� �Ծȿ��� �굵�� �������� ������ �� ���� �λ����̴�.');
insert into wine values('���� ���Ľ� ��������','���̺����','ȭ��Ʈ����','ĥ��(Chile)','','Chardonnay 100%','',1,3,3,'13��','4,900','images/white_wine/white04.PNG',
'���� ���ο� ���� ��� ���� ������ ���� ���� ��������. �����ƿ� ���ξ����� ���� �������ϰ� ��ȭ�� �̷�� ���ӷ��� �پ�� ���� �����̴� �����̴�.');
insert into wine values('���̽��� ���� ��� ���','���̺����','ȭ��Ʈ����','��������(New Zealand)','South Island','Sauvignon Blanc 100% ','',1,3,2,'13��','35,000','images/white_wine/white05.PNG',
'ǳ���ϰ� ����� �Ʒθ��� �Ծȿ��� �������� �굵�� ��޽����� �̳׶� ��ġ�� �Ǹ��� �뷱���� �̷��. Ư���� û������ �߶����� �����̴� �����̴�.');
insert into wine values('����Ÿ 6 �����','���̺����','ȭ��Ʈ����','��������(Portugal)','Lisboa','Fernao Pires 60%, Arinto 30%, Moscatel 10%','',2,3,3,'13��','19,000','images/white_wine/white06.PNG',
'���ξ���,���� ���� ���������� �м�Ǫ��Ʈ�� ������ ǳ�̰� �ŷ����� �������� ����� �̳׶���Ƽ�� �굵�� �������� �𽺱�� �ε巴�� �޴��� �������� �λ����� �����̴�.');
insert into wine values('��Ź�� ������','���̺����','ȭ��Ʈ����','����(Germany)','Weltachs','Riesling 100%','',4,3,2,'13��','9,800','images/white_wine/white07.PNG',
'����Ʈ�� ���ſ� �� �߰����� �̸�, ������� ���̰�, �ε巴�⺸�� �Ÿ��� ���� ����.');
insert into wine values('��Ÿ�������� �����յ� ��ī�� �ٽ�Ƽ','����Ʈ����', 'ȭ��Ʈ����','��Ż����(Italy)','Piemonte','Moscato 100%','',4,2,3,'6.5��','19,800','images/white_wine/white08.PNG',
'����,������ ��,���� �����ϰ� �ż��� ��Ʈ�� �ſ� �����̴� �����̴�. ��ü������ ������ �� �̷������ ������ �����Ѱ� �ż��� ���� �� ��췯�� ����� �����ϰ� ������ִ� ��ī�� �����̴�.');
insert into wine values('�� ��ǪƼ�� ���� �� �� ���','���̺����','ȭ��Ʈ����','������(France)','Rhone','Grenache Blanc, Bourboulenc, Clairette','',1,2,1,'13��','22,800','images/white_wine/white09.PNG',
'������,�̳׶���Ƽ�� �������� �������� �� �⵵ ���Գ��� ���� �� �ִ�. �̵�� �굵���� ������ ������ ��ü������ ���� �ż��� ������ �ִ� �����̴�.');
insert into wine values('G7 ������ ��������','���̺����','ȭ��Ʈ����','ĥ��(Chile)','Maule Valley','Chardonnay 100%','',1,3,3,'10��','14,000','images/white_wine/white10.PNG',
'���� Ȳ�ݻ��� ��� ������ ������,�ٳ���,��ġ,��Ʈ������ �ż��ϰ� ������ ��� �Բ� ����� �������, �ٴҶ� �Ʒθ��� ��� �� �ִ�. ǳ���� ������� ����ϰ� ���������ִ� ����� �������� �پ �����̴�.');

insert into wine values('�ڳ���� �̱ۺ�ߵ� ����','���̺����','�������','ĥ��(Chile)','Aconcagua','Syrah/Shiraz 100%','',1,4,5,'16��','32,800','images/red_wine/red01.PNG',
'������ �������� ���� ���� ��ȹ�� �������� ������ �� ���� ǰ���� ���� �ŷ��� �ش�ȭ ��Ų �����̴�. �󺧿� ������ ���� ��ȹ�� ��ȣ,�̸�,��ġ�� ���������ν� ����� ������ ����Ƹ� �ΰ� ��Ų��.');
insert into wine values('1865 �̱ۺ�ߵ� ����� �Һ�','���̺����','�������','ĥ��(Chile)','Maipo Valley','Cabernet Sauvignon 100%','',1,3,4,'14��','32,800','images/red_wine/red02.jpg',
'2003����� 2016����� ���� �� ���� �Ǹŷ� 400������ ������ ���� �ְ��� ĥ���������� ��� ������� �����ϴ� �����̴�.');
insert into wine values('���� ���Ľ� ����','���̺����','�������','ĥ��(Chile)','Maule Valley/Central Valley ','Tempranillo, Garnatxa','',2,2,3,'12��','4,900','images/red_wine/red03.PNG',
'�������� ��ǥ�ϴ� �� ǰ���� ������Ͽ�� ���������� ������ ���� ����������� �������� ������ ������ Ư¡�� ������. ǳ���� ������� ���� ���� ���� �ڶ��ϰ� � ������� �����ϰ� �� ��︰��.');
insert into wine values('Ʈ����ü ��ũĳ��ũ ����','���̺����','�������','ĥ��(Chile)','Mendoza','Malbec 100%','',1,3,4,'13��','19,800','images/red_wine/red04.PNG',
'Ʈ����ü�� �÷��׽� ������ �������� 13���� ���� ��ũ �����Ͽ� �Ƹ���Ƽ���� �������� ����Ƹ� �����ش�. ���� �� ������ ���迡 �Թ��� �ʺ��ڵ��̳� ���� ���Ǽ� �ִ� ����ϰ� �پ ǰ���� ������ ã�� �Һ��ڵ鿡�� �����ϴ�.');
insert into wine values('���� ���� ī������ �Һ�','���̺����','�������','�̱�(U.S.A)','Wahluke Slope','Cabernet Sauvignon 100%','',1,4,5,'14��','19,800','images/red_wine/red05.PNG',
'�̱� ���� ������ ���� ������ ������ �����̾� ���� �귣�� �̴�.1967����� ���� ���� ���� ǰ������ ��ä�ο� ��Ÿ���� ������ ������ ����������, ���� ������ ������ AVA ��� ü���� ����� �� �������� ���̳ʸ��� �����ϴ�.');
insert into wine values('�Ѷ��̿� ��׸��� ����','���丮Ƽ������','�������','������(Spain)','Madrid','Tempranillo','',3,2,2,'14��','7,800','images/red_wine/red06.PNG',
'������ ���ϵ��� ������ ���� �� ������ ���� ǰ���� ������Ͽ� ���߷� ���� ������ ȥ���Ͽ� ������ �������� ������� ���� ���׸��� �Դϴ�.');
insert into wine values('�� ��ǪƼ�� ��Ʈ �� �� ����','���̺����','�������','������(France)','Rhone','Grenache, Syrah/Shiraz, Mourvedre','',1,3,4,'14��','14,800','images/red_wine/red07.PNG',
'M.��ǪƼ���� ���� ��Ʈ�������� �� ���� ������ �پ ���ε�θ� ������ GMS�������� �Ұ����� �̶�� ���� ������ ������ ��� ������� �ѹ��� �Ծ������ �����̶�� ���� �����ϰ� �ִ�.');
insert into wine values('�ƽ� ũ������','���̺����','�������','������(Spain)','Ribera del Duero','Tempranillo 100%','',1,5,4,'14��','23,000','images/red_wine/red08.PNG',
'��Ŀ��Ʈ,������ �� ���� ������ ���� �Ʒθ��� ��ŷ� ���� ��������, �� �ٵ���� ź�� ���� ������, �ټ��� ����ִ� ��̰� ��췯�� ���� ���� �ִ�.');
insert into wine values('���� ��� ����','���̺����','�������','������(France)','Bordeaux','Cabernet Sauvignon 50%, Merlot 50%','',1,3,3,'16��','17,000','images/red_wine/red09.PNG',
'���� ���� ���� ������ ��� �÷��� �� Ŀ��Ʈ,�ڵ�, ü���� ���� �������� ���������� �������� �Ծȿ����� �ε巯�� ź�Ѱ� ����� �굵�� �Ǹ��� �뷱���� �̷��.');
insert into wine values('��� ���� ��� ����','���̺����','�������','������(France)','Rhone','Crenache 80%, Syrah/Shiraz 20%','',1,3,4,'13��','8,800','images/red_wine/red10.PNG',
'������,�󽺺��� ������ �ż����� �����̸� �����̽��� �Ʒθ��� �뷱���� �̷�� �������� ������ ���� ���� �� �ִ� ������ ���� �����̴�.');

insert into wine values('�ƺ�Ŭ���� ���ο��','���丮Ƽ������','����Ŭ������','������(France)','Champagne','Pinot Noir(50~55%), Pinot Meunier(15~20%), Chardonnay(28~33%)','',1,5,4,'12��','74,500','images/sparkling_wine/sp01.PNG',
'�̼��� ������ �Ծ��� ���θ鼭 ������� ���ָ�, 2�� ��ȿ�� ���� �̽�Ʈ �Ʒθ��� Ư¡���̴�. �Ծȿ����� ���ַ�, �̳׶����� ������, ������ �Ѹ�ݱ��� ����ϰ� ���Ǽ� �ִ� �������̴�.');
insert into wine values('�߷����� �𽺱�� �ٽ���','����Ʈ����','����Ŭ������','��Ż����(Italy)','Piemonte','Moscato 100%','',4,2,2,'5.5��','14,800','images/sparkling_wine/sp02.PNG',
'��췯���� ����, ��� ���� �絵�� �ż����� �ϸ�ϰ� �ε巯���� ���� ���� ������� �λ����̴�.');
insert into wine values('�ƹ�����, ��Ϲ� ��ī��','����Ʈ����','����Ŭ������','��Ż����(Italy)','Piemonte','Moscato 100%','',4,1,2,'6��','10,800','images/sparkling_wine/sp03.PNG',
'��̿� ���� ������ ������ ������ ���� �Ǿ������. ��� ���� �������� �Ծ� ���� ������ ������ �굵���� ��췯�� ������ ǳ�̰� �ŷ����̴�.');
insert into wine values('���� �ν�','����Ʈ����','����Ŭ������','��Ż����(Italy)','Piemonte','Brachetto 100%','',4,1,3,'5��','24,000','images/sparkling_wine/sp04.PNG',
'�θ�ƽ�� ���� ��� ������ ������ ������ �ε巯�� ������ �� ���� ���� �������� �ŷ����� ����Ʈ �����̴�. �����ֳ� ������ ������,���� ����Ʈ �������� ������ ������ ��� ���� ����Ʈ���� ȯ������ �����̴�.');
insert into wine values('����Ʈ�� ȭ��Ʈ','����Ʈ����','����Ŭ������','�̱�(U.S.A)','California','Blend','',3,2,3,'5��','14,000','images/sparkling_wine/sp05.PNG',
'���� ������ ��� �� ������ �ż��� �������� ��Ʈ������ �Ʒθ��� ������ �굵�� �絵�� ��췯�� ����Ʈ ȭ��Ʈ �����̴�.');
insert into wine values('���� ������ ��� �з���','���丮Ƽ������','����Ŭ������','������(France)','Champagne','Pinot Noir 60%, Chardonnay 40%','Champagne AOC',1,5,3,'6��','178,200','images/sparkling_wine/sp06.PNG',
'�θ�ƽ�� ���� ��� ������ ������ ������ �ε巯�� ������ �� ���� ���� �������� �ŷ����� ����Ʈ ���� �����ֳ� ������ ������, ���� ����Ʈ �������� ������ ������ ��� ���� ����Ʈ���� ȯ������ �����̴�.');
insert into wine values('���� ������, ���� ������','���丮Ƽ������','����Ŭ������','������(France)','Champagne','Pinot Noir 44%, Chardonnay 38%, Pinot Meunier 18%','Champagne AOC',1,4,3,'6��','151,200','images/sparkling_wine/sp07.PNG',
'�ż��� �����ư� ���� ������ ���� �������� �������� �ϴ� ���� ����. �ó���� ������Ű�� ǳ���� �����Ե� ������ �ִ�. �Ծȿ��� ��� �Ŀ�Ǯ�� ������ ���� �� �ִ�.');
insert into wine values('�ӵ巹 ���翡 ���Ĵ� ��� �׶� ������','���丮Ƽ������','����Ŭ������','������(France)','Champagne','Pinot Noir','Champagne AOC',1,4,4,'12��','49,500','images/sparkling_wine/sp08.PNG',
'100% �׶� ũ�� �������� ����� �ǳ봩�Ʒ� ������ 6�� ������Ų ����������, ������ ��̿� ����� �̳׶� ������ �����ִ� ������ �����.');
insert into wine values('���Ǿ� ��� �� ���','���丮Ƽ������','����Ŭ������','�̱�(U.S.A)','California','Pinot Blanc 70%, Riesling 15%, Muscat 15%','',1,3,3,'7��','42,300','images/sparkling_wine/sp09.PNG',
'�����ý� ���� ������ ������ ���� �� ���Ǿ� ������ ���� ���� �����̴�. �׸����ð� ���� ��Ʈ���� �迭�� ��ŭ�� �Ʒθ��� �������� ���ξ����� ���� ǳ�̿� ������� �굵���� û������ �ִ� �����̴�.');
insert into wine values('�߷����� ��ũ �𽺱�� ��Ǫ����','���丮Ƽ������','����Ŭ������','��Ż����(Italy)','Piemonte','Moscato 100%','',4,2,2,'7��','18,000','images/sparkling_wine/sp10.PNG',
'����� �÷η� ���� ���� �� ������, ��� ���� ��ũ���� ������� �絵�� ��췯�� ��������� �߶��� �̹����� ���մ´�. ���� ���� ��ѱ�� ��ǰ���� �Ծ��� ������� �ڱ��ϴ� ����Ŭ�� �����̴�.');

insert into wine values('�𿧼��� ���丮��', '���丮Ƽ������', '����Ŭ������','������(France)', 'Champagne', 'Pinot Noir, Pinot Meunier, Chardonnay', 'Champagne AOC', 1,4,2, '12��', '74,800', 'images/sparkling_wine/sp11.PNG',
'���� ����� ������ �������� �ż��� ���, ���ַ��� ���ӽ��� �������� �긮����, ������, �߰��� Ư¡�� �� ��췯���ִ�.');
insert into wine values('ī��ε� ���׷��� �ǳ봩��', '���̺����', '�������', '�̱�(U.S.A)', 'California', 'Pinot Noir 100%','', 2, 3, 3, '13.5��', '35,000', 'images/red_wine/red11.PNG',
'���� ����� ����� �Բ�, ��ü��, ���� ���� ���� ������� �����̽�, ������ ����⸦ ���� �� ������, ǳ���ϸ� �ε巯�� ������ �� �ǴϽ��� Ư¡�̴�')

select * from wine


--product ���̺� ��
insert into product values('������','ģȯ�� �����̾� �ݹ� ������');
insert into product values('������','�����ʿ���� ���� �ڿ��� ��� ������ �ް��');
insert into product values('��������', '��� ����� ��������');
insert into product values('����', '���� ������');
insert into product values('ġ��', '8������ ���κ���ť��ġ��');
insert into product values('�ػ깰', '��귣�� �ع� ���');
insert into product values('������', '����� ũ��������');
insert into product values('����', '�������̸��');
insert into product values('������ũ', 'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into product values('�Ľ�Ÿ', '���ʺ� ���� �Ľ�Ÿ');
insert into product values('���ٽ�', '�����佺�� ���ٽ� �� ������');
insert into product values('�߰�����', 'Ǫ��� ���� �߰�����');
insert into product values('���', 'ũ��� ���̺�');
insert into product values('����Ʈ', '��Ű������');
insert into product values('����Ʈ', '��Ʈ�� ġ������');
insert into product values('�Ľ�Ÿ', '���� ũ�� ����');
insert into product values('������ũ', '������ ô���̷� ���̿�');
insert into product values('�������', '���ǰ������㽺����ũ');
insert into product values('������', '�����굷�������');
insert into product values('Ƣ��', '���� ���Ƣ��');
insert into product values('����Ʈ', '����ũ ������ ��ī��');
insert into product values('����', '�м��ĸ���/��ġ/����ƾ/��纣�� �� 13��');
insert into product values('������', '�������� �ٺ�ť ����');
insert into product values('����Ʈ', '�ĺ� ���ݸ� ��ũ');
insert into product values('����Ʈ' , '������ Ƽ��̼�');
insert into product values('����Ʈ', '��������ġ ũ��ũ���� ��������');
insert into product values('����Ʈ', '�̴� ũ������');
insert into product values('�߰���', '���� ���ϸ�����');
insert into product values('����Ʈ', '��귣��Ƽ��̼�');
insert into product values('����Ʈ', '����ũ ������ ���ݷ�Ÿ��Ʈ');


select * from recommend_product;

--recommend_product ���̺� ��
insert into recommend_product values(rp_seq.nextval,'Ŭ���� ���� �Һ� ���', 'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'Ŭ���� ���� �Һ� ���','�����ʿ���� ���� �ڿ��� ��� ������ �ް��');
insert into recommend_product values(rp_seq.nextval,'�׸��� ��Ŭ �Һ� ���', '��� ����� ��������');
insert into recommend_product values(rp_seq.nextval,'�׸��� ��Ŭ �Һ� ���',  '���� ������');
insert into recommend_product values(rp_seq.nextval,'�������� �׶� ������ ��� ���','8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�������� �׶� ������ ��� ���','��귣�� �ع� ���');
insert into recommend_product values(rp_seq.nextval,'���� ���Ľ� ��������',  '��귣�� �ع� ���');
insert into recommend_product values(rp_seq.nextval,'���� ���Ľ� ��������',  '����� ũ��������');
insert into recommend_product values(rp_seq.nextval,'���̽��� ���� ��� ���',  '�������̸��');
insert into recommend_product values(rp_seq.nextval,'���̽��� ���� ��� ���',  'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into recommend_product values(rp_seq.nextval,'����Ÿ 6 �����',  '���ʺ� ���� �Ľ�Ÿ');
insert into recommend_product values(rp_seq.nextval,'����Ÿ 6 �����',  '�����佺�� ���ٽ� �� ������');
insert into recommend_product values(rp_seq.nextval,'��Ź�� ������',  'Ǫ��� ���� �߰�����');
insert into recommend_product values(rp_seq.nextval,'��Ź�� ������',  'ũ��� ���̺�');
insert into recommend_product values(rp_seq.nextval,'��Ÿ�������� �����յ� ��ī�� �ٽ�Ƽ',  '��Ű������');
insert into recommend_product values(rp_seq.nextval,'��Ÿ�������� �����յ� ��ī�� �ٽ�Ƽ',  '��Ʈ�� ġ������');
insert into recommend_product values(rp_seq.nextval,'�� ��ǪƼ�� ���� �� �� ���',  'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into recommend_product values(rp_seq.nextval,'�� ��ǪƼ�� ���� �� �� ���',  '��귣�� �ع� ���');
insert into recommend_product values(rp_seq.nextval,'G7 ������ ��������',  '���� ũ�� ����');
insert into recommend_product values(rp_seq.nextval,'G7 ������ ��������',  '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�ڳ���� �̱ۺ�ߵ� ����',  'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into recommend_product values(rp_seq.nextval,'�ڳ���� �̱ۺ�ߵ� ����',  '8������ ���κ���ť��ġ��'); 
insert into recommend_product values(rp_seq.nextval,'1865 �̱ۺ�ߵ� ����� �Һ�',  '������ ô���̷� ���̿�');
insert into recommend_product values(rp_seq.nextval,'1865 �̱ۺ�ߵ� ����� �Һ�', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'���� ���Ľ� ����',  '���ǰ������㽺����ũ');
insert into recommend_product values(rp_seq.nextval,'���� ���Ľ� ����',  '�����굷�������');
insert into recommend_product values(rp_seq.nextval,'Ʈ����ü ��ũĳ��ũ ����',  '������ ô���̷� ���̿�');
insert into recommend_product values(rp_seq.nextval,'Ʈ����ü ��ũĳ��ũ ����',  'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'���� ���� ī������ �Һ�',  'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into recommend_product values(rp_seq.nextval,'���� ���� ī������ �Һ�',  '���� ���Ƣ��');
insert into recommend_product values(rp_seq.nextval,'�Ѷ��̿� ��׸��� ����',  '����ũ ������ ��ī��');
insert into recommend_product values(rp_seq.nextval,'�Ѷ��̿� ��׸��� ����',  '�м��ĸ���/��ġ/����ƾ/��纣�� �� 13��');
insert into recommend_product values(rp_seq.nextval,'�� ��ǪƼ�� ��Ʈ �� �� ����', '���ǰ������㽺����ũ');
insert into recommend_product values(rp_seq.nextval,'�� ��ǪƼ�� ��Ʈ �� �� ����', 'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'�ƽ� ũ������',  'ȣ�ֻ� ���� ô���̷� ������ũ');
insert into recommend_product values(rp_seq.nextval,'�ƽ� ũ������', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'���� ��� ����',  '�������� �ٺ�ť ����');
insert into recommend_product values(rp_seq.nextval,'���� ��� ����',  '�����굷�������');
insert into recommend_product values(rp_seq.nextval,'��� ���� ��� ����',  '���� ũ�� ����');
insert into recommend_product values(rp_seq.nextval,'��� ���� ��� ����',  '������ ô���̷� ���̿�');
insert into recommend_product values(rp_seq.nextval,'�ƺ�Ŭ���� ���ο��', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�ƺ�Ŭ���� ���ο��',  '�ĺ� ���ݸ� ��ũ');
insert into recommend_product values(rp_seq.nextval,'�߷����� �𽺱�� �ٽ���',  '������ Ƽ��̼�');
insert into recommend_product values(rp_seq.nextval,'�߷����� �𽺱�� �ٽ���',  '��Ʈ�� ġ������');
insert into recommend_product values(rp_seq.nextval,'�ƹ�����, ��Ϲ� ��ī��',  '��������ġ ũ��ũ���� ��������');
insert into recommend_product values(rp_seq.nextval,'�ƹ�����, ��Ϲ� ��ī��', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'���� �ν�',  'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'���� �ν�',  '�̴� ũ������');
insert into recommend_product values(rp_seq.nextval,'����Ʈ�� ȭ��Ʈ', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'����Ʈ�� ȭ��Ʈ',  '���� ���ϸ�����');
insert into recommend_product values(rp_seq.nextval,'���� ������ ��� �з���',  'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'���� ������ ��� �з���', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'���� ������, ���� ������',  'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'���� ������, ���� ������', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�ӵ巹 ���翡 ���Ĵ� ��� �׶� ������', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�ӵ巹 ���翡 ���Ĵ� ��� �׶� ������',  'ũ��� ���̺�');
insert into recommend_product values(rp_seq.nextval,'���Ǿ� ��� �� ���',  'ģȯ�� �����̾� �ݹ� ������');
insert into recommend_product values(rp_seq.nextval,'���Ǿ� ��� �� ���', '8������ ���κ���ť��ġ��');
insert into recommend_product values(rp_seq.nextval,'�߷����� ��ũ �𽺱�� ��Ǫ����',  '��귣��Ƽ��̼�');
insert into recommend_product values(rp_seq.nextval,'�߷����� ��ũ �𽺱�� ��Ǫ����',  '����ũ ������ ���ݷ�Ÿ��Ʈ');
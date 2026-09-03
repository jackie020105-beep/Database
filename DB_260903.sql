select *
from a_out_m
WHERE outbound_date = '2023-01-03'
order by brand_cd, order_nm;

select *
from a_out_m
where outbound_date = '2023-01-04'
and order_nm = '김민기';

select *
from a_out_d
where item_cd = 'A';

select *
from a_out_d
where item_cd = 'C'
and order_qty >= 3;

select *
from a_item
where brand_cd = '1001';

select brand_cd as 브랜드, invoice_no as 인보이스, order_nm as 주문자명
from a_out_m
where outbound_date = '2023-01-03'
or outbound_date = '2023-01-04';

select brand_cd as 브랜드, invoice_no as 인보이스, order_nm as 주문자명
from a_out_m
where outbound_date IN ('2023-01-03', '2023-01-04'); --in 연산자


select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where brand_cd = '1001'
and order_qty >= 3
and (item_cd = 'C' 
    or item_cd = 'A' 
    or item_cd = 'B');

select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where brand_cd = '1001'
and order_qty >= 3
and item_cd in ('C', 'A', 'B'); --in 연산자

select brand_cd as 브랜드, invoice_no as 인보이스, outbound_date as 출고일자, order_nm as 주문자
from a_out_m
where outbound_date between '2023-01-01' and '2023-01-04'
and order_nm in ('김민기', '윤현수');

select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where invoice_no between '#01' and '#05'
and order_qty >= 3
and item_cd in ('C', 'A', 'B');

select brand_cd as 브랜드, invoice_no as 인보이스, outbound_date as 출고일자, order_nm as 주문자
from a_out_m
where invoice_no between '#01' and '#05'
and (order_nm like '전%' 
    or order_nm like '권%');
    
select brand_cd as 브랜드, invoice_no as 인보이스, outbound_date as 출고일자, order_nm as 주문자
from a_out_m
where invoice_no between '#01' and '#05'
and substr(order_nm,1,1) 
    in ('전', '권'); --substr

select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where invoice_no like '#0%'
and order_qty >= 3;

select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where invoice_no like '#0%'
and order_qty >= 3
order by order_qty desc; --desc써야 내림차순 (기본값이 오름차순)

select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
from a_out_d
where invoice_no like '#0%'
and order_qty >= 3
order by order_qty desc, item_cd; --desc써야 내림차순 (기본값이 오름차순)

select *
from(
    select brand_cd as 브랜드, invoice_no as 인보이스, item_cd as 상품코드, order_qty as 주문수량
    from a_out_d
    where invoice_no like '#0%'
    and order_qty >= 3
    order by order_qty, item_cd
    )
where rownum <= 2; --TOP2만 뽑기

select count(invoice_no)
from a_out_m
where outbound_date between '2023-01-03' and '2023-01-04';

select sum(order_qty)
from a_out_d
where brand_cd = '1001';
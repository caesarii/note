select 
    count(*) as total,
    par,
    first(app_version)
from dw.dwd_log_track         
where 
  par >= '20230828' 
  and par <= '20230905'
  and app_version like '2.%' 
  and app_version > '2.145.4' 

  and event_sign='enterpage'      
  and page_path in ('pages/tab/three/index', 	'pages/tab/two/index', 'packages/trade-cart/cart/index')
  and page_type = 'cart' 
  group by par
  limit 100


-- 商详
-- app_version like '2.%' 700w~800w/天
-- app_version > '2.145.4' 500w~600w/天
-- 性能埋点 300w左右一天




-- 购物车
select 
    count(*) as total,
    par,
    first(app_version)
from dw.dwd_log_track         
where 
  par >= '20230828' 
  and par <= '20230905'
  and app_version like '2.%' 
  and app_version > '2.145.4' 

  and event_sign='enterpage'      
  and page_type = 'cart' 
  group by par
  limit 100
-- app_version > '2.145.4' 60w/天
-- 性能埋点 限制路径 20w左右一天


select 
    count(*) as total,
    first(app_version),
    page_path
from dw.dwd_log_track         
where 
  par >= '20230828' 
  and par <= '20230905'
  and app_version like '2.%' 
  and app_version > '2.145.4' 

  and event_sign='enterpage'      
  and page_type = 'cart' 
  group by page_path
  limit 100
  order by total

  -- 购物车路由
  	pages/tab/two/index
pages/tab/three/index	
pages/tab/one/index
select 
  avg(render_diff) as Avg,
  approx_percentile(render_diff,0.8) as P80,
  count(page_name) as total,
  page_name
from dm_hummer.tee_pf_base_log
where 
  par >= '20230801' 
  and par <= '20230905'
  and params['bv'] like '2.%' 
  and params['bv'] > '2.145.4' 
  and 

   (
      (page_name = 'home-dashboard' and page_path = 'pages/home/dashboard/index')
      or (page_name = 'goods-detail' and page_path = 'pages/goods/detail/index')
      or (page_name = 'order-init' and page_path = 'packages/trade-buy/order/buy/index')
      or (page_name = 'trade-cart' and page_path in ('pages/tab/three/index', 	'pages/tab/two/index', 'packages/trade-cart/cart/index'))
      or (page_name in('usercenter', 'goods-list', 'goods-group', 'search-result', 'search-page'))
   )
  and kdt_id = '17247866'
  and render_diff < 200000
group by page_name
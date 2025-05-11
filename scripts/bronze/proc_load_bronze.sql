create or replace procedure bronze.load_bronze()
language plpgsql
as $$
begin

	truncate table bronze.crm_cust_info;

	copy bronze.crm_cust_info (cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date) 
	from '/var/lib/pgsql/datasets/source_crm/cust_info.csv' 
	delimiter ',' 
	csv header;

	truncate table bronze.crm_prd_info;

	copy bronze.crm_prd_info (prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt)
	from '/var/lib/pgsql/datasets/source_crm/prd_info.csv'
	delimiter ','
	csv header;

	truncate table bronze.crm_sales_details;

	copy bronze.crm_sales_details (sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price)
	from '/var/lib/pgsql/datasets/source_crm/sales_details.csv'
	delimiter ','
	csv header;

	truncate table bronze.erp_cust_az12;

	copy bronze.erp_cust_az12 (cid, bdate, gen) 
	from '/var/lib/pgsql/datasets/source_erp/CUST_AZ12.csv'
	delimiter ','
	csv header;

	truncate table bronze.erp_loc_a101;

	copy bronze.erp_loc_a101 (cid, cntry) 
	from '/var/lib/pgsql/datasets/source_erp/LOC_A101.csv'
	delimiter ','
	csv header;

	truncate table bronze.erp_px_cat_g1v2;

	copy bronze.erp_px_cat_g1v2 (id, cat, subcat, maintenance) 
	from '/var/lib/pgsql/datasets/source_erp/PX_CAT_G1V2.csv'
	delimiter ','
	csv header;

end;
$$;

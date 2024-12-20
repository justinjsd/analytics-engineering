WITH source AS 
    (
        SELECT 
            c.customer_id
            , c.company                 AS customer_company
            , c.last_name               AS customer_last_name
            , c.first_name              AS customer_first_name
            , c.email_address           AS customer_email_address
            , c.job_title               AS customer_job_title
            , c.business_phone          AS customer_business_phone
            , c.home_phone              AS customer_home_phone
            , c.mobile_phone            AS customer_mobile_phone
            , c.fax_number              AS customer_fax_number
            , c.address                 AS customer_address
            , c.city                    AS customer_city
            , c.state_province          AS customer_state_province
            , c.zip_postal_code         AS customer_zip_postal_code
            , c.country_region          AS customer_country_region
            , c.web_page                AS customer_web_page
            , c.notes                   AS customer_notes
            , c.attachments             AS customer_attachments
            , e.employee_id 
            , e.company                 AS employee_company
            , e.last_name               AS employee_last_name   
            , e.first_name              AS employee_first_name
            , e.email_address           AS employee_email_address   
            , e.job_title               AS employee_job_title
            , e.business_phone          AS employee_business_phone   
            , e.home_phone              AS employee_home_phone   
            , e.mobile_phone            AS employee_mobile_phone   
            , e.fax_number              AS employee_fax_number  
            , e.address                 AS employee_address   
            , e.city                    AS employee_city   
            , e.state_province          AS employee_state_province   
            , e.zip_postal_code         AS employee_zip_postal_code   
            , e.country_region          AS employee_country_region  
            , e.web_page                AS employee_web_page   
            , e.notes                   AS employee_notes   
            , e.attachments             AS employee_attachments   
            , p.product_id
            , p.product_code
            , p.product_name
            , p.description
            , p.supplier_company
            , p.standard_cost
            , p.list_price
            , p.reorder_level
            , p.target_level
            , p.quantity_per_unit
            , p.discontinued
            , p.minimum_reorder_quantity
            , p.category
            , p.attachments
            , s.order_id
            , s.shipper_id
            , s.quantity
            , s.unit_price
            , s.discount
            , s.status_id
            , s.date_allocated
            , s.purchase_order_id
            , s.inventory_id
            , s.order_date
            , s.shipped_date
            , s.paid_date
            , CURRENT_TIMESTAMP()       AS ingestion_timestamp
            -- date_id
            -- full_date
            -- year
            -- year_week
            -- year_day
            -- fiscal_year
            -- fiscal_qtr
            -- month
            -- month_name
            -- week_day
            -- day_name
            -- day_is_weekday
        FROM    
            {{  ref( 'fact_sales' )}} s
        LEFT JOIN
            {{  ref( 'dim_customer' )}} c
        ON
            c.customer_id = s.customer_id
        LEFT JOIN
            {{  ref( 'dim_employee' )}} e
        ON
            e.employee_id = s.employee_id
        LEFT JOIN
            {{  ref( 'dim_product' )}} p
        ON
            p.product_id = s.product_id
    )
SELECT
    *
FROM 
    source
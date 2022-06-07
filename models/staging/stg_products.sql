WITH source_data AS (
    SELECT
        product_id,
        product_name,	
        supplier_id,	
        category_id,		
        quantity_per_unit AS qty_per_unit,		
        unit_price,		
        CAST(units_in_stock AS INT) AS units_in_stock,		
        units_on_order,		
        reorder_level,		
        CASE
            WHEN discontinued = 0 THEN 'No'
            ELSE 'Yes'
        END AS is_discontinued
    FROM {{ source('northwind_EL','public_products')}}
)

SELECT *
FROM source_data
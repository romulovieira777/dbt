WITH customers AS (
    SELECT
        "ID"            AS customer_id
      , "FIRST_NAME"    AS first_name
      , "LAST_NAME"     AS last_name
    FROM
        public.jaffle_shop_customers
),
orders AS (
    SELECT
        "ID"            AS order_id
      , "USER_ID"       AS customer_id
      , "ORDER_DATE"    AS order_date
      , "STATUS"        AS status
    FROM
        public.jaffle_shop_orders
),
customer_orders AS (
    SELECT
        customer_id
      , MIN(order_date) AS first_order_date
      , MAX(order_date) AS most_recent_order_date
      , COUNT(order_id) AS number_of_orders
    FROM
        orders
    GROUP BY
        customer_id
),
final AS (
    SELECT
        customers.customer_id
      , customers.first_name
      , customers.last_name
      , customer_orders.first_order_date
      , customer_orders.most_recent_order_date
      , COALESCE(customer_orders.number_of_orders, 0) AS number_of_count
    FROM
        customers
    LEFT JOIN
        customer_orders
    USING
        (customer_id)
)
SELECT
    *
FROM
    final
WITH valid_channels AS (
    SELECT 
        advertising_channel,
        MAX(money_spent) AS max_spend
    FROM uber_advertising
    WHERE customers_acquired > 1500
    GROUP BY advertising_channel
)
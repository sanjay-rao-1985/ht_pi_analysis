connection: "conn_pi_db"

# include all the views
include: "/views/**/*.view"

datagroup: ht_pi_analysis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ht_pi_analysis_default_datagroup

explore: quote_explore {
  label: "Quotes"
  from:  quote
  view_label: "Quote"
  view_name: quote

  join: product {
    type: left_outer
    relationship: many_to_one
    from: product
    view_label: "Product"
    sql_on: ${quote.part} = ${product.product};;
  }

  join: customer {
    type: left_outer
    relationship: many_to_one
    from: customer
    view_label: "Customer"
    sql_on: ${quote.customer} = ${customer.customer};;
  }

  join: revenue {
    type: left_outer
    relationship:one_to_many
    from: revenue
    view_label: "Revenue"
    sql_on: ${quote.quote} = ${revenue.quote} AND  ${quote.quoteline} = ${revenue.quoteline};;
  }
}

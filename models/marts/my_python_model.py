def model(dbt, session):

    upstream_model = dbt.ref("orders")

    # Get orders after Feb 2
    filter_df = upstream_model[upstream_model['ORDER_DATE'] >= '2018-02-01']

    # Sort by the order date
    final_df = filter_df.sort('ORDER_DATE',ascending = True)

    return final_df

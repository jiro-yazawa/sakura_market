$("#product_<%= @product.position %>").replaceWith('<%=j render "products/products_list", product: @product %>')
$("#product_<%= @target.position %>").replaceWith('<%=j render "products/products_list", product: @target %>')

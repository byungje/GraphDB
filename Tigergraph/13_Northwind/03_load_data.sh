#!/bin/bash

gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_categories USING v_categories="/home/tigergraph/13_Northwind/data/categories.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_customers USING v_customers="/home/tigergraph/13_Northwind/data/customers.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_employee_territories USING v_employee_territories="/home/tigergraph/13_Northwind/data/employee_territories.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_order_details USING v_order_details="/home/tigergraph/13_Northwind/data/order_details.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_employees USING v_employees="/home/tigergraph/13_Northwind/data/employees.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_orders USING v_orders="/home/tigergraph/13_Northwind/data/orders.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_products USING v_products="/home/tigergraph/13_Northwind/data/products.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_regions USING v_regions="/home/tigergraph/13_Northwind/data/regions.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_shippers USING v_shippers="/home/tigergraph/13_Northwind/data/shippers.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_suppliers USING v_suppliers="/home/tigergraph/13_Northwind/data/suppliers.csv"'
gsql -g Northwind -p 1120 'RUN LOADING JOB load_job_territories USING v_territories="/home/tigergraph/13_Northwind/data/territories.csv"'

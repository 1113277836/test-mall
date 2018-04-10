package com.hwua.admin.service;

import com.hwua.common.po.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    public List<Product> queryAllProduct();

    public Product querry(Integer id);
    public int addProduct(Product product);

    public int updateProduct(Product product);

    public int deleteProduct(Integer id);

    public int sxj(Integer id);

    public int sj(Integer id);

    public List<Product>search(String name);

    public int queryProductCount();

    public int queryOrdersCount();

    public List<Map<String,Object>>queryAllOrders();

    public int updateOrdersStatus(Integer status, Integer id);
}

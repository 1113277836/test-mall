package com.hwua.common.dao;

import com.hwua.common.po.Product;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    public int addProduct(Product product);

    public int updateProduct(Product product);

    public int deleteProduct(Integer id);

    public int xj(Integer id);
    public int sj(Integer id);

    public List<Map<String,Object>> queryAll();

    public List<Product>queryAllProduct();

    public List<Map<String,Object>>queryById(Integer id);

    public List<Product>queryByCid(Integer id);

    public List<Product> queryByBCid(Integer cid, Integer bid);

    public Product query(Integer id);

    public List<Product>queryOrder();

    public List<Product>queryMoHu(String name);

    public int addCart(Map<String, Object> map);

    public int addOrders(Map<String, Object> map);

    public int updateOrdersTime(Map<String, Object> map);

    public int addOrders_detail(Map<String, Object> map);

    public Map<String,Object>queryCardId();

    public List<Map<String,Object>>queryCartByMid(Integer id);

    public List<Map<String,Object>>queryOrdersId(Integer id);

    public List<Map<String,Object>>queryOrdersByOid(Integer id);

    public Map<String,Object>queryCartByPid(Integer id);

    public Map<String,Object>queryOrders_detailByPid(Integer id);

    public int updateCount1(Integer id);

    public int updateCount(Integer count, Integer id);

    public int deleteCart(Integer id);

    public int deleteOrders_detail(Integer id);

    public Map<String,Object>sm(Integer id);

    public Map<String,Object>smCart(Integer id);

    public int updateOrdersStatus(Integer status, Integer id);

    public List<Map<String,Object>>queryAllCart(Integer id);

    public List<Map<String,Object>>queryOrders(Integer id);

    public int queryProductCount();

    public int queryOrdersCount();

    public List<Map<String,Object>>queryAllOrders();














}

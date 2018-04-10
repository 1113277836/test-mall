package com.hwua.front.service.impl;


import com.hwua.common.dao.ProductMapper;
import com.hwua.common.po.Product;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> query() {
        //查询所有分类
        List<Map<String, Object>> maps = productMapper.queryAll();
        //准备数据模型
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        //遍历所有分类
        for (Map<String, Object> map : maps) {
            //准备一个map
            Map<String, Object> map1 = new HashMap<String, Object>();
            //获取分类的id
            Integer cid = (Integer) map.get("ID");
            System.out.println("cid = " + cid);
            //根据分类id查分类下的品牌
            List<Map<String, Object>> maps1 = productMapper.queryById(cid);
            map1.put("category", map);
            map1.put("brand", maps1);
            list.add(map1);

        }
        return list;

    }

    @Override
    public List<Product> queryByCid(Integer id) {
        return productMapper.queryByCid(id);
    }

    @Override
    public List<Product> queryByBCid(Integer cid, Integer bid) {
        return productMapper.queryByBCid(cid, bid);
    }

    @Override
    public Product query(Integer id) {
        return productMapper.query(id);
    }

    @Override
    public List<Product> queryOrder() {
        return productMapper.queryOrder();
    }

    @Override
    public List<Product> queryMoHu(String name) {
        return productMapper.queryMoHu(name);
    }

    @Override
    public int addCart(Map<String, Object> map) {
        return productMapper.addCart(map);
    }

    @Override
    public int addOrders(Map<String, Object> map) {
        return productMapper.addOrders(map);
    }

    @Override
    public int updateOrdersTime(Map<String, Object> map) {
        return productMapper.updateOrdersTime(map);
    }

    @Override
    public int addOrders_detail(Map<String, Object> map) {
        return productMapper.addOrders_detail(map);
    }

    @Override
    public Map<String, Object> queryCardId() {
        return productMapper.queryCardId();
    }

    @Override
    public List<Map<String, Object>> queryCartByMid(Integer id) {
        return productMapper.queryCartByMid(id);
    }

    @Override
    public List<Map<String, Object>> queryOrdersId(Integer id) {
        return productMapper.queryOrdersId(id);
    }

    @Override
    public List<Map<String, Object>> queryOrdersByOid(Integer id) {
        return productMapper.queryOrdersByOid(id);
    }

    @Override
    public Map<String, Object> queryCartByPid(Integer id) {
        return productMapper.queryCartByPid(id);
    }

    @Override
    public Map<String, Object> queryOrders_detailByPid(Integer id) {
        return productMapper.queryOrders_detailByPid(id);
    }

    @Override
    public int updateCount1(Integer id) {
        return productMapper.updateCount1(id);
    }

    @Override
    public int updateCount(Integer count, Integer id) {
        return productMapper.updateCount(count, id);
    }

    @Override
    public int deleteCart(Integer id) {
        return productMapper.deleteCart(id);
    }

    @Override
    public int deleteOrders_detail(Integer id) {
        return productMapper.deleteOrders_detail(id);
    }

    @Override
    public Map<String, Object> sm(Integer id) {
        return productMapper.sm(id);
    }

    @Override
    public Map<String, Object> smCart(Integer id) {
        return productMapper.smCart(id);
    }

    @Override
    public int updateOrdersStatus(Integer status, Integer id) {
        return productMapper.updateOrdersStatus(status, id);
    }

    @Override
    public List<Map<String, Object>> queryAllCart(Integer id) {
        return productMapper.queryAllCart(id);
    }

    @Override
    public List<Map<String, Object>> queryOrders(Integer id) {
        return productMapper.queryOrders(id);
    }

}

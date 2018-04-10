package com.hwua.admin.service.impl;

import com.hwua.admin.service.ProductService;
import com.hwua.common.dao.ProductMapper;
import com.hwua.common.po.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("productService")
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductMapper productMapper;
    @Override
    public List<Product> queryAllProduct() {
        return productMapper.queryAllProduct();
    }

    @Override
    public Product querry(Integer id) {
        return productMapper.query(id);
    }

    @Override
    public int addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateProduct(product);
    }

    @Override
    public int deleteProduct(Integer id) {
        return productMapper.deleteProduct(id);
    }

    @Override
    public int sxj(Integer id) {
        return productMapper.xj(id);
    }

    @Override
    public int sj(Integer id) {
        return productMapper.sj(id);
    }

    @Override
    public List<Product> search(String name) {
        return productMapper.queryMoHu(name);
    }

    @Override
    public int queryProductCount() {
        return productMapper.queryProductCount();
    }

    @Override
    public int queryOrdersCount() {
        return productMapper.queryOrdersCount();
    }

    @Override
    public List<Map<String, Object>> queryAllOrders() {
        return productMapper.queryAllOrders();
    }

    @Override
    public int updateOrdersStatus(Integer status, Integer id) {
        return productMapper.updateOrdersStatus(status, id);
    }
}

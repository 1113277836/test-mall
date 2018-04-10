package com.hwua.admin.service.impl;

import com.hwua.admin.service.BrandService;
import com.hwua.common.dao.BrandMapper;
import com.hwua.common.po.Brand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("brandService")
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandMapper brandMapper;
    @Override
    public int addBrand(Brand brand) {
        return brandMapper.addBrand(brand);
    }

    @Override
    public int deleteBrand(Integer id) {
        return brandMapper.deleteBrand(id);
    }

    @Override
    public int updateBrand(Brand brand) {
        return brandMapper.updateBrand(brand);
    }

    @Override
    public List<Brand> queryAllBrand() {
        return brandMapper.queryAllBrand();
    }

    @Override
    public int queryBrandCount() {
        return brandMapper.queryBrandCount();
    }

    @Override
    public Brand queryByBrandName(String name) {
        return brandMapper.queryByBrandName(name);
    }
}

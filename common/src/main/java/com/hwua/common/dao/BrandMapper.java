package com.hwua.common.dao;

import com.hwua.common.po.Brand;

import java.util.List;

public interface BrandMapper {
    public int addBrand(Brand brand);
    public int deleteBrand(Integer id);
    public int updateBrand(Brand brand);
    public List<Brand> queryAllBrand();
    public int queryBrandCount();
    public Brand queryByBrandName(String name);
}

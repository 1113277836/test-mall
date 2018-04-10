package com.hwua.admin.service;

import com.hwua.common.po.Brand;

import java.util.List;

public interface BrandService {
    public int addBrand(Brand brand);
    public int deleteBrand(Integer id);
    public int updateBrand(Brand brand);
    public List<Brand> queryAllBrand();
    public int queryBrandCount();
    public Brand queryByBrandName(String name);
}

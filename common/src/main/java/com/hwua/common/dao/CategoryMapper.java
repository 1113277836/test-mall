package com.hwua.common.dao;


import com.hwua.common.po.Category;

import java.util.List;


public interface CategoryMapper {
    public int addCategory(Category category);
    public int deleteCategory(Integer id);
    public int updateCategory(Category category);
    public List<Category> queryAllCategory();
    public int queryCategoryCount();
    public Category queryByCategoryName(String name);
}

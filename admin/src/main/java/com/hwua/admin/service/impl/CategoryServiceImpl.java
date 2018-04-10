package com.hwua.admin.service.impl;

import com.hwua.admin.service.CategoryService;
import com.hwua.common.dao.CategoryMapper;
import com.hwua.common.po.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public int addCategory(Category category) {
        return categoryMapper.addCategory(category);
    }

    @Override
    public int deleteCategory(Integer id) {
        return categoryMapper.deleteCategory(id);
    }

    @Override
    public int updateCategory(Category category) {
        return categoryMapper.updateCategory(category);
    }

    @Override
    public List<Category> queryAllCategory() {
        return categoryMapper.queryAllCategory();
    }

    @Override
    public int queryCategoryCount() {
        return categoryMapper.queryCategoryCount();
    }

    @Override
    public Category queryByCategoryName(String name) {
        return categoryMapper.queryByCategoryName(name);
    }

}

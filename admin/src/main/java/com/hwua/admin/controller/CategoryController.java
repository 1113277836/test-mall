package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.BrandService;
import com.hwua.admin.service.CategoryService;
import com.hwua.common.po.Brand;
import com.hwua.common.po.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BrandService brandService;
    @RequestMapping("/queryAllCategory")
    public String queryAllCategory(Map map){
        List<Category> categories = categoryService.queryAllCategory();
        List<Brand> brands = brandService.queryAllBrand();
        System.out.println("categories = " + categories);
        map.put("categories",categories);
        map.put("brands",brands);
        return "product-add";
    }
    @ResponseBody
    @RequestMapping(value = "/addCategory",produces = "application/json;charset=UTF-8")
    public String addCategory(Category category){
        System.out.println("-------------------------++++++++++++");
        System.out.println("category.getName"+category.getName());
        JSONObject jsonObject = new JSONObject();
        Category category1 = categoryService.queryByCategoryName(category.getName());
        if (category1==null&&category.getName()!=null&&!category.getName().equals(" ")){
            int i = categoryService.addCategory(category);
            if (i>0){
                jsonObject.put("msg",true);
            }else{
                jsonObject.put("msg",false);
            }
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/deleteCategory",produces = "application/json;charset=UTF-8")
    public String deleteCategory(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = categoryService.deleteCategory(id);
        if (i>0){
            jsonObject.put("msg",true);
        }else{
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/updateCategory",produces = "application/json;charset=UTF-8")
    public String updateCategory(Category category){
        JSONObject jsonObject = new JSONObject();
        int i = categoryService.updateCategory(category);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/queryCategory")
    public String queryCategory(Map map){
        List<Category> list = categoryService.queryAllCategory();
        int i = categoryService.queryCategoryCount();
        System.out.println("list = " + list);
        map.put("i",i);
        map.put("list", list);
        return "product-category";
    }

}

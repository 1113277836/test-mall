package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.BrandService;
import com.hwua.common.po.Brand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/brand")
public class BrandController {
    @Autowired
    private BrandService brandService;

    @RequestMapping(value = "/toAddBrand")
    public String toAddBrand(){
        return "product-brand";
    }
    @RequestMapping(value = "/toIndex")
    public String toIndex(){
        return "index";
    }
    @ResponseBody
    @RequestMapping(value = "/addBrand",produces = "application/json;charset=UTF-8")
    public String addBrand(Brand brand){
        System.out.println("-------------------------++++++++++++");
        System.out.println("brand.getName"+brand.getName());
        JSONObject jsonObject = new JSONObject();
        Brand brand1 = brandService.queryByBrandName(brand.getName());
        if (brand1==null&&brand.getName()!=null&&!brand.getName().equals(" ")){
            int i = brandService.addBrand(brand);
            if (i>0){
                jsonObject.put("msg",true);
            }else{
                jsonObject.put("msg",false);
            }
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/deleteBrand",produces = "application/json;charset=UTF-8")
    public String deleteBrand(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = brandService.deleteBrand(id);
        if (i>0){
            jsonObject.put("msg",true);
        }else{
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/updateBrand",produces = "application/json;charset=UTF-8")
    public String updateBrand(Brand brand){
        JSONObject jsonObject = new JSONObject();
        int i = brandService.updateBrand(brand);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/queryAllBrand")
    public String queryAllBrand(Map map){
        int i = brandService.queryBrandCount();
        List<Brand> list = brandService.queryAllBrand();
        System.out.println("list = " + list);
        map.put("i",i);
         map.put("list", list);
        return "product-brand";
    }
}

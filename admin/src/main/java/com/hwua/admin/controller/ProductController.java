package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.BrandService;
import com.hwua.admin.service.CategoryService;
import com.hwua.admin.service.ProductService;
import com.hwua.common.po.Brand;
import com.hwua.common.po.Category;
import com.hwua.common.po.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BrandService brandService;

    @RequestMapping(value = "/queryAllProduct")
    public String queryAllProduct(Map map,String name){
        if (name!=null){
            List<Product> list = productService.search(name);
            map.put("list",list);
        }else {
            List<Product> list = productService.queryAllProduct();
            int i = productService.queryProductCount();
            map.put("i",i);
            map.put("list",list);
        }
        return "product-list";
    }
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public String queryOneProduct(Map map,Integer id){
        List<Category> categories = categoryService.queryAllCategory();
        List<Brand> brands = brandService.queryAllBrand();
        System.out.println("categories = " + categories);
        map.put("categories",categories);
        map.put("brands",brands);
        System.out.println("id = " + id);
        Product product = productService.querry(id);
        System.out.println("product = " + product);
        map.put("product",product);
        return "product-add";
    }

    @RequestMapping(value = "/addOrUpdateProduct")
    public String addProduct(Product product, MultipartFile file, HttpServletRequest request) throws Exception{
        if (product.getId() != null) {
            if(product.getPicture()!=null){
                InputStream is = file.getInputStream();
                String filename = file.getOriginalFilename();
                String path = request.getServletContext().getRealPath("/static/images");
                String substring = path.substring(41);
                String img = substring + File.separator + filename;
                File saveFile = new File(path + File.separator + filename);
                File parentFile = saveFile.getParentFile();
                if (!parentFile.exists()) {
                    parentFile.mkdirs();
                }
                OutputStream os = new FileOutputStream(saveFile);
                int len = -1;
                byte[] bytes = new byte[1024];
                while ((len = is.read(bytes)) != -1) {
                    os.write(bytes, 0, len);
                }
                os.close();
                is.close();
                product.setPicture(img);
            }else {
                Product product1 = productService.querry(product.getId());
                product.setPicture(product1.getPicture());
            }
            /*修改*/
            int i = productService.updateProduct(product);
            System.out.println("i = " + i);
        } else {
            InputStream is = file.getInputStream();
            String filename = file.getOriginalFilename();
            String path = request.getServletContext().getRealPath("/static/images");
            String substring = path.substring(41);
            String img = substring + File.separator + filename;
            File saveFile = new File(path + File.separator + filename);
            File parentFile = saveFile.getParentFile();
            if (!parentFile.exists()) {
                parentFile.mkdirs();
            }
            OutputStream os = new FileOutputStream(saveFile);
            int len = -1;
            byte[] bytes = new byte[1024];
            while ((len = is.read(bytes)) != -1) {
                os.write(bytes, 0, len);
            }
            os.close();
            is.close();
            product.setPicture(img);
            int i = productService.addProduct(product);
            System.out.println("i = " + i);
        }
        /*JSONObject jsonObject = new JSONObject();
        if (product.getId()==null){
            int i = productService.addProduct(product);
            if (i>0){
                jsonObject.put("msg","添加成功");
            }else {
                jsonObject.put("msg","添加失败");
            }
        }else {
            int i = productService.updateProduct(product);
            if (i>0){
                jsonObject.put("msg","修改成功");
            }else {
                jsonObject.put("msg","修改失败");
            }
        }*/
        return "redirect:queryAllProduct";
    }
    @ResponseBody
    @RequestMapping(value = "/deleteProduct")
    public String deleteProduct(Integer id){
        System.out.println("-------------");
        System.out.println("id = " + id);
        System.out.println("----------=--=-=");
        JSONObject jsonObject = new JSONObject();
        int i = productService.deleteProduct(id);
        if (i>0){
            jsonObject.put("msg","删除成功");
        }else {
            jsonObject.put("msg","删除失败");
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/xj")
    public String sxj(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = productService.sxj(id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/sj")
    public String xj(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = productService.sj(id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/queryAllOrders")
    public String queryAllOrders(Map map){
        List<Map<String, Object>> maps = productService.queryAllOrders();
        int i = productService.queryOrdersCount();
        map.put("i",i);
        map.put("maps",maps);
        return "orders";
    }
    @ResponseBody
    @RequestMapping("/fh")
    public String fh(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = productService.updateOrdersStatus(2, id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping("/qx")
    public String qx(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = productService.updateOrdersStatus(3, id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }


}

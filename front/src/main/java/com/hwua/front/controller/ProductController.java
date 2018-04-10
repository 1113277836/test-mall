package com.hwua.front.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.common.po.Product;
import com.hwua.front.service.MemberService;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/addOrders_detail")
    public String addOrders_detail(HttpServletRequest req){
        int mid = Integer.parseInt(req.getSession().getAttribute("mid").toString());
        System.out.println("mid = " + mid);
        Map<String, Object> sm = productService.smCart(mid);
        System.out.println("sm = " + sm);
        Double price = (Double) sm.get("s");
        HashMap<String, Object> map3 = new HashMap<String, Object>();
        Integer aid = Integer.parseInt(req.getParameter("aid"));
        map3.put("mid",mid);
        map3.put("price",price);
        map3.put("aid",aid);
        System.out.println("---------");
        System.out.println(aid);
        System.out.println("==============");
        map3.put("create_time",new Timestamp(System.currentTimeMillis()));
        int i1 = productService.addOrders(map3);
        Integer oid = (Integer)map3.get("id");
        req.getSession().setAttribute("oid",oid);
        List<Map<String, Object>> maps = productService.queryAllCart(mid);
        for (Map<String,Object>map:maps) {
            int pid = Integer.parseInt(map.get("pid").toString());
            int count = Integer.parseInt(map.get("count").toString());
            HashMap<String, Object> map1 = new HashMap<String, Object>();
            map1.put("oid",oid);
            map1.put("pid",pid);
            map1.put("count",count);
            int i = productService.addOrders_detail(map1);
            int dele = productService.deleteCart(pid);
            req.setAttribute("oid",oid);
        }
            return"order";
    }

    @RequestMapping(value = "/addCart",produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
    public String addCart(HttpServletRequest req){
        JSONObject jsonObject = new JSONObject();
        int pid = Integer.parseInt(req.getParameter("pid"));
        System.out.println("pid = " + pid);
        int mid = Integer.parseInt(req.getSession().getAttribute("mid").toString());
        Map<String, Object> map = productService.queryCartByPid(pid);
        System.out.println("map = " + map);
        HashMap<String, Object> map1 = new HashMap<String, Object>();
        map1.put("pid",pid);
        map1.put("mid",mid);
        map1.put("count",1);
        if (map==null){
            int i = productService.addCart(map1);
            System.out.println("i = " + i);
            if(i==1){
                //成功
                jsonObject.put("msg","添加成功");
            }else {
                //不成功
                jsonObject.put("msg","添加失败");
            }
        }else{
            int j = productService.updateCount1(pid);
            System.out.println("j = " + j);
            if(j==1){
                //成功
                jsonObject.put("msg","添加成功");
            }else {
                //不成功
                jsonObject.put("msg","添加失败");
            }
        }
        return jsonObject.toJSONString();

    }

    @RequestMapping(value = "/deleteOrders_detail")
    public String deleteOrders_detail(HttpServletRequest req){
        int oid = Integer.parseInt(req.getParameter("oid"));
        productService.deleteOrders_detail(oid);
        return "order";
    }
    @ResponseBody
    @RequestMapping(value = "/deleteCart",produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
    public String deleteCart(HttpServletRequest req){
        JSONObject jsonObject = new JSONObject();
        int pid = Integer.parseInt(req.getParameter("pid"));
        System.out.println("pid = " + pid);
        int i = productService.deleteCart(pid);
        req.setAttribute("pid",pid);
        if(i==1){
            //成功
            jsonObject.put("msg","删除成功");
        }else {
            //不成功
            jsonObject.put("msg","删除失败");
        }
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "/list")
    public String list(HttpServletRequest req){
        List<Product> list = productService.queryOrder();
        req.setAttribute("list",list);
        return "index";
    }

    @RequestMapping(value = "/pay")
    public String pay(HttpServletRequest req){
       // JSONObject jsonObject = new JSONObject();
        int id = Integer.parseInt(req.getParameter("id"));
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("pay_time",new Timestamp(System.currentTimeMillis()));
        hashMap.put("id",id);
        int i = productService.updateOrdersTime(hashMap);
        int i1 = productService.updateOrdersStatus(1, id);
        return "order";
    }
    @RequestMapping(value = "/abandon")
    public String abandon(HttpServletRequest req){
        int id = Integer.parseInt(req.getParameter("id"));
        int i1 = productService.updateOrdersStatus(2, id);
        return "pay";
    }

    @RequestMapping(value = "/queryByBCid")
    public String queryProduct(HttpServletRequest req){
        Integer cid =Integer.parseInt(req.getParameter("cid")) ;
        Integer bid =Integer.parseInt(req.getParameter("bid")) ;
        List<Product> maps = productService.queryByBCid(cid, bid);
        System.out.println(JSON.toJSONString(maps));
        req.setAttribute("maps",maps);
        return "wishlistt";
    }

    @RequestMapping(value = "/queryByCid")
    public String queryByCid(HttpServletRequest req){
        Integer id = Integer.parseInt(req.getParameter("id"));
        List<Product> maps = productService.queryByCid(id);
        req.setAttribute("maps",maps);
        return "wishlist";
    }

    @RequestMapping(value = "/queryCartByMid")
    public String queryCartByMid(HttpServletRequest req){
        int mid = Integer.parseInt(req.getSession().getAttribute("mid").toString());
        System.out.println("mid = " + mid);
        List<Map<String, Object>> list = productService.queryCartByMid(mid);
        System.out.println("list = " + list);
        req.setAttribute("list",list);
        return "cart";
    }

    @RequestMapping(value = "/queryOrdersByOid")
    public String queryOrdersByOid(HttpServletRequest req){
        Integer oid = Integer.parseInt(req.getParameter("oid"));
        System.out.println("oid = " + oid);
        List<Map<String, Object>> list = productService.queryOrdersByOid(oid);
        System.out.println("list = " + list);
        req.setAttribute("list",list);
        return "order";
    }

    @RequestMapping(value = "/query")
    public String query(HttpServletRequest req){
        Integer id = Integer.parseInt(req.getParameter("id"));
        Product map = productService.query(id);
        req.setAttribute("map",map);
        return "product";
    }

    @RequestMapping(value = "/search",produces = "application/json;charset=UTF-8")
    public String search(HttpServletRequest req){
        String value = req.getParameter("value");
        List<Product> list = productService.queryMoHu(value);
        System.out.println("list = " + list);
        req.setAttribute("list",list);
        return "mohu";
    }
    @ResponseBody
    @RequestMapping(value = "/setCart",produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
    public String setCart(HttpServletRequest req){
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int pid = Integer.parseInt(req.getParameter("pid"));
        System.out.println("quantity = " + quantity);
        System.out.println("pid = " + pid);
        Double price = Double.parseDouble(req.getParameter("price")) ;
        System.out.println("price = " + price);
        JSONObject jsonObject = new JSONObject();
        int i = productService.updateCount(quantity, pid);
        int mid = Integer.parseInt(req.getSession().getAttribute("mid").toString());
        System.out.println("mid = " + mid);
        Map<String, Object> smCart = productService.smCart(mid);
        System.out.println("smCart = " + smCart);
        Double s = Double.parseDouble(smCart.get("s").toString());
        System.out.println("s = " + s);
        double o = quantity*price;

        if(i==1){
            //成功
            jsonObject.put("msg",o);
            jsonObject.put("sm",s);
        }else {
            //不成功
            jsonObject.put("msg","不成功");
        }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/queryOrders",produces = "application/json;charset=UTF-8")
    public String queryOrders(HttpServletRequest req){
        Integer mid = (Integer)req.getSession().getAttribute("mid");
        List<Map<String, Object>> maps = productService.queryOrders(mid);
        List<Map<String, Object>> maps1 = memberService.queryAllAddress(mid);
        System.out.println("maps = " + maps);
        req.setAttribute("maps1",maps1);
        req.setAttribute("maps",maps);
        return "orders";
    }
    @ResponseBody
    @RequestMapping("/qxdd")
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
    @RequestMapping(value = "/addAddress")
    public String addAddress(HttpServletRequest req){
        Integer mid = (Integer) req.getSession().getAttribute("mid");
        String name = req.getParameter("name");
        System.out.println("name = " + name);
        String addre = req.getParameter("addre");
        System.out.println("addre = " + addre);
        String aid = req.getParameter("aid");
        System.out.println("aid = " + aid);
        HashMap<String, Object> hashMap = new HashMap<String,Object>();
        hashMap.put("mid",mid);
        hashMap.put("name",name);
        hashMap.put("addre",addre);
        hashMap.put("aid",aid);
        int i = memberService.addAddress(hashMap);
        return "redirect:queryOrders";
    }

}

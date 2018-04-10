package com.hwua.front.listener;

import com.alibaba.fastjson.JSON;
import com.hwua.front.service.ProductService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;
import java.util.Map;


@WebListener
public class ContextLoaderListener implements ServletContextListener{


    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //1.获取ServletContext
        ServletContext servletContext = servletContextEvent.getServletContext();
        //2.获取Spring的ApplicationContext
        WebApplicationContext ctx = WebApplicationContextUtils.
                getWebApplicationContext(servletContext);
        //3.从IOC容器中获取需要使用的Service
        ProductService productService = ctx.getBean(ProductService.class);
        //4.调用Service中的方法查询需要的数据
        List<Map<String, Object>> CBs = productService.query();
        System.out.println("----------------------------------");
        System.out.println("JSON.toJSONString(cbs) = " + JSON.toJSONString(CBs));
        System.out.println("------------------------------------");
        //5.将查询到的数据放入application作用域
        servletContext.setAttribute("CBs",CBs);


    }


    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}

package com.project.demo.controller;

import com.project.demo.entity.ArticleType;
import com.project.demo.service.ArticleTypeService;

import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

/**
 * 文章频道：用于汇总浏览文章，在不同频道下展示不同文章。(ArticleType)表控制层
 * <p>
 * 本类继承基础控制器，提供文章频道相关的RESTful API接口，
 * 通过@RequestMapping注解定义基础请求路径为/article_type
 * 
 * @RestController 标注该类为RESTful控制器，自动将返回对象序列化为JSON
 */
@RestController
@RequestMapping("article_type")
public class ArticleTypeController extends BaseController<ArticleType, ArticleTypeService> {
    
    /**
     * 服务对象
     * <p>
     * 通过构造器注入方式自动装配ArticleTypeService服务实例，
     * 并调用父类setService()方法完成服务设置
     * 
     * @param service 文章频道服务层实例（由Spring自动注入）
     * @Autowired 自动进行依赖注入，省略显式配置
     */
    // 自动注入ArticleTypeService
    @Autowired
    public ArticleTypeController(ArticleTypeService service) {
        // 设置service
        setService(service);
    }

}



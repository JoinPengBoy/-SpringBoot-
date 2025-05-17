package com.project.demo.controller;

import com.project.demo.entity.JobType;
import com.project.demo.service.JobTypeService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;


/**
 * 岗位类型：(JobType)表控制层
 *
 */
@RestController
@RequestMapping("/job_type")
public class JobTypeController extends BaseController<JobType, JobTypeService> {

    /**
     * 岗位类型对象
     */
    @Autowired
    public JobTypeController(JobTypeService service) {
        setService(service);
    }



    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }


}

package com.project.demo.controller;

import com.project.demo.entity.InterviewNotice;
import com.project.demo.service.InterviewNoticeService;
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
 * 面试通知：(InterviewNotice)表控制层
 *
 */
@RestController
@RequestMapping("/interview_notice")
public class InterviewNoticeController extends BaseController<InterviewNotice, InterviewNoticeService> {

    /**
     * 面试通知对象
     */
    @Autowired
    public InterviewNoticeController(InterviewNoticeService service) {
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

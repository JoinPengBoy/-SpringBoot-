package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 面试通知：(InterviewNotice)表实体类
 *
 */
@TableName("`interview_notice`")
@Data
@EqualsAndHashCode(callSuper = false)
public class InterviewNotice implements Serializable {

    // InterviewNotice编号
    @TableId(value = "interview_notice_id", type = IdType.AUTO)
    private Integer interview_notice_id;

    // 招聘标题
    @TableField(value = "`recruitment_title`")
    private String recruitment_title;
    // 企业名称
    @TableField(value = "`enterprise_name`")
    private String enterprise_name;
    // 企业用户
    @TableField(value = "`enterprise_users`")
    private Integer enterprise_users;
    // 岗位类型
    @TableField(value = "`job_type`")
    private String job_type;
    // 投放用户
    @TableField(value = "`target_users`")
    private Integer target_users;
    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 邀请时间
    @TableField(value = "`invitation_time`")
    private Timestamp invitation_time;
    // 面试须知
    @TableField(value = "`interview_notice`")
    private String interview_notice;
    // 面试地点
    @TableField(value = "`interview_location`")
    private String interview_location;
    // 面试状态
    @TableField(value = "`interview_status`")
    private String interview_status;
    // 面试分数
    @TableField(value = "`interview_score`")
    private Double interview_score;
    // 面试评语
    @TableField(value = "`interview_comments`")
    private String interview_comments;




















		// 来源表
	@TableField(value = "source_table")
	private String source_table;
	
	// 来源ID
	@TableField(value = "source_id")
	private Integer source_id;
	
	// 来源用户ID
	@TableField(value = "source_user_id")
	private Integer source_user_id;
		


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}

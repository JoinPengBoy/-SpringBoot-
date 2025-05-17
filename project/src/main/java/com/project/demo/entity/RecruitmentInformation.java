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
 * 招聘信息：(RecruitmentInformation)表实体类
 *
 */
@TableName("`recruitment_information`")
@Data
@EqualsAndHashCode(callSuper = false)
public class RecruitmentInformation implements Serializable {

    // RecruitmentInformation编号
    @TableId(value = "recruitment_information_id", type = IdType.AUTO)
    private Integer recruitment_information_id;

    // 招聘标题
    @TableField(value = "`recruitment_title`")
    private String recruitment_title;
    // 企业名称
    @TableField(value = "`enterprise_name`")
    private String enterprise_name;
    // 企业用户
    @TableField(value = "`enterprise_users`")
    private Integer enterprise_users;
    // 注册资本
    @TableField(value = "`registered_capital`")
    private String registered_capital;
    // 岗位类型
    @TableField(value = "`job_type`")
    private String job_type;
    // 封面图片
    @TableField(value = "`cover_photo`")
    private String cover_photo;
    // 薪资金额
    @TableField(value = "`salary_amount`")
    private String salary_amount;
    // 需求专业
    @TableField(value = "`professional_requirements`")
    private String professional_requirements;
    // 工作地点
    @TableField(value = "`work_location`")
    private String work_location;
    // 招聘职位
    @TableField(value = "`recruitment_positions`")
    private String recruitment_positions;
    // 招聘详情
    @TableField(value = "`recruitment_details`")
    private String recruitment_details;


    // 点赞数
    @TableField(value = "praise_len")
    private Integer praise_len;

    // 收藏数
    @TableField(value = "collect_len")
    private Integer collect_len;

    // 评论数
    @TableField(value = "comment_len")
    private Integer comment_len;















		// 投放简历限制次数
	@TableField(value = "resume_information_limit_times")
	private String resume_information_limit_times;
	
		


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}

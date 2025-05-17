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
 * 简历信息：(ResumeInformation)表实体类
 *
 */
@TableName("`resume_information`")
@Data
@EqualsAndHashCode(callSuper = false)
public class ResumeInformation implements Serializable {

    // ResumeInformation编号
    @TableId(value = "resume_information_id", type = IdType.AUTO)
    private Integer resume_information_id;

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
    // 用户性别
    @TableField(value = "`user_gender`")
    private String user_gender;
    // 用户年龄
    @TableField(value = "`user_age`")
    private String user_age;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 教育背景
    @TableField(value = "`educational_background`")
    private String educational_background;
    // 工作经历
    @TableField(value = "`work_experience`")
    private String work_experience;
    // 投放时间
    @TableField(value = "`placement_time`")
    private Timestamp placement_time;
    // 简历附件
    @TableField(value = "`resume_attachment`")
    private String resume_attachment;
    // 投放原因
    @TableField(value = "`reason_for_advertising_placement`")
    private String reason_for_advertising_placement;
    // 简历评分
    @TableField(value = "`resume_rating`")
    private String resume_rating;
    // 简历标记
    @TableField(value = "`resume_marking`")
    private String resume_marking;
    // 投放备注
    @TableField(value = "`posting_remarks`")
    private String posting_remarks;





    // 审核状态
    @TableField(value = "examine_state")
    private String examine_state;



    // 审核回复
    @TableField(value = "examine_reply")
    private String examine_reply;











		// 邀请面试限制次数
	@TableField(value = "interview_notice_limit_times")
	private String interview_notice_limit_times;
	
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
